package Controller;

import Service.MyMeetingInfoService;
import Service.MyOrderCarInfoService;
import VO.Meeting;
import VO.OrderCar;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
@WebServlet("/MyOderCarInfo")
public class MyOrderCarInfoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        MyOrderCarInfoService myOrderCarInfoService = new MyOrderCarInfoService();
        String userId = req.getParameter("userId");
        List<OrderCar> myOrderCarInfoList = myOrderCarInfoService.findByUserId(userId);
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(myOrderCarInfoList);
        PrintWriter out = resp.getWriter();
        out.write(jsonStr);
        System.out.println(jsonStr);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
