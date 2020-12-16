package Controller;

import Service.HotelService;
import VO.OrderHotel;
import VO.Page;
import VO.ShowOrderHotel;
import utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
        resp.sendRedirect(req.getContextPath() + "/OrderHotel?action=page&hotelid="+neworder.getHotelId());
    }

    protected void delete_order(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        String userid=req.getParameter("userid");
        String hotelid=req.getParameter("hotelid");
        hotelService.deleteByUserId_Hotelid(userid,hotelid);

        resp.sendRedirect(req.getContextPath() + "/OrderHotel?action=page&hotelid="+hotelid);
    }

    protected void totalorder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hotelid=req.getParameter("hotelid");
        List<ShowOrderHotel>  orderHotels = hotelService.findByHotel(hotelid);
        req.setAttribute("orderHotels", orderHotels);
        req.getRequestDispatcher("/hotel.jsp").forward(req,resp);
    }

    protected void orderbyUser_Hotel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"),Page.PAGE_SIZE);
        String hotelid=req.getParameter("hotelid");
        String userid=req.getParameter("userid");
        Page<ShowOrderHotel>  page  = hotelService.findByHotel_User_Page(hotelid,userid,pageNo,pageSize);

        req.setAttribute("page",page);
        req.getRequestDispatcher("/hotel.jsp").forward(req,resp);

    }

    protected void getorderbyUser_Hotel_time(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"),Page.PAGE_SIZE);
        String hotelid=req.getParameter("hotelid");
        String userid=req.getParameter("userid");
        String time=req.getParameter("time");
        Page<ShowOrderHotel>  page  = hotelService.findByHotel_User_Page(hotelid,userid,pageNo,pageSize);

        req.setAttribute("page",page);
        req.getRequestDispatcher("/hotel.jsp").forward(req,resp);

    }

    protected void orderbyState_Hotel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"),Page.PAGE_SIZE);
        String hotelid=req.getParameter("hotelid");
        int state = WebUtils.parseInt(req.getParameter("state"), 0);
        Page<ShowOrderHotel>  page  = hotelService.findByState_Hotel_Page(hotelid,state,pageNo,pageSize);
        req.setAttribute("page",page);
        req.getRequestDispatcher("/hotel.jsp").forward(req,resp);
    }

    protected void orderbyPeople_Hotel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"),Page.PAGE_SIZE);
        String hotelid=req.getParameter("hotelid");
        int minpeople = WebUtils.parseInt(req.getParameter("minpeople"), 0);
        int maxpeople = WebUtils.parseInt(req.getParameter("maxpeople"), 0);
        Page<ShowOrderHotel>  page = hotelService.findByPeople_Hotel_Page_Inter(hotelid,minpeople,maxpeople,pageNo,pageSize);
        req.setAttribute("page",page);
        req.getRequestDispatcher("/hotel.jsp").forward(req,resp);
    }

    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"),Page.PAGE_SIZE);
        //int pageNo=1;
        // int pageSize=4;
        String hotelid=req.getParameter("hotelid");

        Page<ShowOrderHotel> page = hotelService.findByHotel_Page(pageNo,pageSize,hotelid);

        req.setAttribute("page",page);
        req.getRequestDispatcher("/hotel.jsp").forward(req,resp);
    }

}
