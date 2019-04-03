package mybatisjava;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main2 {
    public static void main(String[] args) {
        SqlSessionFactory sqlMap = null;
        Reader reader;

        try {
            reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
            // sql 구문을 저장하는 페이지
            sqlMap = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }

        int x = 0;
        // 접속 객체를 리턴
        SqlSession session = sqlMap.openSession();
        x = session.selectOne("student.count");
        System.out.println("student 테이블의 레코드 갯수 : " + x);
        studentlist(session);

        System.out.println("Student 테이블에 레코드 추가하기");
        Student st = new Student();
        st.setStudno(1000);
        st.setName("홍길동");
        st.setGrade(1);
        st.setId("hongkd");
        st.setJumin("123456");
        st.setMajor1(101);
        session.insert("student.insert", st);
        studentlist(session);

        System.out.println("Student 테이블에 학번 1000번인 학생의 정보 수정하기");
        Map<String, Object> map = new HashMap<>();
        map.put("no", 1000);
        map.put("jumin", "9001011000000");
        session.update("student.update", map);
        studentlist(session);

        System.out.println("학번이 1000번인 학생 정보 조회하기");
        st = session.selectOne("student.selectone", 1000);
        System.out.println(st);

        System.out.println("성이 김씨인 학생의 목록 조회하기");
        List<Student> list = session.selectList("student.selectname", "김");
        for (Student s : list)
            System.out.println(s);
        System.out.println("1학년 학생이면서 몸무게가 60이상인 학생의 목록 조회하기");
        map.clear();
        map.put("col1", "grade");
        map.put("col2", "weight");
        map.put("val1", 1);
        map.put("val2", 60);
        list = session.selectList("student.selectcol", map);
        for (Student s : list)
            System.out.println(s);

        System.out.println("101학과의 1학년 학생의 목록 조회하기");
        map.clear();
        map.put("col1", "major1");
        map.put("col2", "grade");
        map.put("val1", 101);
        map.put("val2", 3);
        list = session.selectList("student.selectcol", map);
        for (Student s : list)
            System.out.println(s);

        System.out.println("1000번 학생을 삭제하기");
        session.delete("student.delete", 1000);
        studentlist(session);

        // session.commit();
    }

    private static void studentlist(SqlSession session) {
        List<Student> list = session.selectList("student.list");
        for (Student s : list)
            System.out.println(s);
    }
}
