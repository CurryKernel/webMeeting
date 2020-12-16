package DAO.impl;


import DAO.JDBCUtils;
import DAO.MeetingRespository;
import VO.Meeting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MeetingImpl implements MeetingRespository {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    Meeting m = null;

    @Override
    public List<Meeting> findByMeetingId(String meetingId, int pageId, int pageSize) {
        List<Meeting> list = new ArrayList<>();
        String sql = "select * from meeting where meetingId = ? limit ?,? order by meetingId";
        pageId = (pageId-1)*pageSize;
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1,meetingId);
            pre.setInt(2,pageId);
            pre.setInt(3,pageSize);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId1 = rs.getString(1);
                String userId = rs.getString(2);
                String place = rs.getString(3);
                int peopleCount = rs.getInt(4);
                String time = rs.getString(5);
                String detail =rs.getString(6);
                m = new Meeting(meetingId1,userId,place,peopleCount,time,detail);
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Meeting> findByMeetingId(String meetingId) {
        List<Meeting> list = new ArrayList<>();
        String sql = "select * from meeting where meetingId = ? order by meetingId";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1,meetingId);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId1 = rs.getString(1);
                String userId = rs.getString(2);
                String place = rs.getString(3);
                int peopleCount = rs.getInt(4);
                String time = rs.getString(5);
                String detail =rs.getString(6);
                m = new Meeting(meetingId1,userId,place,peopleCount,time,detail);
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public List<Meeting> findByUserId(String userId, int pageId, int pageSize){
        List<Meeting> list = new ArrayList<>();
        String sql = "select * from meeting where userId = ? limit ?,? order by meetingId";
        pageId = (pageId-1)*pageSize;
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setInt(2,pageId);
            pre.setInt(3,pageSize);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId = rs.getString(1);
                String userId1 = rs.getString(2);
                String place = rs.getString(3);
                int peopleCount = rs.getInt(4);
                String time = rs.getString(5);
                String detail =rs.getString(6);
                m = new Meeting(meetingId,userId1,place,peopleCount,time,detail);
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public List<Meeting> findByUserId(String userId){
        List<Meeting> list = new ArrayList<>();
        String sql = "select * from meeting where userId = ? order by meetingId";

        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId = rs.getString(1);
                String userId1 = rs.getString(2);
                String place = rs.getString(3);
                int peopleCount = rs.getInt(4);
                String time = rs.getString(5);
                String detail =rs.getString(6);
                m = new Meeting(meetingId,userId1,place,peopleCount,time,detail);
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public List<Meeting> findAll(int pageId, int pageSize) {
        List<Meeting> list = new ArrayList<>();

        String sql = "select * from meeting limit ?,? order by meetingId";

        pageId = (pageId-1)*pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1,pageId);
            pre.setInt(2,pageSize);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId = rs.getString(1);
                String userId1 = rs.getString(2);
                String place = rs.getString(3);
                int peopleCount = rs.getInt(4);
                String time = rs.getString(5);
                String detail = rs.getString(6);
                m = new Meeting(meetingId,userId1,place,peopleCount,time,detail);
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<Meeting> findAll() {
        List<Meeting> list = new ArrayList<>();

        String sql = "select * from meeting order by meetingId";

        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId = rs.getString(1);
                String userId1 = rs.getString(2);
                String place = rs.getString(3);
                int peopleCount = rs.getInt(4);
                String time = rs.getString(5);
                String detail = rs.getString(6);
                m = new Meeting(meetingId,userId1,place,peopleCount,time,detail);
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public void deleteByMeetingId(String meetingId) {
        String sql="delete from meeting where meetingId = ?";
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
    public void update(String meetingId, String meetingId1, String userId, String place, int peopleCount, String time,String detail) {
        String sql="update meeting set meetingId=?,userId=?,place=?,peopleCount=?,time=? where meetingId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,meetingId1);
            pre.setString(2,userId);
            pre.setString(3,place);
            pre.setInt(4,peopleCount);
            pre.setString(5,time);
            pre.setString(6,detail);
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
        String sql = "select count(*) from meeting";
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
    public List<Meeting> findByPartOfUserId(String partId) {
        List<Meeting> list = new ArrayList<>();
        String sql = "select * from meeting where meetingId like ? order by meetingId";

        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            String NPartId = "%"+partId+"%";
            pre.setString(1, NPartId);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId = rs.getString(1);
                String userId1 = rs.getString(2);
                String place = rs.getString(3);
                int peopleCount = rs.getInt(4);
                String time = rs.getString(5);
                String detail = rs.getString(6);
                m = new Meeting(meetingId,userId1,place,peopleCount,time,detail);
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public void update(String meetingId, Meeting meeting) {
        String sql="update meeting set meetingId=?,userId=?,place=?,peopleCount=?,time=?,detail=? where meetingId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,meeting.getMeetingId());
            pre.setString(2,meeting.getUserId());
            pre.setString(3,meeting.getPlace());
            pre.setInt(4,meeting.getPeopleCount());
            pre.setString(5,meeting.getTime());
            pre.setString(6,meeting.getDetail());
            pre.setString(7,meetingId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    public String checkMeetingId(String meetingId){
        conn = JDBCUtils.getConnect();
        String sql = "select meetingId from meeting where meetingId=?";
        String str = null;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1,meetingId);
            if (pre.executeQuery().next() == true) {
                str = "1";
            } else {
                str = "0";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return str;
    }

    @Override
    public int insert(String meetingId, String userId, String place, int peopleCount, String time,String detail) {
        String sql="insert into meeting values (?,?,?,?,?,?)";
        int result=0;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,meetingId);
            pre.setString(2,userId);
            pre.setString(3,place);
            pre.setInt(4,peopleCount);
            pre.setString(5,time);
            pre.setString(6,detail);
            result= pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
        return result;
    }

    @Override
    public int updatePeopleByMeetingId(String meetingId, int peopleCount) {
        String sql="update meeting set peopleCount=? where meetingId = ?";
        int result = 0;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1,peopleCount);
            pre.setString(2,meetingId);
            result=pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally{
            JDBCUtils.closeConnect();
        }
        return result;
    }
}
