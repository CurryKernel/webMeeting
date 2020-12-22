package DAO.impl;


import DAO.JDBCUtils;
import DAO.OrderHotelRespository;
import VO.OrderHotel;
import VO.ShowOrderHotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderHotelImpl implements OrderHotelRespository {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    OrderHotel oh = null;
    ShowOrderHotel oh1=null;

    //管理员查
    @Override
    public List<OrderHotel> findAll() {
        List<OrderHotel> list = new ArrayList<>();

        String sql = "select * from orderHotel order by userId";

        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                int state = rs.getInt(3);
                String hotelId = rs.getString(4);
                String meetingId = rs.getString(5);
                oh = new OrderHotel(userid, people, state,hotelId,meetingId);
                list.add(oh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }
    @Override
    public List<OrderHotel> findAll(int currentPage, int pageSize) {
        List<OrderHotel> list = new ArrayList<>();

        String sql = "select * from orderHotel limit ?,? order by userId";

        currentPage = (currentPage - 1) * pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, currentPage);
            pre.setInt(2, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                int state = rs.getInt(3);
                String hotelid = rs.getString(4);
                String meetingId = rs.getString(5);
                oh = new OrderHotel(userid, people, state,hotelid,meetingId);
                list.add(oh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }
    @Override
    public void insert(String userId, int people, int state, String hotelId) {

    }
    @Override
    public List<OrderHotel> findByUserId(String userId) {
        List<OrderHotel> list = new ArrayList<>();
        String sql = "select * from orderHotel order by people";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                int state = rs.getInt(3);
                String hotelId = rs.getString(4);
                String meetingId = rs.getString(5);
                oh = new OrderHotel(userid,people,state,hotelId,meetingId);
                list.add(oh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    //酒店查
    @Override
    public List<OrderHotel> findByUserId(String userId, int currentPage, int pageSize) {
        List<OrderHotel> list = new ArrayList<>();

        String sql = "select * where userId = ? limit ?,? order by people";

        currentPage = (currentPage - 1) * pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setInt(2, currentPage);
            pre.setInt(3, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                int state = rs.getInt(3);
                String hotelid = rs.getString(4);
                String meetingId = rs.getString(5);
                oh = new OrderHotel(userid, people, state,hotelid,meetingId);
                list.add(oh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }


    @Override
    public List<ShowOrderHotel> findByHotel_User_Page(String hotelId,String userId, int currentPage, int pageSize) {
        /*String sql = "select orderHotel.userId,username,phone,people,time,state,hotelId from orderHotel,meeting,user " +
                "where user.userId=orderHotel.userId and meeting.userId=orderHotel.userId and user.userId = ? and hotelId=? order by user.userId ";*/
        String sql = "select  distinct username,phone,people,time,state,orderHotel.meetingId from orderHotel,meeting,user " +
                "where user.userId=orderHotel.userId  and orderHotel.meetingId=meeting.meetingId " +
                " and user.userId = ? and hotelId=? limit ?,?  ";
        List<ShowOrderHotel> list=new ArrayList<>();

        Integer currentPagestart = (currentPage - 1) * pageSize;
        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setString(2,hotelId);
            pre.setInt(3, currentPagestart);
            pre.setInt(4, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                String username=rs.getString(1);
                String phone=rs.getString(2);
                int people = rs.getInt(3);
                String time=rs.getString(4);
                int state = rs.getInt(5);
                String meetingId=rs.getString(6);
                //String hotelid=rs.getString(4);
                oh1 = new ShowOrderHotel(userId,username,phone,people,time,state,hotelId,meetingId);
                list.add(oh1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<ShowOrderHotel> findByHotel(String hotelId){
        List<ShowOrderHotel> list=new ArrayList<>();
        String sql = "select  distinct orderHotel.userId,username,phone,people,time,state,orderHotel.meetingId from orderHotel,meeting,user " +
                " where user.userId=orderHotel.userId  and orderHotel.meetingId=meeting.meetingId " +
                " and hotelId=?";

        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userId = rs.getString(1);
                String username=rs.getString(2);
                String phone=rs.getString(3);
                int people = rs.getInt(4);
                String time=rs.getString(5);
                int state = rs.getInt(6);
                String meetingId=rs.getString(7);
                //String hotelid=rs.getString(4);
                oh1 = new ShowOrderHotel(userId,username,phone,people,time,state,hotelId,meetingId);
                list.add(oh1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<ShowOrderHotel> findByHotel_page(String hotelId, int currentPage, int pageSize) {
        List<ShowOrderHotel> list = new ArrayList<>();

        String sql = "select distinct orderHotel.userId,username,phone,people,time,state,orderHotel.meetingId from orderHotel,meeting,user " +
                " where user.userId=orderHotel.userId  and orderHotel.meetingId=meeting.meetingId  " +
                " and hotelId=? limit ?,?  ";

        Integer currentPagestart = (currentPage - 1) * pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            pre.setInt(2, currentPagestart);
            pre.setInt(3, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userId = rs.getString(1);
                String username=rs.getString(2);
                String phone=rs.getString(3);
                int people = rs.getInt(4);
                String time=rs.getString(5);
                int state = rs.getInt(6);
                String meetingId=rs.getString(7);
                oh1 = new ShowOrderHotel(userId,username,phone,people,time,state,hotelId,meetingId);
                list.add(oh1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<ShowOrderHotel> findByPeople_Hotel_Page(String hotelId, int people, int currentPage, int pageSize) {
        List<ShowOrderHotel> list = new ArrayList<>();
        String sql = "select distinct orderHotel.userId,username,phone,time,state,orderHotel.meetingId from orderHotel,meeting,user " +
                "where user.userId=orderHotel.userId  and orderHotel.meetingId=meeting.meetingId  " +
                " and people = ? and hotelId=? limit ?,? ";
        Integer currentPagestart = (currentPage - 1) * pageSize;
        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1,people);
            pre.setString(2,hotelId);
            pre.setInt(3, currentPagestart);
            pre.setInt(4, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userId = rs.getString(1);
                String username=rs.getString(2);
                String phone=rs.getString(3);
                String time = rs.getString(4);
                int state = rs.getInt(5);
                String meetingId=rs.getString(6);
                oh1 = new ShowOrderHotel(userId,username,phone,people,time,state,hotelId,meetingId);
                list.add(oh1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<ShowOrderHotel> findByPeople_Hotel_Page_Inter1(String hotelId, int peoplemin, int peoplemax, int currentPage, int pageSize) {
        List<ShowOrderHotel> list = new ArrayList<>();
        String sql = "select distinct orderHotel.userId,username,phone,time,state,people ,orderHotel.meetingId from orderHotel,meeting,user " +
                "where user.userId=orderHotel.userId and orderHotel.meetingId=meeting.meetingId " +
                " and hotelId=? and people >= ? and people<= ? limit ?,? ";
        Integer currentPagestart = (currentPage - 1) * pageSize;
        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            pre.setInt(2,peoplemin);
            pre.setInt(3,peoplemax);
            pre.setInt(4, currentPagestart);
            pre.setInt(5, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userId = rs.getString(1);
                String username=rs.getString(2);
                String phone=rs.getString(3);
                String time = rs.getString(4);
                int state = rs.getInt(5);
                int people = rs.getInt(6);
                String meetingId=rs.getString(7);
                oh1 = new ShowOrderHotel(userId,username,phone,people,time,state,hotelId,meetingId);
                list.add(oh1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<ShowOrderHotel> findByPeople_Hotel_Page_Inter2(String hotelId, int peoplemin, int currentPage, int pageSize) {
        List<ShowOrderHotel> list = new ArrayList<>();
        String sql = "select distinct orderHotel.userId,username,phone,time,state,people,orderHotel.meetingId from orderHotel,meeting,user " +
                "where user.userId=orderHotel.userId and orderHotel.meetingId=meeting.meetingId " +
                " and hotelId=? and people >= ? limit ?,? ";
        Integer currentPagestart = (currentPage - 1) * pageSize;
        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            pre.setInt(2,peoplemin);
            pre.setInt(3, currentPagestart);
            pre.setInt(4, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userId = rs.getString(1);
                String username=rs.getString(2);
                String phone=rs.getString(3);
                String time = rs.getString(4);
                int state = rs.getInt(5);
                int people = rs.getInt(6);
                String meetingId=rs.getString(7);
                oh1 = new ShowOrderHotel(userId,username,phone,people,time,state,hotelId,meetingId);
                list.add(oh1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<ShowOrderHotel> findByState_Hotel_Page(String hotelId, int state, int currentPage, int pageSize) {
        List<ShowOrderHotel> list = new ArrayList<>();
        String sql = "select distinct orderHotel.userId,username,phone,people,time,orderHotel.meetingId from orderHotel,meeting,user " +
                "where user.userId=orderHotel.userId  and orderHotel.meetingId=meeting.meetingId " +
                " and state = ? and hotelId=? limit ?,?  ";
        Integer currentPagestart = (currentPage - 1) * pageSize;

        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1,state);
            pre.setString(2,hotelId);
            pre.setInt(3, currentPagestart);
            pre.setInt(4, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userId = rs.getString(1);
                String username=rs.getString(2);
                String phone=rs.getString(3);
                int people = rs.getInt(4);
                String time = rs.getString(5);
                String meetingId=rs.getString(6);
                oh1 = new ShowOrderHotel(userId,username,phone,people,time,state,hotelId,meetingId);
                list.add(oh1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<ShowOrderHotel> findByUser_Hotel_Meeting_Page(String hotelId, String userId, String meetingId, int currentPage, int pageSize) {
        List<ShowOrderHotel> list = new ArrayList<>();
        String sql = "select distinct state,username,phone,people,time from orderHotel,meeting,user " +
                "where user.userId=orderHotel.userId  and orderHotel.meetingId=meeting.meetingId " +
                " and orderHotel.userId = ? and hotelId=?  and orderHotel.meetingId=? limit ?,?  ";
        Integer currentPagestart = (currentPage - 1) * pageSize;

        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setString(2,hotelId);
            pre.setString(3,meetingId);
            pre.setInt(4, currentPagestart);
            pre.setInt(5, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                int state = rs.getInt(1);
                String username=rs.getString(2);
                String phone=rs.getString(3);
                int people = rs.getInt(4);
                String time = rs.getString(5);
                oh1 = new ShowOrderHotel(userId,username,phone,people,time,state,hotelId,meetingId);
                list.add(oh1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }


    //增

    @Override
    public void insert(String userId, int people, int state, String hotelId,String meetingId) {
        String sql="insert into orderHotel values (?,?,?,?,?)";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setInt(2,people);
            pre.setInt(3,state);
            pre.setString(4,hotelId);
            pre.setString(5,meetingId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    public void insertorder(OrderHotel orderHotel){
        String sql="insert into orderHotel values (?,?,?,?,?)";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,orderHotel.getUserId());
            pre.setInt(2,orderHotel.getPeople());
            pre.setInt(3,orderHotel.getState());
            pre.setString(4,orderHotel.getHotelId());
            pre.setString(5,orderHotel.getMeetingId());
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }

    }


    //删
    @Override
    public void deleteByUserId_Hotelid(String userId,String hotelid) {
        String sql = "delete from orderHotel where userId = ? and hotelid=?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setString(2,hotelid);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

    //改

    @Override
    public void update(String userId, String userId1, int people, int state,String hotelId) {
        String sql="update orderHotel set userId = ?,people = ?,state = ?,hotelId=? where userId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId1);
            pre.setInt(2,people);
            pre.setInt(3,state);
            pre.setString(1,hotelId);
            pre.setString(5,userId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    public void update_state(String userId, String hotelId, int newstate,String meetingId) {
        String sql="update orderHotel set state = ? where userId = ? and hotelId= ? and meetingId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1,newstate);
            pre.setString(2,userId);
            pre.setString(3,hotelId);
            pre.setString(4,meetingId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally{
            JDBCUtils.closeConnect();
        }
    }

    //记录数
    @Override
    public int count() {
        int rowCount = 0;
        String sql = "select count(*) from orderHotel";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            if(rs.next())
            {
                rowCount=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();
        }
        return rowCount;
    }

    @Override
    public int countByUserId_Hotelid(String userId, String hotelId) {
        int rowCount = 0;
        String sql = "select count(*) from orderHotel where userId=? and hotelId=?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setString(2,hotelId);
            rs = pre.executeQuery();
            if(rs.next())
            {
                rowCount=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();
        }
        return rowCount;
    }

    @Override
    public int countByHotelid(String hotelId) {
        int rowCount = 0;
        String sql = "select count(*) from orderHotel where hotelId=?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            rs = pre.executeQuery();
            if(rs.next())
            {
                rowCount=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();
        }
        return rowCount;
    }

    @Override
    public int countByPeople_Hotelid(int people, String hotelId) {
        int rowCount = 0;
        String sql = "select count(*) from orderHotel where hotelId=? and people=?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            pre.setInt(2,people);
            rs = pre.executeQuery();
            if(rs.next())
            {
                rowCount=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();
        }
        return rowCount;
    }

    @Override
    public int countByState_Hotelid(int state, String hotelId) {
        int rowCount = 0;
        String sql = "select count(*) from orderHotel where hotelId=? and state=?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            pre.setInt(2,state);
            rs = pre.executeQuery();
            if(rs.next())
            {
                rowCount=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();
        }
        return rowCount;
    }

    @Override
    public Integer PageTotal(String hotelId) {
        int rowCount = 0;
        String sql = "select count(*) from orderHotel where hotelId=?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            rs = pre.executeQuery();
            if(rs.next())
            {
                rowCount=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();
        }
        return rowCount;
    }


    @Override
    public int count(String userId) {
        int rowCount = 0;
        String sql = "select count(*) from orderHotel where userId=?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            rs = pre.executeQuery();
            if(rs.next())
            {
                rowCount=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();
        }
        return rowCount;
    }





}








