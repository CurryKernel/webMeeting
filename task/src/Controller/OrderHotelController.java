package Controller;

import Service.HotelService;
import VO.Hotel;
import VO.OrderHotel;
import com.fasterxml.jackson.databind.ObjectMapper;
import utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 李婉芸
 */

@WebServlet("/OrderHotel")
public class OrderHotelController extends hotel_baseController {
    HotelService hotelService = new HotelService();

    public OrderHotelController() {
    }




    //protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        /*String hotelid = req.getParameter("hotelId");
        String category= req.getParameter("category");

        List<OrderHotel> list=new ArrayList<>();*/

        /*if(category.equals("1")){
            list = hotelService.findByHotel(hotelid);
        }
        else if(category.equals("2")){
            list=hotelService.findByState_Hotel(hotelid,1);
        }
        else if(category.equals("3")){
            list=hotelService.findByState_Hotel(hotelid,3);
        }
        else{

        }*/

        /*resp.setCharacterEncoding("UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(list);
        PrintWriter out = resp.getWriter();
        out.write(jsonStr);*/
        protected void add_order(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            OrderHotel neworder = WebUtils.copyParamToBean(req.getParameterMap(),new OrderHotel());

            hotelService.add_order(neworder);
            resp.sendRedirect(req.getContextPath() + "/OrderHotel?action=totalorder&hotelid="+neworder.getHotelId());
}


    protected void totalorder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hotelid=req.getParameter("hotelid");
        req.setAttribute("hotelid",hotelid);
        List<OrderHotel> orderHotels = hotelService.findByHotel(hotelid);

        req.setAttribute("orderHotels", orderHotels);
        req.getRequestDispatcher("/hotel.jsp").forward(req,resp);
    }

    protected void orderbyState_Hotel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String hotelid=req.getParameter("hotelid");
        int state = WebUtils.parseInt(req.getParameter("state"), 0);
        List<OrderHotel> orderHotels = hotelService.findByState_Hotel(hotelid,state);

        req.setAttribute("orderHotels", orderHotels);
        req.getRequestDispatcher("/hotel.jsp").forward(req,resp);
    }

    protected void orderbyPeople_Hotel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String hotelid=req.getParameter("hotelid");
        int minpeople = WebUtils.parseInt(req.getParameter("minpeople"), 0);
        int maxpeople = WebUtils.parseInt(req.getParameter("maxpeople"), 0);
        List<OrderHotel> orderHotels = hotelService.findByPeople_Hotel(hotelid,minpeople);
        for(int i=minpeople+1;i<=maxpeople;i++){
            orderHotels.addAll(hotelService.findByPeople_Hotel(hotelid,i));
        }
        for(int i=0;i<orderHotels.size();i++){
            System.out.println(orderHotels.get(i).getUserId()+" "+orderHotels.get(i).getPeople());
        }
        req.setAttribute("orderHotels", orderHotels);
        req.getRequestDispatcher("/hotel.jsp").forward(req,resp);
    }








}
