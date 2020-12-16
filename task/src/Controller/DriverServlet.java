package Controller;

import Service.DriverInfoService;
import Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DriverServlet.do")
public class DriverServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用哪个方法
        String method = request.getParameter("method");

        if("validateName".equals(method)) {
            validateName(request,response);
        }
    }

    private void validateName(HttpServletRequest request,
                              HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        DriverInfoService driverInfoService= new DriverInfoService();
        int driverId =Integer.parseInt(request.getParameter("driverId"));
        String driverList = driverInfoService.checkDriverId(String.valueOf(driverId));
        //用于向后台传数据
        PrintWriter out = response.getWriter();

        //一般要通过和数据库交互查看用户名是否可用，这里就直接给个zhangsan测试
        //String userId = request.getParameter("userId");
        //如果是zhangsan，数据库已经有了，重复不可用，返回false
        //List<User> userList = userService.checkUserId(String.valueOf(userId));
        if (driverList == "0")
            out.write("false");
        else
            out.write("true");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
