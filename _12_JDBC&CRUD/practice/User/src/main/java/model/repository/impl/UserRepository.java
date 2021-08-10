package model.repository.impl;

import model.bean.User;
import model.repository.IUserRepository;

import java.sql.*;
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
// Hàm tìm kiếm bằng id dùng procedure
    @Override
    public User selectId(int id) {
        User user = null;
        try {
            CallableStatement callableStatement = this.baseRepository.getConnection().prepareCall("call sp_id (?)");
            callableStatement.setString(1,id+""); //truyền giá trị cho id , chạy câu lệnh truy vấn
            ResultSet resultSet = callableStatement.executeQuery(); // hứng kết quả
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
    public void addUserTransaction(User user, int[] permisions) {
        final String INSERT_USERS_SQL = "INSERT INTO users" + "  (`name`, email, country) VALUES " +
                " (?, ?, ?);";
        Connection conn = null;

        // for insert a new user

        PreparedStatement pstmt = null;

        // for assign permision to user

        PreparedStatement pstmtAssignment = null;

        // for getting user id

        ResultSet rs = null;

        try {

            conn = this.baseRepository.getConnection();

            // set auto commit to false

            conn.setAutoCommit(false);


            pstmt = conn.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, user.getName());

            pstmt.setString(2, user.getEmail());

            pstmt.setString(3, user.getCountry());

            int rowAffected = pstmt.executeUpdate();

            // get user id

            rs = pstmt.getGeneratedKeys();

            int userId = 0;

            if (rs.next())

                userId = rs.getInt(1);


            if (rowAffected == 1) {

                // assign permision to user

                String sqlPivot = "INSERT INTO user_permision(id,permision_id) "

                        + "VALUES(?,?)";

                pstmtAssignment = conn.prepareStatement(sqlPivot);

                for (int permisionId : permisions) {

                    pstmtAssignment.setInt(1, userId);

                    pstmtAssignment.setInt(2, permisionId);

                    pstmtAssignment.executeUpdate();

                }

                conn.commit();

            } else {

                conn.rollback();

            }

        } catch (SQLException ex) {


            try {

                if (conn != null)

                    conn.rollback();

            } catch (SQLException e) {

                System.out.println(e.getMessage());

            }

            System.out.println(ex.getMessage());

        } finally {

            try {

                if (rs != null) rs.close();

                if (pstmt != null) pstmt.close();

                if (pstmtAssignment != null) pstmtAssignment.close();

                if (conn != null) conn.close();

            } catch (SQLException e) {

                System.out.println(e.getMessage());

            }

        }

    }

    @Override
    public List<User> spFindAll() {
        List<User> userList = new ArrayList<>();
        try {
            CallableStatement callableStatement = baseRepository.getConnection().prepareCall("{call sp_selectAll()}");
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                User user = new User();
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
    public String spCreate(User user) throws SQLException {
        int row = 0;
        CallableStatement callableStatement = baseRepository.getConnection().prepareCall("call sp_create (?,?,?)");
        callableStatement.setString(1,user.getName());
        callableStatement.setString(2,user.getEmail());
        callableStatement.setString(3,user.getCountry());
        row= callableStatement.executeUpdate();
        return row>0?"Thêm mới thành công":"fasle";
    }

    @Override
    public boolean spUpdate(User user) throws SQLException {
        int row =0;
        CallableStatement callableStatement = baseRepository.getConnection().prepareCall("call sp_update(?,?,?,?)");
        callableStatement.setInt(1,user.getId());
        callableStatement.setString(2,user.getName());
        callableStatement.setString(3,user.getEmail());
        callableStatement.setString(4,user.getCountry());

        row = callableStatement.executeUpdate();
        return row>0;
    }

    @Override
    public boolean spDelete(int id) {
        int row = 0;
        try {
            CallableStatement callableStatement = baseRepository.getConnection().prepareCall("call sp_delete(?)");
            callableStatement.setInt(1,id);
            row = callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return row>0;
    }


}
