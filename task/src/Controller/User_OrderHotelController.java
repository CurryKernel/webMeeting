package Controller;

import DAO.HotelRespository;
import DAO.OrderHotelRespository;
import DAO.impl.HotelImpl;
import DAO.impl.OrderHotelImpl;
import Service.HotelInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserorderHotel")
public class User_OrderHotelController  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        String userId = req.getParameter("Urequired");
        System.out.println(userId);
        int people = Integer.parseInt(req.getParameter("Pcount"));
        String hotelId =req.getParameter("Hrequired");
        OrderHotelRespository hotelInfo = new OrderHotelImpl();
        hotelInfo.insert(userId,people, 0,hotelId);//默认刚插入就是0状态
        req.getRequestDispatcher("/time.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
