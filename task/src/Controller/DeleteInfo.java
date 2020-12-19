package Controller;

import Service.CheckInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DeleteInfo")
public class DeleteInfo extends HttpServlet {
      @Override
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String userId = request.getParameter("userId");
          String meetingId = request.getParameter("meetingId");
          request.setCharacterEncoding("utf-8");
          response.setContentType("text/html;charset=utf-8");
          CheckInfoService CheckInfoService = new CheckInfoService();
          int result=CheckInfoService.deleteByUserId(userId,meetingId);
        PrintWriter out = response.getWriter();
        if (result != 0) {
            out.println("删除成功");
        }
        else {
            out.println("删除失败");
        }
    }
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String userId = request.getParameter("userId");
       String meetingId = request.getParameter("meetingId");
       request.setCharacterEncoding("utf-8");
       response.setContentType("text/html;charset=utf-8");
       CheckInfoService CheckInfoService = new CheckInfoService();
       int result=CheckInfoService.deleteByUserId(userId,meetingId);
       PrintWriter out = response.getWriter();
       if (result != 0) {
           out.println("删除成功");
       }
       else {
           out.println("删除失败");
       }
    }


}
