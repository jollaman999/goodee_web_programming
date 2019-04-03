package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
 * 1. 파라미터 정보를 Member 객체에 저장
 * 2. Member 객체를 db에 insert
 * 3. 등록 성공 : loginForm.me 페이지 이동
 *    등록 실패 : joinForm.me 페이지 이동
 */
public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setName(request.getParameter("name"));
		mem.setPass(request.getParameter("pass"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setEmail(request.getParameter("email"));
		mem.setTel(request.getParameter("tel"));
		mem.setPicture(request.getParameter("picture"));

		String msg;
		String url;


		if (new MemberDao().insert(mem) > 0) {
			msg = mem.getName() + "님의 회원가입이 완료되었습니다.";
			url = "loginForm.me";
		} else {
			msg = "회원가입이 정상적으로 처리되지 않았습니다!";
			url = "joinForm.me";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return new ActionForward(false, "../alert.jsp");
	}
}
