package cn.Neuedu.linger.domain;

public class Train {

	private int trainid;
	private String startStation;
	private String endStation;
	private String startTime;
	private String endTime;
	private String time;
	private String distance;
	private String noTicket;
	private String type;
	private String classification;
	public int getTrainid() {
		return trainid;
	}
	public void setTrainid(int trainid) {
		this.trainid = trainid;
	}
	public String getStartStation() {
		return startStation;
	}
	public void setStartStation(String startStation) {
		this.startStation = startStation;
	}
	public String getEndStation() {
		return endStation;
	}
	public void setEndStation(String endStation) {
		this.endStation = endStation;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getNoTicket() {
		return noTicket;
	}
	public void setNoTicket(String noTicket) {
		this.noTicket = noTicket;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	@Override
	public String toString() {
		return "Train [trainid=" + trainid + ", startStation=" + startStation + ", endStation=" + endStation
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", time=" + time + ", distance=" + distance
				+ ", noTicket=" + noTicket + ", type=" + type + ", classification=" + classification + "]";
	}
	public Train(int trainid, String startStation, String endStation, String startTime, String endTime, String time,
			String distance, String noTicket, String type, String classification) {
		super();
		this.trainid = trainid;
		this.startStation = startStation;
		this.endStation = endStation;
		this.startTime = startTime;
		this.endTime = endTime;
		this.time = time;
		this.distance = distance;
		this.noTicket = noTicket;
		this.type = type;
		this.classification = classification;
	}
	public Train() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
