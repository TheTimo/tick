package cn.Neuedu.linger.domain;

public class LineManage {

	private int lid;
	private String trainCode;
	private String stationName;
	private String startTime;
	private String endTime;
	private String distance;
	private String stayTime;
	private String totalTime;
	private String stationOrder;
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getTrainCode() {
		return trainCode;
	}
	public void setTrainCode(String trainCode) {
		this.trainCode = trainCode;
	}
	public String getStationName() {
		return stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
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
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getStayTime() {
		return stayTime;
	}
	public void setStayTime(String stayTime) {
		this.stayTime = stayTime;
	}
	public String getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}
	public String getStationOrder() {
		return stationOrder;
	}
	public void setStationOrder(String stationOrder) {
		this.stationOrder = stationOrder;
	}
	@Override
	public String toString() {
		return "LineManage [lid=" + lid + ", trainCode=" + trainCode + ", stationName=" + stationName + ", startTime="
				+ startTime + ", endTime=" + endTime + ", distance=" + distance + ", stayTime=" + stayTime
				+ ", totalTime=" + totalTime + ", stationOrder=" + stationOrder + "]";
	}
	public LineManage(int lid, String trainCode, String stationName, String startTime, String endTime, String distance,
			String stayTime, String totalTime, String stationOrder) {
		super();
		this.lid = lid;
		this.trainCode = trainCode;
		this.stationName = stationName;
		this.startTime = startTime;
		this.endTime = endTime;
		this.distance = distance;
		this.stayTime = stayTime;
		this.totalTime = totalTime;
		this.stationOrder = stationOrder;
	}
	public LineManage() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
