package model.service;

import model.bean.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();
    User findId(int id);
    boolean deleteUser(int id);
    boolean updateUser(int id);
}
