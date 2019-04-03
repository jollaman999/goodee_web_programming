package action;

import model.Member;
import model.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdCheckAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        Member mem = new MemberDao().selectOne(id);

        String msg;

        if (mem != null && id != null && id.length() != 0 && mem.getId().equalsIgnoreCase(id)) {
            msg = id +"는 이미 존재하는 아이디 입니다!";
            request.setAttribute("url", "idcheckForm.me");
            request.setAttribute("duplicated", true);
        } else if (id != null && !id.equals("중복확인을 눌러주세요")) {
            msg = id + "는 사용 가능한 아이디 입니다.";
            request.setAttribute("check_id", true);
        } else {
            return new ActionForward();
        }

        request.setAttribute("msg", msg);

        return new ActionForward(false, "../alert.jsp");
    }
}
