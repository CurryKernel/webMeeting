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
    @Override
    public  void insertUser(User u){
        String sql = "insert into user (userId, userName, password, phone, department, email)" +
                "values (?, ?, ?, ?, ?, ?);";
        //sql语句
        Connection connect = JDBCUtils.getConnect();
        //与数据库建立连接

        try{
            //预编译对象，防止sql注入
            PreparedStatement pst = connect.prepareStatement(sql);
            //将数据填入sql语句？处
            pst.setString(1,u.getUserId());
            pst.setString(2,u.getUsername());
            pst.setString(3,u.getPassword());
            pst.setString(4,u.getPhone());
            pst.setString(5,u.getDepartment());
            pst.setString(6,u.getEmail());
            //执行sql语句
            pst.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            //关闭连接
            JDBCUtils.closeConnect(connect);
        }
    }


    /**
     * 根据用户ID删除该用户的行
     * */
    @Override
    public void deleteById(String userId){
        String sql = "delete from user where userId = ?";
        //sql语句
        Connection connect = JDBCUtils.getConnect();
        //与数据库建立连接

        try{
            //预编译对象，防止sql注入
            PreparedStatement pst = connect.prepareStatement(sql);
            //将数据填入sql语句？处
            pst.setString(1,userId);
            //执行sql语句
            pst.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            //关闭连接
            JDBCUtils.closeConnect(connect);
        }
    }


    /**
     * 查询某个用户ID是否存在
     * */
    @Override
    public  boolean queryById(String userId){
        String sql = "select userId from user where userId = ?";
        //sql语句
        Connection connect = JDBCUtils.getConnect();
        //与数据库建立连接
        int i = 0;
        //用于判断是否ID已经存在

        try{
            //预编译对象，防止sql注入
            PreparedStatement pst = connect.prepareStatement(sql);
            //将数据填入sql语句？处
            pst.setString(1,userId);
            //执行sql语句
            ResultSet resultSet = pst.executeQuery();
            while(resultSet.next()){
                i = 1;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            //关闭连接
            JDBCUtils.closeConnect(connect);
            if(i == 0) {
                return false;
            } else {
                return true;
            }
        }
    }
}
