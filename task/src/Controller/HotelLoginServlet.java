package Controller;

import Service.HotelInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/HotelLoginServlet")
public class HotelLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HotelInfoService hotelInfoService= new HotelInfoService();

        String hotelId =request.getParameter("hotelid");
        String password=request.getParameter("password");

        String hotelCheck = hotelInfoService.check(hotelId,password);
        PrintWriter out = response.getWriter();
        if (hotelCheck == "0") {
            response.sendRedirect("login.jsp?error=yes");
        } else {
            request.setAttribute("hotelid",hotelId);
            request.getRequestDispatcher("/OrderHotel?action=page&hotelId="+hotelId).forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
