package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 관리자 권한인 업무를 처리해주는 추상클래스 만들기
public abstract class AdminUserAction implements Action {
    protected String login;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        login = (String) request.getSession().getAttribute("login");
        if (login == null || login.trim().equals("")) {
            request.setAttribute("msg", "로그인 후 이용 가능합니다!");
            request.setAttribute("url", "loginForm.me");
            return new ActionForward(false, "../alert.jsp");
        } else if (!login.equals("admin")) {
            request.setAttribute("msg", "관리자만 가능합니다.");
            request.setAttribute("url", "main.me");
            return new ActionForward(false, "../alert.jsp");
        }
        return doExecute(request, response);
    }

    protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
