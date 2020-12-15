package DAO.impl;


import DAO.DriverRespository;
import DAO.JDBCUtils;
import VO.Driver;
import VO.OrderCar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DriverImpl implements DriverRespository {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    Driver driver = null;
    OrderCar orderCar = null;
    @Override
    public List<Driver> findAll() {
        List<Driver> list = new ArrayList<>();

        String sql = "select * from driver";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                String id = rs.getString(1);
                String password = rs.getString(2);
                String phone = rs.getString(3);
                String description = rs.getString(4);
                driver = new Driver(id,password,phone,description);
                list.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
        return list;
    }

//    @Override
//    public void insert(String id, String password, String phone, String description) {
//
//    }

    @Override
    public List<Driver> findAll(int pageId, int pageSize) {
        List<Driver> list = new ArrayList<>();

        String sql = "select * from driver limit ?,?";

        pageId=(pageId-1)*pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1,pageId);
            pre.setInt(2,pageSize);
            rs = pre.executeQuery();
            while(rs.next()){
                String id = rs.getString(1);
                String password = rs.getString(2);
                String phone = rs.getString(3);
                String description = rs.getString(4);
                driver = new Driver(id,password,phone,description);
                list.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
        return list;
    }

    @Override
    public void insert(String id, String password, String phone,String description) {
        String sql="insert into driver values (?,?,?,?)";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,id);
            pre.setString(2,password);
            pre.setString(3,phone);
            pre.setString(4,description);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    public void deleteByDriverId(String driverId) {
        String sql="delete from driver where driverId = ?";

        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,driverId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

//    @Override
//    public void update(String id, String id1, String password, String phone, String description) {
//
//    }

    @Override
    public void update(String id, String id1, String password, String phone,String description) {
        String sql="update driver set driverId = ?,password = ?,phone = ?,description = ? where driverId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,id1);
            pre.setString(2,password);
            pre.setString(3,phone);
            pre.setString(4,description);
            pre.setString(5,id);
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
        String sql = "select count(*) from driver";
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
    public boolean check(String id, String password) {
        boolean flag = false;
        String sql = "select * from driver where driverId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,id);
            rs = pre.executeQuery();
            while(rs.next()){
                String password1 = rs.getString(2);
                if(password.equals(password1)) {
                    flag = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeConnect();
        }
        return flag;
    }


    @Override
    public List<Driver> findByDriverId(String driverId) {
        List<Driver> list = new ArrayList<>();
        String sql = "select * from driver where driverId = ?";

        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, String.valueOf(driverId));
            rs = pre.executeQuery();
            while(rs.next()){
                String driverId1 = rs.getString(1);
                String password = rs.getString(2);
                String phone = rs.getString(3);
                String description =rs.getString(4);
                driver = new Driver(driverId1,password,phone,description);
                list.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.closeConnect();
        }
        return list;
    }

    @Override
    public List<OrderCar> findOrderCarByDriverId(String driverId) {
        List<OrderCar> list = new ArrayList<OrderCar>();
        String sql = "select * from orderCar where driverId = ?";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, String.valueOf(driverId));
            rs = pre.executeQuery();
            while(rs.next()){
                String userId = rs.getString(1);
                int people = rs.getInt(2);
                String place = rs.getString(3);
                int state = rs.getInt(4);
                String deadline = rs.getString(5);
                String driverId1 = rs.getString(6);
                orderCar = new OrderCar(userId,people,place,state,deadline,driverId1);
                list.add(orderCar);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.closeConnect();
        }
        return list;
    }


}

