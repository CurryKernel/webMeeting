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

        String a1=request.getParameter("a1");
        String a2=request.getParameter("a2");
        String a3=request.getParameter("a3");
        String a4=request.getParameter("a4");
        String a5=request.getParameter("a5");
        boolean a8=Boolean.parseBoolean(a1)&&Boolean.parseBoolean(a2)&&Boolean.parseBoolean(a3)&&Boolean.parseBoolean(a4)&&Boolean.parseBoolean(a5);
        if(a8==true) {
            String driverId = request.getParameter("driverId");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String description = request.getParameter("description");

            String driverInsert = driverInfoService.insert(driverId, password, phone, description);
            PrintWriter out = response.getWriter();
            if (driverInsert == "0") {
                response.sendRedirect("login.jsp?com=yes");
            }
            //response.setHeader("refresh", "1;URL=/jump1.jsp");
            else {
                response.sendRedirect("login.jsp?zhuCe=yes");
            }
        }
        else{
            response.sendRedirect("login.jsp?tct8=yes");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
