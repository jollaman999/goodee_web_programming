package action;

import model.Member;
import model.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InfoAction extends UserLoginAction {
    @Override
    protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Member mem = new MemberDao().selectOne(id);
        request.setAttribute("mem", mem);
        //return new ActionForward(false, "info.jsp");
        return new ActionForward(false, null);
    }
}
