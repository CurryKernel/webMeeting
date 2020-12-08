package Controller;

import DAO.OrderCarRespository;

import DAO.impl.OrderCarImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/UserOrderCar")
public class User_OrderCarController  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        resp.setContentType("text/html;charset=UTF-8");
        String userId = req.getParameter("Urequired");
        int people = Integer.parseInt(req.getParameter("Pcount"));
        String driverId = req.getParameter("Drequired");
        String deadline = req.getParameter("deadline");
        String place = req.getParameter("place");
        System.out.println(userId);//测试过程的
        OrderCarRespository carInfo = new OrderCarImpl();
        carInfo.insert(userId, people, place, 0, deadline,driverId);//默认刚插入就是0状态
        req.getRequestDispatcher("/time.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
