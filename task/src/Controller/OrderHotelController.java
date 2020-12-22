package Controller;

import Service.HotelService;
import VO.*;
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
import java.util.HashMap;
import java.util.List;

/**
 * @author 李婉芸
 */

@WebServlet("/OrderHotel")
public class OrderHotelController extends hotel_baseController {
    HotelService hotelService = new HotelService();

    public OrderHotelController() {
    }




    protected void add_order(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderHotel neworder = WebUtils.copyParamToBean(req.getParameterMap(),new OrderHotel());
        hotelService.add_order(neworder);
        resp.sendRedirect(req.getContextPath() + "/OrderHotel?action=page&hotelId="+neworder.getHotelId());
    }

    protected void delete_order(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        String userId=req.getParameter("userId");
        String hotelId=req.getParameter("hotelId");
        hotelService.deleteByUserId_Hotelid(userId,hotelId);

        resp.sendRedirect(req.getContextPath() + "/OrderHotel?action=page&hotelId="+hotelId);
    }

    protected void totalorder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hotelId=req.getParameter("hotelId");
        List<ShowOrderHotel>  orderHotels = hotelService.findByHotel(hotelId);

        /*resp.setHeader("content-type", "text/html;charset=UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(orderHotels);
        PrintWriter out = resp.getWriter();
        out.write(jsonStr);*/

        req.setAttribute("orderHotels", orderHotels);
        req.getRequestDispatcher("/indexhotel.jsp").forward(req,resp);
    }

    protected void orderbyUser_Hotel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"),Page.PAGE_SIZE);
        String hotelId=req.getParameter("hotelId");
        String userId=req.getParameter("userId");
        Page<ShowOrderHotel>  page  = hotelService.findByHotel_User_Page(hotelId,userId,pageNo,pageSize);

        req.setAttribute("page",page);
        req.getRequestDispatcher("/indexhotel.jsp").forward(req,resp);

    }

    protected void getorderbyUser_Hotel_meeting(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"),Page.PAGE_SIZE);
        String hotelId=req.getParameter("hotelId");
        String userId=req.getParameter("userId");
        String meetingId=req.getParameter("meetingId");
        Page<ShowOrderHotel> page  = hotelService.findByHotel_User_Meeting_Page(hotelId,userId,meetingId,pageNo,pageSize);
        ShowOrderHotel needinfo = new ShowOrderHotel();

        for(ShowOrderHotel i: page.getItems()){
            needinfo=i;
        }

        req.setAttribute("page1",needinfo);
        req.getRequestDispatcher("/hotelorder_state_edit.jsp").forward(req,resp);
    }



    protected void orderbyState_Hotel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"),Page.PAGE_SIZE);
        String hotelId=req.getParameter("hotelId");
        int state = WebUtils.parseInt(req.getParameter("state"), 0);
        Page<ShowOrderHotel>  page  = hotelService.findByState_Hotel_Page(hotelId,state,pageNo,pageSize);

        req.setAttribute("page",page);
        req.getRequestDispatcher("/indexhotel.jsp").forward(req,resp);

        /*req.setAttribute("orderHotels", orderHotels);
        req.getRequestDispatcher("/hotel.jsp").forward(req,resp);*/
    }

    protected void orderbyPeople_Hotel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"),Page.PAGE_SIZE);
        String hotelId=req.getParameter("hotelId");
        int minpeople = WebUtils.parseInt(req.getParameter("minpeople"), 0);
        int maxpeople = WebUtils.parseInt(req.getParameter("maxpeople"), 0);
        Page<ShowOrderHotel>  page = hotelService.findByPeople_Hotel_Page_Inter(hotelId,minpeople,maxpeople,pageNo,pageSize);


        req.setAttribute("page",page);
        req.getRequestDispatcher("/indexhotel.jsp").forward(req,resp);

        /*req.setAttribute("orderHotels", orderHotels);
        req.getRequestDispatcher("/hotel.jsp").forward(req,resp);*/
    }

    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"),Page.PAGE_SIZE);
        //int pageNo=1;
       // int pageSize=4;
        String hotelId=req.getParameter("hotelId");

        Page<ShowOrderHotel> page = hotelService.findByHotel_Page(pageNo,pageSize,hotelId);

        req.setAttribute("page",page);
        req.getRequestDispatcher("/indexhotel.jsp").forward(req,resp);
    }

    protected void update_state(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException{
        OrderHotel neworder = WebUtils.copyParamToBean(req.getParameterMap(),new OrderHotel());
        hotelService.update_state1(neworder);

        resp.sendRedirect(req.getContextPath() + "/OrderHotel?action=page&hotelId="+neworder.getHotelId());
    }

}
