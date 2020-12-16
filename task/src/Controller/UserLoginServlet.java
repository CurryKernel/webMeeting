package Controller;

import Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        UserService userService= new UserService();

        String userId =request.getParameter("userId");
        String password=request.getParameter("password");
        String userCheck = userService.check(userId,password);
        System.out.println(userCheck);
        PrintWriter out = response.getWriter();
        if (userCheck == "0") {
            response.sendRedirect("login.jsp?error=yes");
        } else {
            request.getRequestDispatcher("/user.jsp").forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
