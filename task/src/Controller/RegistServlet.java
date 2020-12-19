package Controller;

import DAO.JDBCUtils;
import Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("come in!");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        UserService userService= new UserService();
        String a1=request.getParameter("a1");
        String a2=request.getParameter("a2");
        String a3=request.getParameter("a3");
        String a4=request.getParameter("a4");
        String a5=request.getParameter("a5");
        String a6=request.getParameter("a6");
        String a7=request.getParameter("a7");
//        System.out.println("a1="+a1);
//        System.out.println("a2="+a2);
//        System.out.println("a3="+a3);
//        System.out.println("a4="+a4);
//        System.out.println("a5="+a5);
//        System.out.println("a6="+a6);
//        System.out.println("a7="+a7);
        boolean a8=Boolean.parseBoolean(a1)&&Boolean.parseBoolean(a2)&&Boolean.parseBoolean(a3)&&Boolean.parseBoolean(a4)&&Boolean.parseBoolean(a5)&&Boolean.parseBoolean(a6)&&Boolean.parseBoolean(a7);
//        System.out.println("a8="+a8);
        if(a8==true){
            String userId = request.getParameter("userId");
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String department = request.getParameter("department");
            String email = request.getParameter("email");
            System.out.println(userId);
            String userInsert = userService.insert(userId, userName, password, phone, department, email);

            if (userInsert == "0")
                response.sendRedirect("login.jsp?com=yes");
                //response.setHeader("refresh", "1;URL=/jump1.jsp");
            else
                response.sendRedirect("login.jsp?zhuCe=yes");
                //request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
        else{
            response.sendRedirect("login.jsp?tct8=yes");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
