package model;

import mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberDao {
	private static final String ns = "mapper.MemberMapper.";
	private Map<String, Object> map = new HashMap<>();

	public int insert(Member mem) {
		SqlSession session = DBConnection.getConnection();

		try {
			return session.getMapper(MemberMapper.class).insert(mem);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return 0;
	}
	
	public int update(Member mem) {
		SqlSession session = DBConnection.getConnection();

		// id, pass 변경 안됨
		try {
			return session.getMapper(MemberMapper.class).update(mem);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return 0;
	}

	public int updatePass(String id, String pass) {
		SqlSession session = DBConnection.getConnection();

		try {
			map.clear();
			map.put("id", id);
			map.put("pass", pass);
			return session.getMapper(MemberMapper.class).updatePass(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return 0;
	}

	public Member selectOne(String id) {
		SqlSession session = DBConnection.getConnection();

		if (id == null)
			return null;

		try {
			map.clear();
			map.put("id", id);
			return session.selectOne(ns + "select", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return null;
	}
	
	public List<Member> list() {
		SqlSession session = DBConnection.getConnection();
		List<Member> list = null;

		try {
			list = session.selectList(ns + "select");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return list;
	}
	
	public int delete(String id) {
		SqlSession session = DBConnection.getConnection();

		try {
			return session.getMapper(MemberMapper.class).delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return 0;
	}

	public List<Member> searchlist(String column, String find, String ignorecase) {
		SqlSession session = DBConnection.getConnection();
		List<Member> list = null;

		map.clear();
		map.put("column", column);
		map.put("find", find);
		map.put("ignorecase", ignorecase);

		try {
			list = session.selectList(ns + "select", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

		return list;
	}
}