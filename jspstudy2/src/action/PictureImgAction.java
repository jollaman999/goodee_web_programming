package action;

import com.oreilly.servlet.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PictureImgAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String path = request.getServletContext().getRealPath("/") +
                "model2/member/img/";
        MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8");
        String filename = multi.getFilesystemName("picture");

        request.setAttribute("filename", filename);

        return new ActionForward();
    }
}
