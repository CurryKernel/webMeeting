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

        String a1=request.getParameter("a1");
        String a2=request.getParameter("a2");
        String a3=request.getParameter("a3");
        String a4=request.getParameter("a4");
        String a5=request.getParameter("a5");
        String a6=request.getParameter("a6");
        String a7=request.getParameter("a7");
        boolean a8=Boolean.parseBoolean(a1)&&Boolean.parseBoolean(a2)&&Boolean.parseBoolean(a3)&&Boolean.parseBoolean(a4)&&Boolean.parseBoolean(a5)&&Boolean.parseBoolean(a6)&&Boolean.parseBoolean(a7);
        if(a8==true) {
            String organizeId = request.getParameter("organizeId");
            String organizeName = request.getParameter("organizeName");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String department = request.getParameter("department");
            String email = request.getParameter("email");

            String organizeInsert = organizeService.insert(organizeId, organizeName, password, phone, department, email);
            PrintWriter out = response.getWriter();
            if (organizeInsert == "0")
                response.sendRedirect("login.jsp?com=yes");
            else
                response.sendRedirect("login.jsp?zhuCe=yes");
        }
        else{
            response.sendRedirect("login.jsp?tct8=yes");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
