package Controller;

import main.java.dao.userDao;
import VO.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UserController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter out = resp.getWriter();
        String userId = req.getParameter("userId");
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String phone = req.getParameter("phone");
        String department = req.getParameter("department");
        String email = req.getParameter("email");

        out.write("<html><body>");

        if(userDao.queryById(userId)){
            //账户名已存在
            //out.write("账户名已存在" + "<br>");
            resp.getWriter().append("用户名已存在");
        }
        else if(!password.equals(confirmPassword)){
            out.write("两次输入的密码不同" + "<br>");
        }
        else{
            User user = new User(userId, userName, password, phone, department, email);
            userDao.insertUser(user);
            out.write("创建成功" + "<br>");
        }

        out.write("</html></body>");
    }
}
