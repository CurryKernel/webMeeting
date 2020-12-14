package Controller;

import DAO.UserRespository;
import DAO.impl.UserImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/updateUser")
public class UserUpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        String userId = req.getParameter("userId");
        String password = req.getParameter("newPassword");
        String username = req.getParameter("name");
        String phone = req.getParameter("phone");
        String department = req.getParameter("department");
        String email = req.getParameter("email");
        UserRespository updateUser = new UserImpl();
        updateUser.update(userId, username, password, phone,department,email);
        req.getRequestDispatcher("/time.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
