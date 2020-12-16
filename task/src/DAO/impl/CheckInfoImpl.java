package DAO.impl;

import DAO.JDBCUtils;
import DAO.CheckInfoRespository;
import VO.CheckInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CheckInfoImpl implements CheckInfoRespository {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    CheckInfo u = null;
    //CheckInfoRespository CIR=new  CheckInfoImpl();

   @Override
    public List<CheckInfo> findByUserId(String userId) {
        List<CheckInfo> list = new ArrayList<>();
        String sql = "select joinMeeting.meetingId,user.userId,phone,department,email,userName from meeting,joinMeeting,user where meeting.meetingId=joinMeeting.meetingId AND joinMeeting.userId=user.userId AND meeting.userID=? order by meeting.meetingId";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, userId);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId = rs.getString(1);
                String userid = rs.getString(2);
                String phone = rs.getString(3);
                String department=rs.getString(4);
                String email=rs.getString(5);
                String userName = rs.getString(6);
                u = new CheckInfo(meetingId,userid,phone,department,email,userName);
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<CheckInfo> selets(CheckInfo t) {
        List<CheckInfo> list=new ArrayList<CheckInfo>();
        conn = JDBCUtils.getConnect();
        String sql = "select joinMeeting.meetingId,user.userId,userName,phone,department,email from meeting,joinMeeting,user where meeting.meetingId=joinMeeting.meetingId AND joinMeeting.userId=user.userId AND meeting.userID=? order by meeting.meetingId";
        try {
            //连接数据库
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId = rs.getString(1);
                String userid = rs.getString(2);
                String userName = rs.getString(3);
                String phone = rs.getString(4);
                String department=rs.getString(5);
                String email=rs.getString(6);
                u = new CheckInfo(meetingId,userid,userName,phone,department,email);
                list.add(u);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<CheckInfo> findByUserId(String userId, int currentPage, int pageSize) {
        return null;
    }

    @Override
    public List<String> getJoinMeetings(String userId) {
        return null;
    }

    @Override
    public List<CheckInfo> findAll() {
        List<CheckInfo> list = new ArrayList<>();
        String sql = "select joinMeeting.meetingId,user.userId,userName,phone,department,email \n" +
                "from meeting,joinMeeting,user \n" +
                "where meeting.meetingId=joinMeeting.meetingId AND \n" +
                "joinMeeting.userId=user.userId AND meeting.userID=?\n" +
                "order by meeting.meetingId\n" +
                "\t";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId = rs.getString(1);
                String userId = rs.getString(2);
                String userName = rs.getString(3);
                String phone = rs.getString(4);
                String department=rs.getString(5);
                String email=rs.getString(6);
                u = new CheckInfo(meetingId,userId,userName,phone,department,email);
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<CheckInfo> findAll(int pageId, int pageSize) {
        List<CheckInfo> list = new ArrayList<>();

        String sql = "select * from user limit ?,? order by userId";

        pageId = (pageId-1)*pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1,pageId);
            pre.setInt(2,pageSize);
            rs = pre.executeQuery();
            while(rs.next()){
                String userId = rs.getString(1);
                String userName = rs.getString(2);
                String password = rs.getString(3);
                String phone = rs.getString(4);
                String department=rs.getString(5);
                String email=rs.getString(6);
                u = new CheckInfo(userId,userName,password,phone,department,email);
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public void insert(String userId, String username, String password, String phone,String department,String email) {
        String sql="insert into user values (?,?,?,?,?,?)";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            pre.setString(2,username);
            pre.setString(3,password);
            pre.setString(4,phone);
            pre.setString(5,department);
            pre.setString(6,email);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    public int deleteByUserId(String userId) {
       int result=0;
        String sql="delete from joinMeeting where userId =?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            result= pre.executeUpdate();

           // pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();

        } finally{

            JDBCUtils.closeConnect();
        }
        return result;

    }

   /* @Override
    public int delete(CheckInfo ci) {
       int a=0;
       a=CIR.delete(ci);
        return a;
    }*/

    @Override
    public void update(String userId, String username, String password, String phone,String department,String email) {
        String sql="update user set username=?,password=?,phone=?,department=?,email=? where userId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,username);
            pre.setString(2,password);
            pre.setString(3,phone);
            pre.setString(4,department);
            pre.setString(5,email);
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
        String sql = "select count(*) from user";
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

}
