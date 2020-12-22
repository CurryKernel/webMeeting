package Service;

import DAO.OrderHotelRespository;
import DAO.impl.OrderHotelImpl;
import VO.OrderHotel;
import VO.Page;
import VO.ShowOrderHotel;
import VO.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HotelService {
    private OrderHotelRespository orderhotel = new OrderHotelImpl();

    public HotelService() {


    }

    public List<ShowOrderHotel> findByHotel(String hotelId) {
        List<ShowOrderHotel> orderhotelinfo;
        orderhotelinfo=orderhotel.findByHotel(hotelId);

        return orderhotelinfo;
    }


    public Page<ShowOrderHotel> findByHotel_User_Page(String hotelId,String userId,int currentPage, int pageSize) {
        Page<ShowOrderHotel> page = new Page<ShowOrderHotel>();
        page.setPageNo(currentPage);
        page.setPageSize(pageSize);

        //总记录数
        Integer pageTotalRecord = orderhotel.countByUserId_Hotelid(userId,hotelId);
        page.setPageTotalCount(pageTotalRecord);

        // 总页码
        Integer pageTotal = pageTotalRecord / pageSize;
        if (pageTotalRecord % pageSize > 0) {
            pageTotal+=1;
        }
        page.setPageTotal(pageTotal);

        // 当前页数据
        List<ShowOrderHotel>  orders_page= orderhotel.findByHotel_User_Page(hotelId,userId,currentPage,pageSize);

        // 设置当前页数据
        page.setItems(orders_page);

        return page;
    }

    public Page<ShowOrderHotel>  findByPeople_Hotel_Page_Inter(String hotelId, int minpeople,int maxpeople, int currentPage, int pageSize){
        Page<ShowOrderHotel> page = new Page<ShowOrderHotel>();
        page.setPageNo(currentPage);
        page.setPageSize(pageSize);
        Integer pageTotalRecord=0;
        //总记录数
        for(int i=minpeople;i<=maxpeople;i++){
            pageTotalRecord+=orderhotel.countByPeople_Hotelid(i,hotelId);
        }
        page.setPageTotalCount(pageTotalRecord);

        // 总页码
        Integer pageTotal = pageTotalRecord / pageSize;
        if (pageTotalRecord % pageSize > 0) {
            pageTotal+=1;
        }
        page.setPageTotal(pageTotal);

        // 当前页数据
        List<ShowOrderHotel>  orders_page= orderhotel.findByPeople_Hotel_Page_Inter1(hotelId,minpeople,maxpeople,currentPage,pageSize);

        // 设置当前页数据
        page.setItems(orders_page);

        return page;
    }


    public Page<ShowOrderHotel>  findByState_Hotel_Page(String hotelId, int state,int currentPage, int pageSize){
        Page<ShowOrderHotel> page = new Page<ShowOrderHotel>();
        page.setPageNo(currentPage);
        page.setPageSize(pageSize);

        //总记录数
        Integer pageTotalRecord = orderhotel.countByState_Hotelid(state,hotelId);
        page.setPageTotalCount(pageTotalRecord);

        // 总页码
        Integer pageTotal = pageTotalRecord / pageSize;
        if (pageTotalRecord % pageSize > 0) {
            pageTotal+=1;
        }
        page.setPageTotal(pageTotal);

        // 当前页数据
        List<ShowOrderHotel>  orders_page= orderhotel.findByState_Hotel_Page(hotelId,state,currentPage,pageSize);

        // 设置当前页数据
        page.setItems(orders_page);

        return page;
    }

    public void add_devide_order(String userid,int people,int state,String hotelId,String meetingId){
        orderhotel.insert(userid,people,state,hotelId,meetingId);
        return;
    }

    public void add_order(OrderHotel orderHotel){
        orderhotel.insert(orderHotel.getUserId(),orderHotel.getPeople(),orderHotel.getState(),orderHotel.getHotelId(),orderHotel.getMeetingId());
        return;
    }

    public void deleteByUserId_Hotelid(String userid,String hotelId){
        orderhotel.deleteByUserId_Hotelid(userid,hotelId);
        return;
    }

    public void update_state(String userId,String hotelId,int newstate,String meetingId){
        orderhotel.update_state(userId,hotelId,newstate,meetingId);
        return;
    }

    public void update_state1(OrderHotel orderHotel){
        orderhotel.update_state(orderHotel.getUserId(),orderHotel.getHotelId(),orderHotel.getState(),orderHotel.getMeetingId());
        return;
    }

    public Page<ShowOrderHotel> findByHotel_Page(int currentPage, int pageSize,String hotelId) {
        Page<ShowOrderHotel> page = new Page<ShowOrderHotel>();
        page.setPageNo(currentPage);
        page.setPageSize(pageSize);

        //总记录数
        Integer pageTotalRecord = orderhotel.countByHotelid(hotelId);
        page.setPageTotalCount(pageTotalRecord);

        // 总页码
        Integer pageTotal = pageTotalRecord / pageSize;
        if (pageTotalRecord % pageSize > 0) {
            pageTotal+=1;
        }
        page.setPageTotal(pageTotal);

        // 当前页数据
        List<ShowOrderHotel>  orders_page= orderhotel.findByHotel_page(hotelId,currentPage,pageSize);

        // 设置当前页数据
        page.setItems(orders_page);
        return page;
    }

    public Page<ShowOrderHotel> findByHotel_User_Meeting_Page(String hotelId,String userId,String meetingId,int currentPage, int pageSize) {
        Page<ShowOrderHotel> page = new Page<ShowOrderHotel>();
        page.setPageNo(currentPage);
        page.setPageSize(pageSize);

        //总记录数
        Integer pageTotalRecord = orderhotel.countByUserId_Hotelid(userId,hotelId);
        page.setPageTotalCount(pageTotalRecord);

        // 总页码
        Integer pageTotal = pageTotalRecord / pageSize;
        if (pageTotalRecord % pageSize > 0) {
            pageTotal+=1;
        }
        page.setPageTotal(pageTotal);

        // 当前页数据
        List<ShowOrderHotel>  orders_page= orderhotel.findByUser_Hotel_Meeting_Page(hotelId,userId,meetingId,currentPage,pageSize);

        // 设置当前页数据
        page.setItems(orders_page);

        return page;
    }





    /*public HashMap<OrderHotel,User> joinuserinfo(List<OrderHotel> order,HashMap<OrderHotel,User> map){
        UserService user=new UserService();
        for(int i=0;i<order.size();i++){
            String nowuserid=order.get(i).getUserId();
            System.out.println(nowuserid);
            List<User> userInfo=user.findByUserId(nowuserid);
            map.put(order.get(i),userInfo.get(0));
        }
        return map;
    }*/

}


