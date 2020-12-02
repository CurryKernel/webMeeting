package Controller;

import Service.HotelService;
import VO.Hotel;
import VO.OrderHotel;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class OrderHotelController extends HttpServlet {

    public OrderHotelController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HotelService hotelService = new HotelService();
        String hotelid = req.getParameter("hotelId");
        //int category= Integer.parseInt(req.getParameter("category"));
       /* if(category==0){
            System.out.println("it is null");
        }*/
        List<OrderHotel> list=null;

        //类别1表示根据酒店查询它的全部订单
        //if(category==1){
            list = hotelService.findByHotel(hotelid);
       // }

        resp.setCharacterEncoding("UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(list);
        PrintWriter out = resp.getWriter();
        out.write(jsonStr);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}
