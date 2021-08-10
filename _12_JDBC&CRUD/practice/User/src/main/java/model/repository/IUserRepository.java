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
 User selectId(int id); // Dùng hàm procedure
 void addUserTransaction(User user, int[] permisions) throws SQLException;
 List<User> spFindAll(); // Dùng hàm procedure
 String spCreate(User user) throws SQLException; //  Dùng hàm procedure
 boolean spUpdate(User user) throws SQLException; // Dùng hàm procedure
 boolean spDelete(int id);

}
