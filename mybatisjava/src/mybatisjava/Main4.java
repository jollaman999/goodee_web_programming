package mybatisjava;

/*
Mybatis를 인터페이스 방식으로 사용하기
 */

import mapper.StudentMapper3;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main4 {
    private final static String ns = "mapper.StudentMapper3.";
    private static SqlSessionFactory sqlMap;
    static {
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream("mapper/mybatis-config.xml");
        } catch (IOException e) {
            e.printStackTrace();
        }

        sqlMap = new SqlSessionFactoryBuilder().build(inputStream);
    }

    public static void main(String[] args) {
        int result;

        SqlSession session = sqlMap.openSession();
        System.out.println("모든 학생 정보 조회하기");
        List<Student> list = session.getMapper(StudentMapper3.class).select();
        for (Student s : list)
            System.out.println(s);

        System.out.println("\n홍길동 학생 추가하기");
        Student st = new Student();
        st.setStudno(1000);
        st.setName("홍길동");
        st.setId("hongkd");
        st.setJumin("9001011234567");
        result = session.getMapper(StudentMapper3.class).insert(st);
        System.out.println("추가 결과 : " + result);
        list = session.getMapper(StudentMapper3.class).select();
        for (Student s : list)
            System.out.println(s);

        System.out.println("\n이름에 진 문자를 가진 학생의 id를 -jin 추가하도록 수정하기");
        st = new Student();
        st.setName("진");
        st.setId("-jin");
        result = session.getMapper(StudentMapper3.class).update(st);
        System.out.println("수정 결과 : " + result);
        list = session.getMapper(StudentMapper3.class).select();
        for (Student s : list)
            System.out.println(s);

        System.out.println("\n이름이 홍길동이고 학번이 1000번인 학생을 삭제하기");
        Map<String, Object> map = new HashMap<>();
        map.put("name", "홍길동");
        map.put("studno", 1000);
        result = session.getMapper(StudentMapper3.class).delete(map);
        System.out.println("삭제 결과 : " + result);
        list = session.getMapper(StudentMapper3.class).select();
        for (Student s : list)
            System.out.println(s);

        session.commit();
    }
}
