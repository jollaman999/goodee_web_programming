package mybatisjava;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main3 {
    private final static String ns = "student2.";
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
        SqlSession session = sqlMap.openSession();
        System.out.println("학생의 전체 레코드 조회하기");
        List<Student> list = session.selectList(ns + "selectByCondition");
        for (Student s : list)
            System.out.println(s);

        System.out.println("\n1학년 학생의 레코드 조회하기");
        Map<String, Object> map = new HashMap<>();
        map.put("grade", 1);
        list = session.selectList(ns + "selectByCondition", map);
        for (Student s : list)
            System.out.println(s);

        System.out.println("\n학번이 980111 학생의 레코드 조회하기");
        map.clear();
        map.put("studno", 980111);
        Student ss = session.selectOne(ns + "selectByCondition", map);
        System.out.println(ss);

        System.out.println("\n1학년 학생중 키가 180 이상인 학생의 레코드 조회하기");
        map.clear();
        map.put("grade", 1);
        map.put("height", 180);
        //list = session.selectList(ns + "selectByCondition2", map);
        list = session.selectList(ns + "selectByTrim", map);
        for (Student s : list)
            System.out.println(s);

        System.out.println("\n101번 학과, 201번 학과, 301번 학과 학생의 레코드 조회하기");
        List<Integer> majorlist = Arrays.asList(101, 201, 301);
        map.clear();
        map.put("column", "major1");
        map.put("majors", majorlist);
        list = session.selectList(ns + "selectByForeach", map);
        for (Student s : list)
            System.out.println(s);

        System.out.println("\n2학년, 4학년 학생의 레코드 조회하기");
        List<Integer> gradelist = Arrays.asList(2, 4);
        map.clear();
        map.put("column", "grade");
        map.put("grades", gradelist);
        list = session.selectList(ns + "selectByForeach", map);
        for (Student s : list)
            System.out.println(s);
    }
}
