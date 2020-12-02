package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


//创建连接对象
public class JDBCUtils {

    private static String url;
    private static String driver;
    private static String username;
    private static String password;

    static{
        Connection conn;
        //数据库四大属性
        driver="com.mysql.cj.jdbc.Driver";
        //这里我的数据库是cxxt
        url="jdbc:mysql://8.129.122.81:3306/web?&useSSL=false&serverTimezone=UTC";
        username="root";
        password="101501";

        try{
            //注册JDBC驱动程序
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }


    //获取连接对象
    public static Connection getConnect(){
            Connection conn;
            //数据库四大属性
            driver="com.mysql.cj.jdbc.Driver";
            //这里我的数据库是cxxt
            url="jdbc:mysql://8.129.122.81:3306/web?&useSSL=false&serverTimezone=UTC";
            username="root";
            password="101501";


        try{
            return DriverManager.getConnection(url,username,password);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }


    //关闭连接对象
    public static void closeConnect(AutoCloseable...cs){
        for (AutoCloseable c : cs) {
            if(c != null){
                try {
                    c.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

}