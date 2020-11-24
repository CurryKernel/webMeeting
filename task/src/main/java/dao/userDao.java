package main.java.dao;

import main.java.pojo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class userDao {
    //专门对User表进行操作,须添加jdbc包

    /**
     * 输入一个User实例，在数据库user表添加数据
     * */
    public static void insertUser(User u){
        String sql = "insert into user (userId, userName, password, phone, department, email)" +
                "values (?, ?, ?, ?, ?, ?);";
        //sql语句
        Connection connect = dbUtils.getConnect();
        //与数据库建立连接

        try{
            //预编译对象，防止sql注入
            PreparedStatement pst = connect.prepareStatement(sql);
            //将数据填入sql语句？处
            pst.setString(1,u.getUserId());
            pst.setString(2,u.getUserName());
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
            dbUtils.closeConnect(connect);
        }
    }


    /**
     * 根据用户ID删除该用户的行
     * */
    public static void deleteById(String userId){
        String sql = "delete from user where userId = ?";
        //sql语句
        Connection connect = dbUtils.getConnect();
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
            dbUtils.closeConnect(connect);
        }
    }


    /**
     * 查询某个用户ID是否存在
     * */
    public static boolean queryById(String userId){
        String sql = "select userId from user where userId = ?";
        //sql语句
        Connection connect = dbUtils.getConnect();
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
            dbUtils.closeConnect(connect);
            if(i == 0)
                return false;
            else return true;
        }
    }
}
