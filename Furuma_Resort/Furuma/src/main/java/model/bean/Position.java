package model.bean;

public class Position {
    private int positionId;
    private String positionName;

    public Position() {
    }

    public Position(int id, String positionName) {
        this.positionId = id;
        this.positionName = positionName;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }
}
