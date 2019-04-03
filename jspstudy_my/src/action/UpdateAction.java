package action;

import model.Member;
import model.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
    update.me 기능
    1. 모든 파라미터를 Member 객체에 저장
    2. 비밀번호 검증
    - 비밀번호 일치 : db수정
    수정 성공 : 수정 성공 메시지 출력. main.me 로 페이지 이동
    수정 실패 : 수정 실패 메시지 출력. updateForm.me 페이지 이동
    - 비밀번호 불일치 : 비밀번호 오류 메시지 출력, updateForm.me로 페이지 이동
*/

public class UpdateAction extends UserLoginAction {
    @Override
    protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Member mem = new Member();
        mem.setId(request.getParameter("id"));
        mem.setPass(request.getParameter("pass"));
        mem.setName(request.getParameter("name"));
        mem.setGender(Integer.parseInt(request.getParameter("gender")));
        mem.setPicture(request.getParameter("picture"));
        mem.setTel(request.getParameter("tel"));
        mem.setEmail(request.getParameter("email"));

        MemberDao dao = new MemberDao();
        Member dbMem = dao.selectOne(mem.getId());

        String msg = null;
        String url = null;

        if (login.equals("admin") || mem.getPass().equals(dbMem.getPass())) {
            if (dao.update(mem) > 0) {
                msg = "수정이 완료되었습니다!";
                url = "main.me";
            } else {
                msg = "수정을 실패하였습니다!";
                url = "updateForm.me?id=" + id;
            }
        } else {
            msg = "비밀번호가 틀립니다!";
            url = "updateForm.me?id=" + id;
        }

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);

        return new ActionForward(false, "../alert.jsp");
    }
}
