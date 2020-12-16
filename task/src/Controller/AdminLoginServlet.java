package Controller;

import Service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        AdminService adminService= new AdminService();

        String adminId =request.getParameter("AdminId");
        String password=request.getParameter("password");

        String adminCheck = adminService.check(adminId,password);
        PrintWriter out = response.getWriter();
        if (adminCheck == "0") {
            response.sendRedirect("login.jsp?error=yes");
        }
        else{
            request.getRequestDispatcher("/Admin/Admin.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
