package DAO.impl;


import DAO.JDBCUtils;
import DAO.OrderCarRespository;
import VO.OrderCar;
import VO.OrderInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderCarImpl implements OrderCarRespository {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    OrderCar oc = null;
    OrderInfo oi = null;
    @Override
    public List<OrderCar> findByUserId(String userId) {
        List<OrderCar> list = new ArrayList<>();
        String sql = "select * from orderCar where userId = ? order by people";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, userId);
            rs = pre.executeQuery();
            while (rs.next()) {
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                String place = rs.getString(3);
                int state = rs.getInt(4);
                String driverId = rs.getString(5);
                String deadline = rs.getString(6);
                oc = new OrderCar(userid, people, place, state, driverId,deadline);
                list.add(oc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public List<OrderCar> findByUserId(String userId, int currentPage, int pageSize) {
        List<OrderCar> list = new ArrayList<>();

        String sql = "select * from orderCar where userId = ? limit ?,? order by userId";

        currentPage=(currentPage-1)*pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setInt(2,currentPage);
            pre.setInt(3,pageSize);
            rs = pre.executeQuery();
            while(rs.next()){
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                String place = rs.getString(3);
                int state = rs.getInt(4);
                String driverId = rs.getString(5);
                String deadline = rs.getString(6);
                oc = new OrderCar(userid, people, place, state, driverId,deadline);
                list.add(oc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<OrderInfo> findOrderInfos(String driverId) {
        List<OrderInfo> list = new ArrayList<>();

        String sql ="select userName, phone,place,deadline,people from orderCar inner join user on orderCar.userId = user.userId  where orderCar.driverId = ? and orderCar.state =1 ";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1, driverId);
            rs = pre.executeQuery();
            while(rs.next()){
                String userName = rs.getString(1);
                //System.out.println(userName);
                String phone = rs.getString(2);
                String place = rs.getString(3);
                String deadline = rs.getString(4);
                String people = rs.getString(5);
                oi = new OrderInfo(userName, phone, place, deadline,people);
                list.add(oi);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<OrderCar> findAll() {
        List<OrderCar> list = new ArrayList<>();

        String sql = "select * from orderCar order by userId";

        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                String place = rs.getString(3);
                int state = rs.getInt(4);
                String driverId = rs.getString(5);
                String deadline = rs.getString(6);
                oc = new OrderCar(userid, people, place, state, driverId,deadline);
                list.add(oc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }
    @Override
    public List<OrderCar> findAll(int currentPage, int pageSize) {
        List<OrderCar> list = new ArrayList<>();

        String sql = "select * from orderCar limit ?,? order by userId";

        currentPage=(currentPage-1)*pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1,currentPage);
            pre.setInt(2,pageSize);
            rs = pre.executeQuery();
            while(rs.next()){
                String userid = rs.getString(1);
                int people = rs.getInt(2);
                String place = rs.getString(3);
                int state = rs.getInt(4);
                String driverId = rs.getString(5);
                String deadline = rs.getString(6);
                oc = new OrderCar(userid, people, place, state, driverId,deadline);
                list.add(oc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public void insert(String userId, int people, String place, int state, String deadline,String driverId) {
        String sql="insert into orderCar values (?,?,?,?,?,?)";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setInt(2,people);
            pre.setString(3,place);
            pre.setInt(4,state);
            pre.setString(5,deadline);
            pre.setString(6,driverId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    public void deleteByUserId(String userId) {
        String sql = "delete from orderCar where userId = ?";
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
    public void update(String userId, String userId1, int people, String place, int state, String deadline) {
        String sql="update orderCar set userId = ?,people = ?,place = ?,state = ?,deadline = ? where userId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId1);
            pre.setInt(2,people);
            pre.setString(3,place);
            pre.setInt(4,state);
            pre.setString(5,deadline);
            pre.setString(6,userId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally{
            JDBCUtils.closeConnect();
        }
    }
    @Override
    public boolean changeStatue(String userId, String deadline) {
        String sql = "UPDATE orderCar set state = 2 WHERE userId = ? and deadline = ?";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, userId);
            pre.setString(2, deadline);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }
/*
* 修改为接单状态
* */
    @Override
    public boolean changeStatus(String userId ,String deadline) {
        String sql = "UPDATE orderCar set state = 1 WHERE userId = ? and deadline = ?";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, userId);
            pre.setString(2, deadline);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }



    @Override
    public int count() {
        int rowCount = 0;
        String sql = "select count(*) from orderCar";
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
        String sql = "select count(*) from orderCar where userId = ?";
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
