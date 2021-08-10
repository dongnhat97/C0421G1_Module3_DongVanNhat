package model.service.ipml;

import model.bean.User;
import model.repository.IUserRepository;
import model.repository.impl.UserRepository;
import model.service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();
    @Override
    public List<User> findAll() {

        return this.iUserRepository.findAll();
    }

    @Override
    public User findId(int id) {
        return this.iUserRepository.findId(id);
    }

    @Override
    public boolean deleteUser(int id) {
        return iUserRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return iUserRepository.updateUser(user);
    }



    @Override
    public String save(User user) {
         return  this.iUserRepository.save(user);
    }

    @Override
    public List<User> findCountry(String country) {
        return iUserRepository.findCountry(country);
    }

    @Override
    public List<User> findOrder() {
        return iUserRepository.findOrder();
    }

    @Override
    public User selectId(int id) {
        return iUserRepository.selectId(id);
    }
}
