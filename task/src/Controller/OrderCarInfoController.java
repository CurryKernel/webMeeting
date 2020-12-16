package Controller;

import Service.OrderCarInfoService;
import VO.CarInfo;
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

@WebServlet("/OderCarInfo")
public class OrderCarInfoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("come in");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        response.setContentType("text/html;charset=UTF-8");
        OrderCarInfoService OrderCarInfoService = new OrderCarInfoService();
        String userId = request.getParameter("userId");
        System.out.println(userId);
        List<CarInfo> CarInfoInfoList = OrderCarInfoService.findByUserId(userId);
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(CarInfoInfoList);
        PrintWriter out = response.getWriter();
        out.write(jsonStr);
        System.out.println(jsonStr);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
