package mapper;

import model.Board;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Map;

public interface BoardMapper {
    @Select("select ifnull(max(num), 0) from board")
    int maxnum();

    @Insert("insert into board "
            + "(num, name, pass, subject, content, file1, regdate, readcnt, ref, reflevel, refstep)"
            + " values(#{num}, #{name}, #{pass}, #{subject}, #{content}, #{file1} ,now(), 0, #{ref}, #{reflevel}, #{refstep})")
    int insert(Board board);

    @Select("select count(*) from board")
    int boardCount();

    @Update("update board set refstep = refstep + 1"
	                    + "where ref = #{ref} and refstep > #{refstep}")
    int refstepadd(Map map);

    @Update("update board set readcnt = readcnt + 1 where num = #{num}")
    int readcntadd(Map map);

    @Update("update board set name = #{name}, subject = #{subject}, content = #{content}, file1 = #{file1} where num = #{num}")
    int update(Board board);

    @Delete("delete from board where num = #{num}")
    int delete(int num);
}
