package mybatisjava;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

public class Main1 {
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
        x = session.selectOne("member.count");
        System.out.println("member 테이블의 레코드 갯수 : " + x);
        List<Member> list = session.selectList("member.list");
        for (Member m : list)
            System.out.println(m);
    }
}
