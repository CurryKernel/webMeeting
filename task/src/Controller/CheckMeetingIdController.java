package Controller;

import Service.MeetingInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet( "/CheckMeetingId")
public class CheckMeetingIdController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("come");
        request.setCharacterEncoding("UTF-8");
        MeetingInfoService meetingInfoService= new MeetingInfoService();
        String meetingId = request.getParameter("meetingId");
        System.out.println(meetingId);
        String organizeList = meetingInfoService.checkMeetingId(meetingId);
        System.out.println(organizeList);
        //用于向后台传数据
        PrintWriter out = response.getWriter();
        if (organizeList == "0")
            out.write("true");
        else
            out.write("false");
//        String method = request.getParameter("method");
//        System.out.println(method);
//        if("validateName".equals(method))
//            validateName(request,response);
//        String meetingId = request.getParameter("meetingId");
//        System.out.println(meetingId);

    }

    //验证用户名
//    private void validateName(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        System.out.println("come");
//        request.setCharacterEncoding("UTF-8");
//        MeetingInfoService meetingInfoService= new MeetingInfoService();
//        String meetingId = request.getParameter("meetingId");
//        System.out.println(meetingId);
//        String organizeList = meetingInfoService.checkMeetingId(meetingId);
//        System.out.println(organizeList);
//        //用于向后台传数据
//        PrintWriter out = response.getWriter();
//        if (organizeList == "0")
//            out.write("true");
//        else
//            out.write("true");
//    }
}
