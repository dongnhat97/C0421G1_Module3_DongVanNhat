package model.service.impl;

import model.bean.Position;
import model.repository.IPositionRepository;
import model.repository.impl.PositionRepository;
import model.service.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    IPositionRepository iPositionRepository= new PositionRepository();
    @Override
    public List<Position> showPosition() {
        return iPositionRepository.showPosition();
    }
}
