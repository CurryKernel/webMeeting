package Controller;

import Service.DriverInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DriverLoginServlet")
public class DriverLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        DriverInfoService driverInfoService= new DriverInfoService();

        String driverId =request.getParameter("driverId");
        String password=request.getParameter("password");

        String driverCheck = driverInfoService.check(driverId,password);
        PrintWriter out = response.getWriter();
        if (driverCheck == "0") {
            response.sendRedirect("login.jsp?error=yes");
        } else {
            request.getRequestDispatcher("/driver.jsp").forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
