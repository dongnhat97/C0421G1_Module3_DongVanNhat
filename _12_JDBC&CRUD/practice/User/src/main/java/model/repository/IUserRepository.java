package model.repository;

import model.bean.User;

import java.util.List;

public interface IUserRepository {
 List<User> findAll();
 User findId(int id);
 boolean deleteUser(int id);
 boolean updateUser(int id);
}
