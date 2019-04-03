package mapper;

import model.Member;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import java.util.Map;

public interface MemberMapper {
    @Insert("insert into member (id, pass, name, gender, email, tel, picture) "
        + "values (#{id}, #{pass}, #{name}, #{gender}, #{email}, #{tel}, #{picture})")
    int insert(Member mem);

    @Update("update member set name = #{name}, gender = #{gender}, tel = #{tel}, email = #{email}, picture = #{picture} where id = #{id}")
    int update(Member mem);

    @Update("update member set pass = #{pass} where id = #{id}")
    int updatePass(Map<String, Object> map);

    @Delete("delete from member where id = #{id}")
    int delete(String id);
}
