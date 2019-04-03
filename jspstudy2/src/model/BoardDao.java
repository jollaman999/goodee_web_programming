package model;

import mapper.BoardMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardDao {
	private static final String ns = "mapper.BoardMapper.";
	private Map<String, Object> map = new HashMap<>();

	public Board selectOne(int num) {
		SqlSession session = DBConnection.getConnection();

		try {
			map.clear();
			map.put("num", num);
			return session.selectOne(ns + "select", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return null;
	}
	
	public int maxnum() {
		SqlSession session = DBConnection.getConnection();

		try {
			return session.getMapper(BoardMapper.class).maxnum();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return -1;
	}

	public int insert(Board board) {
		SqlSession session = DBConnection.getConnection();

		try {
			return session.getMapper(BoardMapper.class).insert(board);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return 0;
	}
	
	public int boardCount(String column, String find) {
		SqlSession session = DBConnection.getConnection();
		String col1 = column;
		String col2 = null;
		try {
			if (column != null) {
				String[] cols = column.split(",");
				col1 = cols[0];
				if (cols.length == 2)
					col2 = cols[1];
			}
			map.clear();
			map.put("column", col1);
			map.put("find", find);
			map.put("col2", col2);
			return session.selectOne(ns + "count", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return 0;
	}
	
	public List<Board> list(int pageNum, int limit, String column, String find, String ignorecase) {
		SqlSession session = DBConnection.getConnection();
		String col1 = column;
		String col2 = null;
		List<Board> list = null;

		try {
			if (column != null) {
				String[] cols = column.split(",");
				col1 = cols[0];
				if (cols.length == 2)
					col2 = cols[1];
			}
			map.clear();
			map.put("pageNum", (pageNum - 1) * limit);
			map.put("limit", limit);
			map.put("column", col1);
			map.put("col2", col2);
			map.put("ignorecase", ignorecase);
			map.put("find", find);
			list = session.selectList(ns + "select", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return list;
	}
	
	public int refstepadd (int ref, int refstep) {
		SqlSession session = DBConnection.getConnection();

		try {
			map.clear();
			map.put("ref", ref);
			map.put("refstep", refstep);
			return session.getMapper(BoardMapper.class).refstepadd(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return 0;
	}
	
	public int readcntadd(int num) {
		SqlSession session = DBConnection.getConnection();

		try {
			map.clear();
			map.put("num", num);
			return session.getMapper(BoardMapper.class).readcntadd(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return 0;
	}
	
	public int update(Board board) {
		SqlSession session = DBConnection.getConnection();

		try {
			return session.getMapper(BoardMapper.class).update(board);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return 0;
	}
	
	public int delete(int num) {
		SqlSession session = DBConnection.getConnection();

		try {
			return session.getMapper(BoardMapper.class).delete(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return 0;
	}
}
