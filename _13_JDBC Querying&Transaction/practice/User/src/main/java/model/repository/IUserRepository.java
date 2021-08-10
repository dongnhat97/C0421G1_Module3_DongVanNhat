package model.repository;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
 List<User> findAll();
 User findId(int id);
 boolean deleteUser(int id);
 boolean updateUser(User user) throws SQLException;
 String save (User user);
 List<User> findCountry(String country);
 List<User> findOrder();
 User selectId(int id);
 void addUserTransaction(User user, int[] permisions) throws SQLException;
 public void insertUpdateUseTransaction();
}
