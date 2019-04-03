package action;

import com.oreilly.servlet.MultipartRequest;
import model.Board;
import model.BoardDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BoardAllAction {
    private BoardDao dao = new BoardDao();

    public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("hello", "Hello, World");
        return new ActionForward();
    }

    public ActionForward write(HttpServletRequest request, HttpServletResponse response) {
        String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
        MultipartRequest multi = null;

        try {
            multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8");

            Board b = new Board();

            b.setName(multi.getParameter("name"));
            b.setPass(multi.getParameter("pass"));
            b.setSubject(multi.getParameter("subject"));
            b.setContent(multi.getParameter("content"));
            b.setFile1(multi.getFilesystemName("file1"));

            int num = dao.maxnum();
            b.setNum(++num);
            b.setRef(num);

            if (dao.insert(b) > 0) {
                request.setAttribute("msg", "게시물 등록 성공");
                request.setAttribute("url", "list.do");
            } else {
                request.setAttribute("msg", "게시물 등록 실패");
                request.setAttribute("url", "writeForm.do");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return new ActionForward(false, "../alert.jsp");
    }

    public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
        int pageNum = 1;
        try {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        } catch (NumberFormatException e) {}

        int limit = 13;
        BoardDao dao = new BoardDao();

        String column = request.getParameter("column");
        String find = request.getParameter("find");
        String ignorecase = request.getParameter("ignorecase");
        if (column != null && column.length() == 0)
            column = null;
        if (find != null && find.length() == 0)
            find = null;

        int boardcount = dao.boardCount(column, find); // 등록된 전체 게시물의 수
        List<Board> list = dao.list(pageNum, limit, column, find, ignorecase); // 화면에 출력된 게시물 데이터
        int endpage = boardcount / limit;
        if (boardcount % limit != 0)
            endpage++;
        int startpage = 1; // 시작 페이지 번호 설정

        request.setAttribute("pageNum", pageNum);
        request.setAttribute("startpage", startpage);
        request.setAttribute("endpage", endpage);
        request.setAttribute("boardcount", boardcount);
        request.setAttribute("list", list);
        request.setAttribute("boardnum", boardcount - (pageNum - 1) * limit);

        return new ActionForward();
    }

    public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
        int num = Integer.parseInt(request.getParameter("num"));
        BoardDao dao = new BoardDao();
        Board board = dao.selectOne(num);

        dao.readcntadd(num);

        request.setAttribute("board", board);
        request.setAttribute("num", num);

        return new ActionForward();
    }

    public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
        int num = Integer.parseInt(request.getParameter("num"));
        int pageNum = 1;
        try {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        } catch (NumberFormatException e) {}

        String pass = request.getParameter("pass");
        String msg = "비밀번호가 틀렸습니다!";
        String url = "deleteForm.do?num=" + num + "&pageNum=" + pageNum;

        BoardDao dao = new BoardDao();
        Board board = dao.selectOne(num);

        if (pass.equals(board.getPass())) {
            if (dao.delete(num) > 0) {
                msg = "게시글이 성공적으로 삭제되었습니다.";
                url = "list.do?pageNum=" + pageNum;
            } else {
                msg = "게시글 삭제를 실패하였습니다!";
                url = "info.do?num=" + num;
            }
        }

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);

        return new ActionForward(false, "../alert.jsp");
    }

    public ActionForward boardDetail(HttpServletRequest request, HttpServletResponse response) {
        int num = Integer.parseInt(request.getParameter("num"));
        Board board = dao.selectOne(num);

        request.setAttribute("b", board);

        return new ActionForward();
    }

    public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
        int pageNum = 1;

        String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
        MultipartRequest multi;

        try {
            multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8");

            Board b = new Board();

            b.setNum(Integer.parseInt(multi.getParameter("num")));
            try {
                pageNum = Integer.parseInt(multi.getParameter("pageNum"));
            } catch (NumberFormatException e) {}
            b.setName(multi.getParameter("name"));
            b.setPass(multi.getParameter("pass"));
            b.setSubject(multi.getParameter("subject"));
            b.setContent(multi.getParameter("content"));
            b.setFile1(multi.getFilesystemName("file1"));
            if (b.getFile1() == null || b.getFile1().equals("")) {
                b.setFile1(multi.getParameter("file2"));
            }

            // 비밀번호 검증
            BoardDao dao = new BoardDao();
            Board dbBoard = dao.selectOne(b.getNum());

            String msg = "비밀번호가 틀렸습니다!";
            String url = "updateForm.do?num=" + b.getNum() + "&pageNum=" + pageNum;

            if (b.getPass().equals(dbBoard.getPass())) {
                if (dao.update(b) > 0) {
                    msg = "게시물 수정 완료";
                    url = "list.do?pageNum=" + pageNum;
                } else {
                    msg = "게시물 수정 실패!";
                }
            }

            request.setAttribute("msg", msg);
            request.setAttribute("url", url);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return new ActionForward(false, "../alert.jsp");
    }

    public ActionForward reply(HttpServletRequest request, HttpServletResponse response) {
        String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
        MultipartRequest multi = null;

        try {
            multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8");

            Board b = new Board();

            int pageNum = 1;
            try {
                pageNum = Integer.parseInt(multi.getParameter("pageNum"));
            } catch (NumberFormatException e) {}

            int num = dao.maxnum();
            b.setNum(++num);
            b.setRef(Integer.parseInt(multi.getParameter("ref")));
            b.setName(multi.getParameter("name"));
            b.setPass(multi.getParameter("pass"));
            b.setSubject(multi.getParameter("subject"));
            b.setContent(multi.getParameter("content"));
            b.setFile1(multi.getFilesystemName("file1"));
            b.setReflevel(Integer.parseInt(multi.getParameter("reflevel")) + 1);
            b.setRefstep(Integer.parseInt(multi.getParameter("refstep")) + 1);

            if (dao.insert(b) > 0) {
                request.setAttribute("msg", "게시물 등록 성공");
                request.setAttribute("url", "list.do?pageNum=" + pageNum);
            } else {
                request.setAttribute("msg", "게시물 등록 실패");
                request.setAttribute("url", "replyForm.do?num=" + num + "&pageNum=" + pageNum);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return new ActionForward(false, "../alert.jsp");
    }
}
