package DAO.impl;


import DAO.JDBCUtils;
import DAO.OrderHotelRespository;
import VO.OrderHotel;

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

    @Override
    public List<OrderHotel> findByUserId(String userId,String hotelId, int currentPage, int pageSize) {
        List<OrderHotel> list = new ArrayList<>();

        String sql = "select * from orderHotel where userId = ? and hotelId=? limit ?,? order by people";

        currentPage = (currentPage - 1) * pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setString(2,hotelId);
            pre.setInt(3, currentPage);
            pre.setInt(4, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                int state = rs.getInt(3);
                String hotelid = rs.getString(4);
                oh = new OrderHotel(userid, people, state,hotelid);
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
    public List<OrderHotel> findByUserId_Hotel(String userId,String hotelId) {
        List<OrderHotel> list = new ArrayList<>();
        String sql = "select * from orderHotel where userId = ? and hotelId=? order by people";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            rs = pre.executeQuery();
            while(rs.next()){
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                int state = rs.getInt(3);
                //String hotelid = rs.getString(4);
                oh = new OrderHotel(userid,people,state,hotelId);
                list.add(oh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
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
                String hotelid = rs.getString(4);
                oh = new OrderHotel(userid, people, state,hotelid);
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
                oh = new OrderHotel(userid, people, state,hotelid);
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
    public void insert(String userId, int people, int state,String hotelId) {
        String sql="insert into orderHotel values (?,?,?,?)";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setInt(2,people);
            pre.setInt(3,state);
            pre.setString(4,hotelId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    //这个未更新为酒店的
    public void deleteByUserId(String userId) {
        String sql = "delete from orderHotel where userId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

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

    public List<OrderHotel> findByHotel(String hotelId){
        List<OrderHotel> list = new ArrayList<>();

        String sql = "select * from orderHotel where hotelId=? order by userID";

        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                int state = rs.getInt(3);
                //String hotelid=rs.getString(4);
                oh = new OrderHotel(userid, people, state, hotelId);
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
    public List<OrderHotel> findByPeople_Hotel(String hotelId, int people) {
        List<OrderHotel> list = new ArrayList<>();

        String sql = "select * from orderHotel where hotelId=? and people=? order by hotelID";

        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            pre.setInt(2,people);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userid = rs.getString(1);
                //int people = rs.getInt(2);
                int state = rs.getInt(3);
                oh = new OrderHotel(userid, people, state,hotelId);
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
    public List<OrderHotel> findByState_Hotel(String hotelId, int state) {
        List<OrderHotel> list = new ArrayList<>();

        String sql = "select * from orderHotel where hotelId=? and state=? order by userId";

        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            pre.setInt(2,state);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                //int state = rs.getInt(3);
                oh = new OrderHotel(userid, people, state,hotelId);
                list.add(oh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }


}
