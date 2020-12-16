package DAO.impl;
import DAO.CarInfoRespository;
import DAO.JDBCUtils;
import DAO.OrderCarRespository;
import VO.CarInfo;
import VO.OrderCar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarInfoImpl implements CarInfoRespository {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    CarInfo oc = null;
    @Override
    public List<CarInfo> findByUserId(String userId) {
        List<CarInfo> list = new ArrayList<>();
        String sql = "select joinMeeting.meetingId,orderCar.userId,driverId,orderCar.place,deadline,people,state from meeting,joinMeeting,orderCar where meeting.meetingId=joinMeeting.meetingId AND joinMeeting.userId=orderCar.userId AND meeting.userID=? order  by meetingId";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, userId);
            rs = pre.executeQuery();
            while (rs.next()) {
                String meetingid = rs.getString(1);
                String userid = rs.getString(2);
                String driverId = rs.getString(3);
                String place = rs.getString(4);
                String deadline = rs.getString(5);
                int people = rs.getInt(6);
                int state = rs.getInt(7);
                oc = new CarInfo( meetingid, userid,driverId , place,deadline,people,state);
                list.add(oc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public List<CarInfo> findByUserId(String userId, int currentPage, int pageSize) {
        List<CarInfo> list = new ArrayList<>();

        String sql = "select joinMeeting.meetingId,orderCar.userId,driverId,orderCar.place,deadline,people,state\\n\" +\n" +
                "                \"from meeting,joinMeeting,orderCar\\n\" +\n" +
                "                \"where meeting.meetingId=joinMeeting.meetingId AND \\n\" +\n" +
                "                \"joinMeeting.userId=orderCar.userId\\n\" +\n" +
                "                \"AND meeting.userID=?limit ?,? ";

        currentPage=(currentPage-1)*pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setInt(2,currentPage);
            pre.setInt(3,pageSize);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingid = rs.getString(1);
                String userid = rs.getString(2);
                String driverId = rs.getString(3);
                String place = rs.getString(4);
                String deadline = rs.getString(5);
                int people = rs.getInt(6);
                int state = rs.getInt(7);
                oc = new CarInfo( meetingid, userid,driverId , place,deadline,people,state);
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
    public List<CarInfo> findAll() {
        List<CarInfo> list = new ArrayList<>();

        String sql = "select * from orderCar order by userId";

        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingid = rs.getString(1);
                String userid = rs.getString(2);
                String driverId = rs.getString(3);
                String place = rs.getString(4);
                String deadline = rs.getString(5);
                int people = rs.getInt(6);
                int state = rs.getInt(7);
                oc = new CarInfo( meetingid, userid,driverId , place,deadline,people,state);
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
    public List<CarInfo> findAll(int currentPage, int pageSize) {
        List<CarInfo> list = new ArrayList<>();

        String sql = "select * from orderCar limit ?,? order by userId";

        currentPage=(currentPage-1)*pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1,currentPage);
            pre.setInt(2,pageSize);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingid = rs.getString(1);
                String userid = rs.getString(2);
                String driverId = rs.getString(3);
                String place = rs.getString(4);
                String deadline = rs.getString(5);
                int people = rs.getInt(6);
                int state = rs.getInt(7);
                oc = new CarInfo( meetingid, userid,driverId , place,deadline,people,state);
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
