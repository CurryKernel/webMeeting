package Controller;

import Service.UserService;
import VO.User;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        String para = req.getParameter("method");
        if ("putId".equals(para)) {
            String UserId=req.getParameter("UserId");
//            byte[] bUserId=UserId.getBytes();
//            UserId = new String(bUserId, "UTF-8");
            req.setAttribute("UserId", UserId);
            req.getRequestDispatcher("/Admin/AdminChangeUser.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();

        String para = req.getParameter("method");
        if ("ChangeUser".equals(para)) {
            //获取信息
            String UserName = req.getParameter("inputUserName");
            String Password = req.getParameter("inputUserPassword");
            String Email= req.getParameter("inputEmail");
            String Department = req.getParameter("inputDepartment");
            String Phone = req.getParameter("inputUserPhone");
//            User user = new User(UserId, UserName,Password,Email,Department,Phone)
            UserService userService = new UserService();

        }


    }

    private void changeUser(){

    }

}
