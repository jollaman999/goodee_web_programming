package mapper;

import mybatisjava.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

// mapper.StudentMapper3 네임스페이스의 sql 구문

/*
    interface를 이용하여 mybatis 사용하기
        1. xml을 mybatis-config.xml에 등록해야 함.
            등록되는 xml에 <mapper namespace="패키지명을 포함하는 인터페이스이름과 같아야 한다.">...
            => 인터페이스의 쌍둥이 xml 이라 하자.
        2. 인터페이스의 이름이 네임스페이스다.
        3. 인터페이스의 메서드 이름과 xml 의 id 속성값이 달라야 한다.
            => 중복불가.
 */

public interface StudentMapper3 {
    @Select("select * from student") // mapper.StudentMapper3.select 이름의 sql 구문
    List<Student> select();

    @Insert("insert into student (studno, id, name, jumin) values (#{studno}, #{id}, #{name}, #{jumin})")
    int insert(Student s);

    @Update("update student set id = concat(id, #{id}) where name like '%${name}%'")
    int update(Student s);

    @Delete("delete from student where name = #{name} and studno = #{studno}")
    int delete(Map<String, Object> map);
}
