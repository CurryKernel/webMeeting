package DAO.impl;


import DAO.HotelRespository;
import DAO.JDBCUtils;
import VO.Hotel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HotelImpl implements HotelRespository {
    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    Hotel hotel = null;

    @Override
    public List<Hotel> findAll() {
        List<Hotel> list = new ArrayList<>();

        String sql = "select * from hotel";

        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                String id = rs.getString(1);
                String password = rs.getString(2);
                String description=rs.getString(3);
                hotel = new Hotel(id,password, description);
                list.add(hotel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public List<Hotel> findAll(int pageId, int pageSize) {
        List<Hotel> list = new ArrayList<>();

        String sql = "select * from hotel limit ?,?";

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
                String description=rs.getString(3);
                hotel = new Hotel(id,password, description);
                list.add(hotel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JDBCUtils.closeConnect();//关闭数据库连接
        }
        return list;
    }

    @Override
    public String insert(String hotelId, String password,String description) {
        conn = JDBCUtils.getConnect();
        String sql = "insert into hotel(hotelId,password,description)values(?,?,?)";
        String str = null;
        try {
            pre = conn.prepareStatement(sql);
            //pre = conn.prepareStatement(sql);
            pre.setString(1,hotelId);
            pre.setString(2,password);
            pre.setString(3,description);
            int row = pre.executeUpdate();
            if(row>0){
                str="1";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            str="0";
        } finally{
            JDBCUtils.closeConnect();
        }
        return str;
    }

    @Override
    public void deleteById(String id) {
        String sql="delete from hotel where hotelId = ?";
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
    public void update(String id, String id1, String password) {
        String sql="update hotel set hotelId = ?,password = ? where hotelId = ?";
        try {
            conn = JDBCUtils.getConnect();
            pre = conn.prepareStatement(sql);
            pre.setString(1,id1);
            pre.setString(2,password);
            pre.setString(3,id);
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
        String sql = "select count(*) from hotel";
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
    public String check(String hotelId,String password) {
        conn = JDBCUtils.getConnect();
        String str = null;
        String sql = "select * from hotel";
        if(conn!=null) {
            try {
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sql);
                //pre = conn.prepareStatement(sql);
                //pre.setString(1,adminId);
                //rs = pre.executeQuery();
                while(rs.next()){
                    String hotelId1=rs.getString("hotelId");
                    String password1 = rs.getString("password");
                    if(hotelId.equals(hotelId1)&&password.equals(password1)) {
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
    public String checkHotelId(String hotelId){
        conn = JDBCUtils.getConnect();
        String sql = "select * from hotel where hotelId="+ hotelId ;
        //System.out.println("用户查询时的SQL：" + sql);
        String str = null;
        try {
            pre = conn.prepareStatement(sql);
            if (pre.executeQuery().next() == true) {
                str = "0";
            } else {
                str = "1";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return str;
    }
}
