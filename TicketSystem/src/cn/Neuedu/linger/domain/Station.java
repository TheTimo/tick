package cn.Neuedu.linger.domain;

public class Station {

	private int sid;
	private String stationName;
	private String stationEnglish;
	private String belongTo;
	private String stationRank;
	private String administrativeArea;
	private String address;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getStationName() {
		return stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	public String getStationEnglish() {
		return stationEnglish;
	}
	public void setStationEnglish(String stationEnglish) {
		this.stationEnglish = stationEnglish;
	}
	public String getBelongTo() {
		return belongTo;
	}
	public void setBelongTo(String belongTo) {
		this.belongTo = belongTo;
	}
	public String getStationRank() {
		return stationRank;
	}
	public void setStationRank(String stationRank) {
		this.stationRank = stationRank;
	}
	public String getAdministrativeArea() {
		return administrativeArea;
	}
	public void setAdministrativeArea(String administrativeArea) {
		this.administrativeArea = administrativeArea;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Station [sid=" + sid + ", stationName=" + stationName + ", stationEnglish=" + stationEnglish
				+ ", belongTo=" + belongTo + ", stationRank=" + stationRank + ", administrativeArea="
				+ administrativeArea + ", address=" + address + "]";
	}
	public Station(int sid, String stationName, String stationEnglish, String belongTo, String stationRank,
			String administrativeArea, String address) {
		super();
		this.sid = sid;
		this.stationName = stationName;
		this.stationEnglish = stationEnglish;
		this.belongTo = belongTo;
		this.stationRank = stationRank;
		this.administrativeArea = administrativeArea;
		this.address = address;
	}
	public Station() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
