package Controller;

import DAO.JoinMeetingRespository;
import DAO.OrderCarRespository;
import DAO.impl.JoinMeetingImpl;
import DAO.impl.OrderCarImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/UserJoinMeeting")
public class User_JoinMeetingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        String userId = req.getParameter("Urequired");
        String meetingId = req.getParameter("Mrequired");
        int needCar = Integer.parseInt(req.getParameter("needCar"));
        int needHotel = Integer.parseInt(req.getParameter("needHotel"));
        System.out.println(userId);//测试过程的
        JoinMeetingRespository joinMeetingInfo = new JoinMeetingImpl();
        joinMeetingInfo.insert(userId, meetingId, needCar, needHotel);
        req.getRequestDispatcher("/time.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
