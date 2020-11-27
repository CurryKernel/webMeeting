package DAO.impl;

import DAO.JDBCUtils;
import DAO.UserRespository;
import VO.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserImpl implements UserRespository {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    User u = null;

    @Override
    public List<String> getJoinMeetings(String userId) {
        List<String> list = new ArrayList<>();
        String sql = "select jm.meetingId from joinMeeting jm where jm.userId = ?";
        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1,userId);
            rs = pre.executeQuery();
            while(rs.next()){
                String meetingId = rs.getString(1);
                list.add(meetingId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
        return list;
    }

    @Override
    public List<User> findAll() {
        List<User> list = new ArrayList<>();
        String sql = "select * from user order by userId";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                String userId = rs.getString(1);
                String userName = rs.getString(2);
                String password = rs.getString(3);
                String phone = rs.getString(4);
                String department=rs.getString(5);
                String email=rs.getString(6);
                u = new User(userId,userName,password,phone,department,email);
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
    public List<User> findAll(int pageId, int pageSize) {
        List<User> list = new ArrayList<>();

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
                u = new User(userId,userName,password,phone,department,email);
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
    public void deleteByUserId(String userId) {
        String sql="delete from user where userId = ?";
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
    @Override
    public List<User> findByUserId(int userId) {
        List<User> list = new ArrayList<>();
        String sql = "select * from user where userId = ?";

        conn = JDBCUtils.getConnect();
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, String.valueOf(userId));
            rs = pre.executeQuery();
            while(rs.next()){

                String userId1 = rs.getString(1);
                String userName = rs.getString(2);
                String password = rs.getString(3);
                String phone = rs.getString(4);
                String department=rs.getString(5);
                String email=rs.getString(6);
                u = new User(userId1,userName,password,phone,department,email);
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.closeConnect();
        }
        return list;
    }
}