package main.java;

import main.java.dao.userDao;
import main.java.pojo.User;

public class dbTest {
    public static void main(String[] args) {
        //运行前须添加jdbc包
        //请不要一次运行多条语句

        //添加语句
//        User u = new User("0001", "张三", "12345", "1234567890", "信工", "233@233.com");
//        userDao.insertUser(u);

        //删除语句
        userDao.deleteById("0001");

        //查询语句
        String Id = "0001";
        if(userDao.queryById(Id))
            System.out.println(Id + "已经存在");
        else System.out.println(Id + "不存在");
    }
}
