package action;

import model.Member;
import model.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class SearchAction extends AdminUserAction {
    @Override
    protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //column, find 파라미터 저장하기
        String column = request.getParameter("column");
        String find = request.getParameter("find");
        String ignorecase = request.getParameter("ignorecase");

        if (column != null && column.length() == 0)
            column = null;
        if (find != null && find.length() == 0)
            find = null;

        MemberDao dao = new MemberDao();
        List<Member> list = dao.searchlist(column, find, ignorecase);
        request.setAttribute("list", list);

        return new ActionForward(false, "list.do");
    }
}
