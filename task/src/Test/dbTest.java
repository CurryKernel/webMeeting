package Test;


import DAO.JDBCUtils;

import java.sql.*;

public class dbTest {
    public static void main(String[] args) throws SQLException {
        PreparedStatement pre = null;
        ResultSet rs = null;
        Connection conn = JDBCUtils.getConnect();
        System.out.println(conn);
        String sql="select * from user where userId = 0001";

        pre = conn.prepareStatement(sql);
        rs = pre.executeQuery();
        while (rs.next()) {
            String userId= rs.getString(1);
            System.out.println(userId);
            System.out.println("进来了");
        }
    }
}
