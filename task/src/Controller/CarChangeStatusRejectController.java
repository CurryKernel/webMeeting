package Controller;

import Service.ChangeStatusToRejectSeevice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/ChangeStateR")
public class CarChangeStatusRejectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json");
        resp.setContentType("text/html;charset=UTF-8");
        ChangeStatusToRejectSeevice errorService= new ChangeStatusToRejectSeevice();
        int userId =Integer.parseInt(req.getParameter("userId"));
        String deadline = req.getParameter("deadline");
        System.out.println(deadline);
        boolean flag = errorService.changeStatue(String.valueOf(userId),String.valueOf(deadline));
        System.out.println(flag);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}
