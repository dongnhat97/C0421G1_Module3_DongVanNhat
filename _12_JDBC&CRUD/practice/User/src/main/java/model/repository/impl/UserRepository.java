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
                    "select id,`name`,email,country \n" +
                            "from users");
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
                    "select id,`name`,email,country \n" +
                            "from users \n" +
                            "where id = ?");
            preparedStatement.setString(1,id+""); //truyền giá trị cho id , chạy câu lệnh truy vấn
            ResultSet resultSet = preparedStatement.executeQuery(); // hứng kết quả
            if (resultSet.next()){
                user = new User(); // chuyển kêt quả sang java từ đây
                user.setId(id);
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return user;
    }

    @Override
    public boolean deleteUser(int id) {
        int row = 0;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(
                    "delete \n" +
                            "from users \n" +
                            "where id = ?"
            );
            preparedStatement.setString(1,id+"");
            row= preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return row>0;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        int row = 0;
        PreparedStatement preparedStatement= this.baseRepository.getConnection().prepareStatement(
                "update users \n" +
                        "set `name` = ?,email=?,country= ?\n" +
                        "where id = ?");

       preparedStatement.setString(1,user.getName());
       preparedStatement.setString(2,user.getEmail());
       preparedStatement.setString(3,user.getCountry());
       preparedStatement.setInt(4,user.getId());
       row = preparedStatement.executeUpdate();

        return row>0;
    }


    @Override
    public String save (User user) {
        int row = 0;
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                  "insert into users (`name`,email,country) \n" +
                          "value (?,?,?)");


            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            row = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return row>0?"Thêm thành công":"Thêm không thành công";
    }

    @Override
    public List<User> findCountry(String country) {
        List<User> userList = new ArrayList<>();
        User user = null;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("select id, `name`, email, country\n" +
                    "from users \n" +
                    "where country =?");
            preparedStatement.setString(1,country +"");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setCountry(country);
                user.setName(resultSet.getString("name"));
                user.setName(resultSet.getString("email"));
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public List<User> findOrder() {
        List<User> orderList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement= this.baseRepository.getConnection().prepareStatement
                    ("select id, `name`, email, country\n" +
                    "from users \n" +
                    "order by `name`");
            ResultSet resultSet = preparedStatement.executeQuery();

            User user = null;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                orderList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return orderList;
    }

}
