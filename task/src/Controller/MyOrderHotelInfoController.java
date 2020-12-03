package Controller;

import Service.MyOrderCarInfoService;
import Service.MyOrderHotelInfoService;
import VO.OrderCar;
import VO.OrderHotel;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
@WebServlet("/MyOderHotelInfo")
public class MyOrderHotelInfoController  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        MyOrderHotelInfoService myOrderHotelInfoService = new MyOrderHotelInfoService();
        String userId = req.getParameter("userId");
        List<OrderHotel> myOrderHotelInfoList = myOrderHotelInfoService.findByUserId(userId);
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(myOrderHotelInfoList);
        PrintWriter out = resp.getWriter();
        out.write(jsonStr);
        System.out.println(jsonStr);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
