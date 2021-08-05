package model.service.ipml;

import model.bean.User;
import model.repository.IUserRepository;
import model.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    
    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public User findId(int id) {
        return null;
    }

    @Override
    public boolean deleteUser(int id) {
        return false;
    }

    @Override
    public boolean updateUser(int id) {
        return false;
    }
}
