package Test;


import DAO.JDBCUtils;

import java.sql.*;

public class dbTest {
    public static void main(String[] args) throws SQLException {
        PreparedStatement pre = null;
        ResultSet rs = null;
        Connection conn = JDBCUtils.getConnect();
        System.out.println(conn);
        String sql="select userName, phone,place,deadline,people from orderCar inner join user on orderCar.userId = user.userId  where orderCar.driverId=1 and orderCar.state =1 ";

        pre = conn.prepareStatement(sql);
        rs = pre.executeQuery();
        while (rs.next()) {
            String userName= rs.getString(1);
            System.out.println(userName);
            System.out.println("进来了");
        }

    }
}
