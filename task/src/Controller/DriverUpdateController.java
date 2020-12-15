package Controller;

import DAO.DriverRespository;
import DAO.impl.DriverImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/updateDriver")
public class DriverUpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        String driverId = req.getParameter("driverId");
        String password = req.getParameter("password");
        String description = req.getParameter("description");
        String phone = req.getParameter("phone");
        DriverRespository updateDriver = new DriverImpl();
        updateDriver.update(driverId,driverId, password, phone, description);
        req.getRequestDispatcher("/time.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
