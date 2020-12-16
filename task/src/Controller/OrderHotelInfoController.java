package Controller;

import Service.OrderHotelInfoService;
import VO.HotelInfo;
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

@WebServlet("/OrderHotelInfo")
public class OrderHotelInfoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        response.setContentType("text/html;charset=UTF-8");
        OrderHotelInfoService OrderHotelInfoService = new OrderHotelInfoService();
        String userId = request.getParameter("userId");
        List<HotelInfo> OrderHotelInfoList = OrderHotelInfoService.findByUserId(userId);
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(OrderHotelInfoList);
        PrintWriter out = response.getWriter();
        out.write(jsonStr);
        System.out.println(jsonStr);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
