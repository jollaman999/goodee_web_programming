package chap1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CurrentTime
 */
// Servlet / URL 정보 / 클래스 이름이 아니고 여기에 지정된 이름으로 호출됨
// http://localhost:8080/chap1/CurrentTime 으로 요청된 경우 현재 서블릿 호출
@WebServlet("/CurrentTime") // 어노테이션으로 요청 URL 정의하기
public class CurrentTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurrentTime() { // 생성자
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    // 요청 방식이 GET 방식인 경우 호출되는 메서드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request : 요청객체. 클라이언트 요청 정보를 저장하고 있는 객체
		// response : 응답객체. 클라링언트에 전달 정보를 저장하고 있는 객체
		// text/html : 문서의 종류를 설정하는 방식. MIME 타입 이라고 함. 타입 모를 경우 에라 모르겠다 다운을 해버림.
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf8");
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int min = c.get(Calendar.MINUTE);
		int sec = c.get(Calendar.SECOND);
		PrintWriter out = response.getWriter(); // 목적지가 브라우저인 출력 스트림
		out.println("<html><head><title>현재시간</title></head>");
		out.println("<body>");
		out.println("<h1>현재 시각은 " + hour + "시" + min + "분" +
				sec + "초 입니다.</h1></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// 요청 방식이 POST 방식인 경우 호출되는 메서드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
