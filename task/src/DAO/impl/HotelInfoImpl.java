package DAO.impl;
import DAO.HotelInfoRespository;
import DAO.JDBCUtils;
import DAO.OrderHotelRespository;
import VO.HotelInfo;
import VO.OrderHotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
public class HotelInfoImpl implements HotelInfoRespository {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    HotelInfo oh = null;

    @Override
    public List<HotelInfo> findByUserId(String userId) {
        List<HotelInfo> list = new ArrayList<>();
        String sql = "select joinMeeting.meetingId,orderHotel.userId,people,state,HotelId from joinMeeting,meeting,orderHotel where meeting.meetingId=joinMeeting.meetingId AND joinMeeting.userId=orderHotel.userId AND meeting.userID=? order by joinMeeting.meetingId";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingid = rs.getString(1);
                String userid = rs.getString(2);
                int people = rs.getInt(3);
                int state = rs.getInt(4);
                String hotelId = rs.getString(5);
                oh = new HotelInfo(meetingid,userid,people,state,hotelId);
                list.add(oh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public List<HotelInfo> findByUserId(String userId,int currentPage, int pageSize) {
        List<HotelInfo> list = new ArrayList<>();

        String sql = "select * from orderHotel where userId = ? and hotelId=? limit ?,? order by people";

        currentPage = (currentPage - 1) * pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setInt(2, currentPage);
            pre.setInt(3, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                String meetingid = rs.getString(1);
                String userid = rs.getString(2);
                int people = rs.getInt(3);
                int state = rs.getInt(4);
                String hotelId = rs.getString(5);
                oh = new HotelInfo(meetingid,userid,people,state,hotelId);
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
    public List<HotelInfo> findAll() {
        List<HotelInfo> list = new ArrayList<>();

        String sql = "select * from orderHotel order by userId";

        try {
            conn =JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                String meetingid = rs.getString(1);
                String userid = rs.getString(2);
                int people = rs.getInt(3);
                int state = rs.getInt(4);
                String hotelId = rs.getString(5);
                oh = new HotelInfo(meetingid,userid,people,state,hotelId);
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
    public List<HotelInfo> findAll(int currentPage, int pageSize) {
        List<HotelInfo> list = new ArrayList<>();

        String sql = "select * from orderHotel limit ?,? order by userId";

        currentPage = (currentPage - 1) * pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, currentPage);
            pre.setInt(2, pageSize);
            rs = pre.executeQuery();
            while (rs.next()) {
                String meetingid = rs.getString(1);
                String userid = rs.getString(2);
                int people = rs.getInt(3);
                int state = rs.getInt(4);
                String hotelId = rs.getString(5);
                oh = new HotelInfo(meetingid,userid,people,state,hotelId);
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
