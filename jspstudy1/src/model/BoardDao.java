package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	public Board selectOne(int num) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setName(rs.getString("name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setRegdate(rs.getTimestamp("regdate"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRef(rs.getInt("ref"));
				b.setReflevel(rs.getInt("reflevel"));
				b.setRefstep(rs.getInt("refstep"));
				
				return b;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int maxnum() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement("select ifnull(max(num), 0) from board");
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return -1;
	}

	public boolean insert(Board board) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into board "
				+ "(num, name, pass, subject, content, file1, regdate, readcnt, ref, reflevel, refstep)"
				+ " values(?,?,?,?,?,?,now(),0,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getPass());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getFile1());
			pstmt.setInt(7, board.getRef());
			pstmt.setInt(8, board.getReflevel());
			pstmt.setInt(9, board.getRefstep());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}
	
	public int boardCount() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	public List<Board> list(int pageNum, int limit) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String sql = "select * from board order by ref desc, refstep asc limit ?, ?";
/*
 * limit 1, 10 : 첫번째 레코드 부터 10개 조회
 * pageNum = 1 => 0번 인덱스 부터 10개 조회.
 * 		limit 10, 10 : 11번째 레코드 부터 10개 조회
 * pageNum = 2 => 10번 인덱스 부터 10개 조회.
 * 		limit 20, 10 : 21번째 레코드 부터 10개 조회
 * pageNum = 3 => 20번 인덱스 부터 10개 조회.
 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  (pageNum - 1) * limit); // 0이면 첫번째 레코드
			pstmt.setInt(2, limit); // 10
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setName(rs.getString("name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setRef(rs.getInt("ref"));
				b.setReflevel(rs.getInt("reflevel"));
				b.setRefstep(rs.getInt("refstep"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getTimestamp("regdate"));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
/*
	public List<Board> list_reply(int ref) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String sql = "select * from board where ref = ? order by ref desc, refstep asc";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setName(rs.getString("name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setRef(rs.getInt("ref"));
				b.setReflevel(rs.getInt("reflevel"));
				b.setRefstep(rs.getInt("refstep"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getTimestamp("regdate"));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public void update_reply(List<Board> list_reply) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;

		try {
			for (int i = 0; i < list_reply.size(); i++) {
				pstmt = conn.prepareStatement("update board set refstep = ? where num = ?");
				pstmt.setInt(1, list_reply.get(i).getRefstep());
				pstmt.setInt(2, list_reply.get(i).getNum());
				pstmt.executeUpdate();
				pstmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
	}
*/
	
	public void refstepadd (int ref, int refstep) {
	    Connection conn = DBConnection.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "update board set refstep = refstep + 1"
	                    + "where ref = ? and refstep > ?";
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, ref);
	        pstmt.setInt(2, refstep);
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBConnection.close(conn, pstmt, null);
	    }
	}
	
	public void readcntadd(int num) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement("update board set readcnt = readcnt + 1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
	}
	
	public boolean update(Board board) {
	    Connection conn = DBConnection.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "update board set name = ?, subject = ?, content = ?, file1 = ? where num = ?";

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, board.getName());
	        pstmt.setString(2, board.getSubject());
	        pstmt.setString(3, board.getContent());
	        pstmt.setString(4, board.getFile1());
	        pstmt.setInt(5, board.getNum());
	        pstmt.executeUpdate();
	        return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBConnection.close(conn, pstmt, null);
	    }
		return false;
	}
	
	public boolean delete(int num) {
	    Connection conn = DBConnection.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "delete from board where num = ?";

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, num);
	        pstmt.executeUpdate();
	        return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBConnection.close(conn, pstmt, null);
	    }
		return false;
	}
}
