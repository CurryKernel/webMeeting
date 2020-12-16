package Controller;

import Service.DriverInfoService;
import Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/RegistDriverServlet")
public class RegistDriverServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        DriverInfoService driverInfoService= new DriverInfoService();

        String driverId =request.getParameter("driverId");
        String password=request.getParameter("password");
        String phone=request.getParameter("phone");
        String description=request.getParameter("description");

        String driverInsert = driverInfoService.insert(driverId,password,phone,description);
        PrintWriter out = response.getWriter();
        if (driverInsert == "0") {
            out.println("false");
        }
            //response.setHeader("refresh", "1;URL=/jump1.jsp");
        else {
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
