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

        String hotelId =request.getParameter("hotelId");
        String password=request.getParameter("password");
        String description=request.getParameter("description");

        String hotelInsert = hotelInfoService.insert(hotelId,password,description);
        PrintWriter out = response.getWriter();
        if (hotelInsert == "0") {
            out.println("false");
        }
            //response.setHeader("refresh", "1;URL=/jump1.jsp");
        else {
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
