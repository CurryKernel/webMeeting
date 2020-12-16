package Controller;
import Service.CheckInfoService;
import VO.CheckInfo;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/CheckInfo")
public class CheckInfoController extends HttpServlet {
 //   CheckInfoService ts = new CheckInfoService();
   // String userId = request.getParameter("userId");
   /* public List<CheckInfo> selets(){
        List<CheckInfo> list=new ArrayList<CheckInfo>();
        list=ts.selets(null);
        return list;
       // return list;
    }*/

  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        response.setContentType("text/html;charset=UTF-8");
        CheckInfoService CheckInfoService = new CheckInfoService();
        String userId = request.getParameter("userId");
        List<CheckInfo> CheckInfoList = CheckInfoService.findByUserId(userId);
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(CheckInfoList);
        PrintWriter out = response.getWriter();
        out.write(jsonStr);
        System.out.println(jsonStr);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }


}
