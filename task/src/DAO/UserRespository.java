package DAO;

import VO.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


public interface UserRespository {

    public void insertUser(User u);

    public void deleteById(String userId);
    public boolean queryById(String userId);
}
