package model;

import action.ActionForward;
import action.UserLoginAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateFormAction extends UserLoginAction {
    @Override
    protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Member mem = new MemberDao().selectOne(id);
        request.setAttribute("mem", mem);
        return new ActionForward(false, "updateForm.jsp");
    }
}
