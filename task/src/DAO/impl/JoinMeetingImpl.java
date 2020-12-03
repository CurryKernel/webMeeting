package DAO.impl;


import DAO.JDBCUtils;
import DAO.JoinMeetingRespository;
import VO.JoinMeeting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class JoinMeetingImpl implements JoinMeetingRespository {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    JoinMeeting jm = null;
    @Override
    public List<JoinMeeting> findAll(int pageId, int pageSize) {
        List<JoinMeeting> list = new ArrayList<>();

        String sql = "select * from joinMeeting limit ?,? order by userId";

        pageId=(pageId-1)*pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1,pageId);
            pre.setInt(2,pageSize);
            rs = pre.executeQuery();
            while(rs.next()){
                String userid = rs.getString(1);
                String meetingid = rs.getString(2);
                jm = new JoinMeeting(userid,meetingid);
                list.add(jm);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }
//insert用了，其余的要用需要改
    @Override
    public void insert(String userId, String meetingId ,int needCar , int needHotel) {
        String sql="insert into joinMeeting values (?,?,?,?)";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setString(2,meetingId);
            pre.setInt(3,needCar);
            pre.setInt(4,needHotel);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    public void deleteByUserId(String userId) {
        String sql="delete from joinMeeting where userId = ?";
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
    public void deleteByMeetingId(String meetingId) {
        String sql="delete from joinMeeting where meetingId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,meetingId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    public void update(String userId, String userId1,String meetingId) {
        String sql="update joinMeeting set userId = ?,meetingId = ? where userId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId1);
            pre.setString(2,meetingId);
            pre.setString(3,userId);
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
        String sql = "select count(*) from joinMeeting";
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
    public List<String> findByUserId(String userId) {
        List<String> list = new ArrayList<>();
        String sql = "select * from joinMeeting where userId = ? order by meetingId asc";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId = rs.getString(2);
                list.add(meetingId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<String> findByMeetingId(String meetingId) {
        List<String> list = new ArrayList<>();
        String sql = "select * from joinMeeting where meetingId = ? order by userId asc";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1,meetingId);
            rs = pre.executeQuery();
            while(rs.next()){
                String userId = rs.getString(1);
                list.add(userId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<JoinMeeting> findAll() {
        List<JoinMeeting> list = new ArrayList<>();

        String sql = "select * from joinMeeting order by userId";

        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                String userid = rs.getString(1);
                String meetingid = rs.getString(2);
                jm = new JoinMeeting(userid,meetingid);
                list.add(jm);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }
}
