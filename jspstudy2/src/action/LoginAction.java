package action;

import model.Member;
import model.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
로그인 처리
1. id, pass 파라미터 저장.
2. id 정보로 입력된 pass와 db에 저장된 pass비교
	- id가 없는 경우 : 아이디 없음 메시지 출력. loginForm.jsp 페이지 이동
	- id가 있는 경우
		- 비밀번호 일치 : 로그인 정보 session 저장
					메시지 출력. main.me 페이지 이동
		- 비밀번호 불일치
 */

public class LoginAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        Member mem = new MemberDao().selectOne(id);
        String msg = "해당 아이디 없음";
        String url = "loginForm.me";
        if (mem != null) {
            if (pass.equals(mem.getPass())) {
                msg = mem.getName() + "님이 로그인 했습니다.";
                url = "main.me";
                request.getSession().setAttribute("login", id);
    } else {
        msg = "비밀번호가 틀립니다.";
    }
}
        request.setAttribute("msg", msg);
                request.setAttribute("url", url);
        return new ActionForward(false, "../alert.jsp");
    }
}
