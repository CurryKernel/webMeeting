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

//        //调用哪个方法
//        String method = request.getParameter("method");
//
//        if("validateName".equals(method))
//            validateName(request,response);
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        UserService userService= new UserService();

        String userId =request.getParameter("userId");
        String userName=request.getParameter("userName");
        String password=request.getParameter("password");
        String phone=request.getParameter("phone");
        String department=request.getParameter("department");
        String email=request.getParameter("email");

        String userInsert = userService.insert(userId,userName,password,phone,department,email);
        PrintWriter out = response.getWriter();
        if (userInsert == "0")
            out.println("注册不成功！");
            //response.setHeader("refresh", "1;URL=/jump1.jsp");
        else
            request.getRequestDispatcher("/login.jsp").forward(request,response);


    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
