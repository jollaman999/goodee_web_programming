package action;

import model.Member;
import model.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteAction extends UserLoginAction {
    @Override
    protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String pass = request.getParameter("pass");
        MemberDao dao = new MemberDao();
        Member mem = dao.selectOne(id);

        if (id.equals("admin")) {
            request.setAttribute("msg", "관리자는 탈퇴 불가능 합니다.");
            request.setAttribute("url", "main.me");
            return new ActionForward(false, "../alert.jsp");
        }

        if (login.equals("admin") || pass.equals(mem.getPass())) {
            if (dao.delete(id) > 0) {
                request.setAttribute("msg", id + " 회원을 탈퇴시켰습니다.");
                if (login.equals("admin")) {
                    request.setAttribute("url", "list.me");
                } else {
                    request.setAttribute("url", "loginForm.me");
                    request.getSession().invalidate();
                }
            } else {
                request.setAttribute("msg", id + " 회원을 탈퇴하는데 실패하였습니다!");
                if (login.equals("admin")) {
                    request.setAttribute("url", "list.me");
                } else {
                    request.setAttribute("url", "deleteForm.me?id=" + id);
                }
            }
        } else {
            request.setAttribute("msg", "비밀번호가 틀립니다!");
            request.setAttribute("url", "deleteForm.me?id=" + id);
        }

        return new ActionForward(false, "../alert.jsp");
    }
}
