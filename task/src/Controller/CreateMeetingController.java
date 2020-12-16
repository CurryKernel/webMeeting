package Controller;

import Service.MeetingInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CreateMeeting")
public class CreateMeetingController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     //   System.out.println("come in");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        response.setContentType("text/html;charset=UTF-8");
        String meetingId = request.getParameter("meetingId");
        String userId = request.getParameter("userId");
        String place = request.getParameter("place");
        int peopleCount = Integer.parseInt(request.getParameter("peopleCount"));
        String time = request.getParameter("time");
        String detail = request.getParameter("detail");
//        System.out.println(meetingId);
//        System.out.println(userId);
//        System.out.println(place);
//        System.out.println(peopleCount);
//        System.out.println(time);
//        System.out.println(detail);
        MeetingInfoService MeetingInfoService=new MeetingInfoService();
        int result =MeetingInfoService.insert(meetingId,userId,place,peopleCount,time,detail);
        PrintWriter out = response.getWriter();
        if (result != 0) {
            out.println("创建成功，请返回上一个界面");
            ///request.getRequestDispatcher("/test_user_information.jsp").forward(request,response);
        }
        else{
            out.println("创建失败");
            // request.getRequestDispatcher("/test.jsp").forward(request,response);
        }
    }
}
