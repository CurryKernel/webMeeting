package DAO.impl;

import DAO.AdminRespository;
import DAO.JDBCUtils;
import VO.Admin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminImpl implements AdminRespository {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    Admin admin = null;

    @Override
    public List<Admin> findAll() {
        List<Admin> list = new ArrayList<>();

        String sql = "select * from admin";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                String id = rs.getString(1);
                String password = rs.getString(2);
                admin = new Admin(id,password);
                list.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    //currentPage是当前页数，从1开始；pageSize是页面存放的数据数
    public List<Admin> findAll(int currentPage, int pageSize) {
        List<Admin> list = new ArrayList<>();

        String sql = "select * from admin limit ?,?";

        currentPage = (currentPage-1)*pageSize;
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setInt(1,currentPage);
            pre.setInt(2,pageSize);
            rs = pre.executeQuery();
            while(rs.next()){
                String id = rs.getString(1);
                String password = rs.getString(2);
                admin = new Admin(id,password);
                list.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }
    @Override
    public void insert(String id, String password) {
        String sql="insert into admin values (?,?)";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,id);
            pre.setString(2,password);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    public void deleteById(String id) {
        String sql="delete from admin where adminId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,id);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    public void update(String id, String password) {
        String sql="update admin set password = ? where adminId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,password);
            pre.setString(2,id);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();
        }
    }

    @Override
    public int count() {
        int rowCount = 0;
        String sql = "select count(*) from admin";
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
    public String check(String adminId,String password) {
        conn = JDBCUtils.getConnect();
        String str = null;
        String sql = "select * from admin";
        if(conn!=null) {
            try {
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sql);
                while(rs.next()){
                    String adminId1=rs.getString("adminId");
                    String password1 = rs.getString(2);
                    if(adminId.equals(adminId1)&&password.equals(password1)) {
                        str = "1";
                        break;
                    }
                    else{
                        str="0";
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                JDBCUtils.closeConnect();
            }
        } else{
            str="0";
        }
        return str;
    }


    @Override
    public Admin findById(String id) {

        String sql = "select * from admin where AdminId=?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,id);
            rs = pre.executeQuery();
            while(rs.next()){
                String Id = rs.getString(1);
                String password = rs.getString(2);
                admin = new Admin(Id,password);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return admin;
    }
}
