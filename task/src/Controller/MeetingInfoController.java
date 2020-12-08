package Controller;

import Service.MeetingInfoService;
import VO.Meeting;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/ShowMeetingInfo")
public class MeetingInfoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决中文乱码
        req.setCharacterEncoding("UTF-8");
        MeetingInfoService  meetingInfoService =new MeetingInfoService();
        List<Meeting> meetingInfoList =meetingInfoService.findAll();

        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(meetingInfoList);
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(jsonStr);
        System.out.println(jsonStr);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
