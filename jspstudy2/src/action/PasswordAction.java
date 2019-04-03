package action;

import model.Member;
import model.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PasswordAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String login = (String)request.getSession().getAttribute("login");
        MemberDao dao = new MemberDao();
        Member mem = dao.selectOne(login);
        String pass = request.getParameter("pass");
        String chgpass = request.getParameter("chgpass");
        String msg;
        String url;

        if (login == null || login.trim().equals("")) {
            request.setAttribute("msg", "로그인이 필요합니다!");
            request.setAttribute("url", "loginForm.me");
            request.setAttribute("closable", true);
            return new ActionForward(false, "../alert.jsp");
        }

        if (pass.equals(mem.getPass())) {
            if (dao.updatePass(login, chgpass) > 0) {
                msg = "비밀번호를 성공적으로 수정하였습니다.";
                url = "info.me?id=" + login;
                request.setAttribute("closable", true);
            } else {
                msg = "비밀번호를 수정하는데 실패하였습니다!";
                url = "passwordForm.me?id=" + login;
            }
        } else {
            msg = "비밀번호가 틀립니다!";
            url = "passwordForm.me?id=" + login;
        }

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);

        return new ActionForward(false, "../alert.jsp");
    }
}
