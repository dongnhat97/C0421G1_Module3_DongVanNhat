package model.service;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<User> findAll();
    User findId(int id);
    boolean deleteUser(int id);
    boolean updateUser(User user) throws SQLException;
    String save (User user);
    List<User> findCountry(String country);
    List<User> findOrder();
    User selectId(int id);
}
