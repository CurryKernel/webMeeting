package Controller;

import Service.MeetingInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateMyMeetingInfo")
public class UpdateMyMeetingInfoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // System.out.println("come in");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        response.setContentType("text/html;charset=UTF-8");
        String meetingId = request.getParameter("meetingId");
        int peopleCount = Integer.parseInt(request.getParameter("peopleCount"));
       System.out.println(meetingId);
//        System.out.println(peopleCount);
        MeetingInfoService MeetingInfoService=new MeetingInfoService();
        int result =MeetingInfoService.updatePeopleByMeetingId(meetingId,peopleCount);
        PrintWriter out = response.getWriter();
        if (result != 0) {
            out.println("更改成功，请返回上一个界面");
            ///request.getRequestDispatcher("/test_user_information.jsp").forward(request,response);
        }
        else{
            out.println("更改失败");
           // request.getRequestDispatcher("/test.jsp").forward(request,response);
        }
        request.getRequestDispatcher("/time.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
