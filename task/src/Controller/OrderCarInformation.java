package Controller;

import Service.DriverService;
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
@WebServlet("/ShowOrderCarIn")
public class OrderCarInformation  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        resp.setContentType("text/html;charset=UTF-8");
        DriverService OrderCarService= new DriverService();
        int driverId =Integer.parseInt(req.getParameter("driverId"));
        List<OrderCar> orderCarsList = OrderCarService.findOrderCarByDriverId(String.valueOf(driverId));
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(orderCarsList);
        PrintWriter out = resp.getWriter();
        out.write(jsonStr);
        System.out.println(jsonStr);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
