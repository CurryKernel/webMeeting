package DAO.impl;

import DAO.JDBCUtils;
import DAO.OrganizeRespository;
import VO.User;

import java.sql.*;

public class OrganizeImpl implements OrganizeRespository {
    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    User u = null;

    @Override
    public String insert(String organizeId,String organizeName,String password,String phone,String department,String email) {
        conn = JDBCUtils.getConnect();
        String sql = "insert into user(userId,userName,password,phone,department,email)values(?,?,?,?,?,?)";
        String str = null;
        try {
            pre = conn.prepareStatement(sql);
            //pre = conn.prepareStatement(sql);
            pre.setString(1,organizeId);
            pre.setString(2,organizeName);
            pre.setString(3,password);
            pre.setString(4,phone);
            pre.setString(5,department);
            pre.setString(6,email);
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
    public String checkOrganizeId(String userId) {
        conn = JDBCUtils.getConnect();
        String sql = "select * from user where userId="+ userId ;
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

    @Override
    public String check(String organizeId,String password) {
        conn = JDBCUtils.getConnect();
        String str = null;
        String sql = "select * from user";
        if(conn!=null) {
            try {
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sql);
                //pre = conn.prepareStatement(sql);
                //pre.setString(1,adminId);
                //rs = pre.executeQuery();
                while(rs.next()){
                    String organizeId1=rs.getString("userId");
                    String password1 = rs.getString("password");
                    if(organizeId.equals(organizeId1)&&password.equals(password1)) {
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
}
