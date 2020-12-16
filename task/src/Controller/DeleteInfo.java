package Controller;

import DAO.CheckInfoRespository;
import DAO.impl.CheckInfoImpl;
import DAO.impl.UserImpl;
import Service.CheckInfoService;
import Service.UserService;
import VO.CheckInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteInfo")
public class DeleteInfo extends HttpServlet {
  /*  CheckInfoRespository ts =new CheckInfoImpl();
    public List<CheckInfo> findByUserId(String userId){
        List<CheckInfo> list = new ArrayList<>();
        list=ts.findByUserId(null);
        return list;
    }
    public int deleteByUserId(String userId){
        int a=0;
        CheckInfo t=new CheckInfo();
        t.setUserId(userId);
        a= ts.deleteByUserId(t.getUserId());
        return a;
    }*/

      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //   System.out.println("come in");
          String userId = request.getParameter("userId");
        //  System.out.println(userId);
          request.setCharacterEncoding("utf-8");
          response.setContentType("text/html;charset=utf-8");
          CheckInfoService CheckInfoService = new CheckInfoService();
          int result=CheckInfoService.deleteByUserId(userId);
       // int result = delete.deleteByUserId(userId);
        PrintWriter out = response.getWriter();
        if (result != 0) {
            out.println("删除成功");
        //    System.out.println("成功");
           // response.sendRedirect("CheckInfoController ");
        }
        else  out.println("删除失败");
         // System.out.println("失败");
    }
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request,response);
    }


}
