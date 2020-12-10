package Controller;

import Service.AdminService;
import Service.UserService;
import VO.Admin;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //解决中文乱码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String para = request.getParameter("method");
        if ("putId".equals(para)) {
            String UserId=request.getParameter("UserId");
//            byte[] bUserId=UserId.getBytes();
//            UserId = new String(bUserId, "UTF-8");
            request.setAttribute("UserId", UserId);
            request.getRequestDispatcher("/Admin/AdminChangeUser.jsp").forward(request, response);
        }
        /**
         * 跳转页面
         * */
        if("selectPages".equals(para)){
            String AdminId=request.getParameter("AdminId");
            String i = request.getParameter("i");
            request.setAttribute("AdminId", AdminId);
            request.getRequestDispatcher("/Admin/AdminPage"+i+".jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //解决中文乱码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String para = request.getParameter("method");
        /**
         * 登录
         * */
        if("Login".equals(para)){
            String AdminId = request.getParameter("AdminId");
            request.setAttribute("AdminId",AdminId);
            request.getRequestDispatcher("/Admin/Admin.jsp").forward(request,response);
        }
        else if ("ChangeUser".equals(para)) {
            //获取信息
            String UserName = request.getParameter("inputUserName");
            String Password = request.getParameter("inputUserPassword");
            String Email= request.getParameter("inputEmail");
            String Department = request.getParameter("inputDepartment");
            String Phone = request.getParameter("inputUserPhone");
//            User user = new User(UserId, UserName,Password,Email,Department,Phone)
            UserService userService = new UserService();

        }
        /**
         * 修改管理员密码
         * */
        else if("ChangeAdminPass".equals(para)){
            String CPassword = request.getParameter("inputPasswordCurrent");
            String NPassword = request.getParameter("inputPasswordNew2");
            String AdminId = request.getParameter("AdminId");
            AdminService adminService = new AdminService();
            Admin admin = adminService.findById(AdminId);
            if(CPassword.equals(admin.getPassword())){
                //如果旧密码和库中一样就修改密码
            }
            else{//如果和旧密码不一样，就返回修改密码失败
                String msg = "密码错误，修改失败";
                request.setAttribute("AdminId",AdminId);
                request.setAttribute("msg",msg);
                request.getRequestDispatcher("/Admin/Admin.jsp").forward(request,response);
            }
        }

    }
}
