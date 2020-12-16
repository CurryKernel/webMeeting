package Controller;

import Service.OrganizeService;
import Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/OrganizeServlet.do")
public class OrganizeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用哪个方法
        String method = request.getParameter("method");

        if("validateName".equals(method))
            validateName(request,response);

    }

    //验证用户名
    private void validateName(HttpServletRequest request,
                              HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        OrganizeService organizeService= new OrganizeService();
        int organizeId =Integer.parseInt(request.getParameter("organizeId"));
        String organizeList = organizeService.checkOrganizeId(String.valueOf(organizeId));
        //用于向后台传数据
        PrintWriter out = response.getWriter();

        //一般要通过和数据库交互查看用户名是否可用，这里就直接给个zhangsan测试
        //String userId = request.getParameter("userId");
        //如果是zhangsan，数据库已经有了，重复不可用，返回false
        //List<User> userList = userService.checkUserId(String.valueOf(userId));
        if (organizeList == "0")
            out.write("false");
        else
            out.write("true");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
