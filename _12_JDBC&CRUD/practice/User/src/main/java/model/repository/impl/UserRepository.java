package model.repository.impl;

import model.bean.User;
import model.repository.IUserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
   BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement= this.baseRepository.getConnection().prepareStatement(
                    "select id,`name`,email,coutry\n" +
                            "from demo");
            ResultSet resultSet = preparedStatement.executeQuery();

            User user = null;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public User findId(int id) {
        User user = null;
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "select id,`name`,email,coutry\n" +
                            "from demo\n" +
                            "where id = ?");
            preparedStatement.setString(1,id+"");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                user = new User();
                user.setId(id);
                user.setName(resultSet.getString("`name`"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("coutry"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return user;
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
