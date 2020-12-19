package Controller;

import Service.DriverInfoService;
import Service.HotelInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/RegistHotelServlet")
public class RegistHotelServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HotelInfoService hotelInfoService= new HotelInfoService();

        String a1=request.getParameter("a1");
        String a2=request.getParameter("a2");
        String a3=request.getParameter("a3");
        String a4=request.getParameter("a4");
        boolean a8=Boolean.parseBoolean(a1)&&Boolean.parseBoolean(a2)&&Boolean.parseBoolean(a3)&&Boolean.parseBoolean(a4);
        if (a8 == true) {
            String hotelId = request.getParameter("hotelId");
            String password = request.getParameter("password");
            String description = request.getParameter("description");

            String hotelInsert = hotelInfoService.insert(hotelId, password, description);
            PrintWriter out = response.getWriter();
            if (hotelInsert == "0") {
                response.sendRedirect("login.jsp?com=yes");
            }
            //response.setHeader("refresh", "1;URL=/jump1.jsp");
            else {
                response.sendRedirect("login.jsp?zhuCe=yes");
            }
        }
        else{
            response.sendRedirect("login.jsp?tct8=yes");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
