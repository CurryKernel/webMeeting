package Controller;

import Service.OrganizeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/RegistOrganizeServlet")
public class RegistOrganizeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        OrganizeService organizeService= new OrganizeService();

        String organizeId =request.getParameter("organizeId");
        String organizeName=request.getParameter("organizeName");
        String password=request.getParameter("password");
        String phone=request.getParameter("phone");
        String department=request.getParameter("department");
        String email=request.getParameter("email");

        String organizeInsert = organizeService.insert(organizeId,organizeName,password,phone,department,email);
        PrintWriter out = response.getWriter();
        if (organizeInsert == "0")
            out.println("false");
        else
            request.getRequestDispatcher("/login.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
