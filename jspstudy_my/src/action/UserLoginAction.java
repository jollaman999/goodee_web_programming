package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class UserLoginAction implements Action {
    protected String login;
    protected String id;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        login = (String)request.getSession().getAttribute("login");
        id = request.getParameter("id");
        String type = null;

        if (request.getRequestURI().contains("delete")) {
            type = "삭제";
        } else if (request.getRequestURI().contains("update")) {
            type = "수정";
        } else {
            type = "조회";
        }

        if (login == null || login.trim().equals("")) {
            request.setAttribute("msg", "로그인 후 이용 가능합니다!");
            request.setAttribute("url", "loginForm.me");

            return new ActionForward(false, "../alert.jsp");
        } else {
            if (!login.equals("admin") && !login.equals(id)) {
                request.setAttribute("msg", "본인 정보만 " + type + "가능합니다.");
                request.setAttribute("url", "main.me");

                return new ActionForward(false, "../alert.jsp");
            }
        }
        return  doExecute(request, response);
    }

    protected abstract ActionForward doExecute (HttpServletRequest request, HttpServletResponse response) throws Exception;
}
