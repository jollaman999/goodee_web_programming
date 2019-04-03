package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String login = (String)request.getSession().getAttribute("login");
        request.getSession().invalidate();
        String msg = "로그아웃 되었습니다.";
        String url = "loginForm.me";

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);;
        return new ActionForward(false, "../alert.jsp");
    }
}
