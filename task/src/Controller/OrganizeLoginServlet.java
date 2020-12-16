package Controller;

import Service.OrganizeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/OrganizeLoginServlet")
public class OrganizeLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        OrganizeService organizeService= new OrganizeService();

        String organizeId =request.getParameter("userId");
        String password=request.getParameter("password");

        String organizeCheck = organizeService.check(organizeId,password);
        PrintWriter out = response.getWriter();
        if (organizeCheck == "0") {
            response.sendRedirect("login.jsp?error=yes");
        } else {
            request.getRequestDispatcher("/organize.jsp").forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
