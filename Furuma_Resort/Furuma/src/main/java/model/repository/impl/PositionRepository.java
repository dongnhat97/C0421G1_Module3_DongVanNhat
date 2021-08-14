package model.repository.impl;

import model.bean.Position;
import model.repository.IPositionRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Position> showPosition() {
        List<Position> positionList = new ArrayList<>();
        Position position = null;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("select*\n" +
                    "from position");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                position = new Position();
                position.setPositionId(resultSet.getInt("position_id"));
                position.setPositionName(resultSet.getString("position_name"));
                positionList.add(position);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return positionList;
    }
}
