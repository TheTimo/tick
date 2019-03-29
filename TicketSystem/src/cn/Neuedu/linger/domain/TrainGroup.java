package cn.Neuedu.linger.domain;

public class TrainGroup {

	private int gid;
	private String gCode;
	private String gBox;
	private String gboxType;
	private String gchairNum;
	private String gchairType;
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getgCode() {
		return gCode;
	}
	public void setgCode(String gCode) {
		this.gCode = gCode;
	}
	public String getgBox() {
		return gBox;
	}
	public void setgBox(String gBox) {
		this.gBox = gBox;
	}
	public String getGboxType() {
		return gboxType;
	}
	public void setGboxType(String gboxType) {
		this.gboxType = gboxType;
	}
	public String getGchairNum() {
		return gchairNum;
	}
	public void setGchairNum(String gchairNum) {
		this.gchairNum = gchairNum;
	}
	public String getGchairType() {
		return gchairType;
	}
	public void setGchairType(String gchairType) {
		this.gchairType = gchairType;
	}
	@Override
	public String toString() {
		return "TrainGroup [gid=" + gid + ", gCode=" + gCode + ", gBox=" + gBox + ", gboxType=" + gboxType
				+ ", gchairNum=" + gchairNum + ", gchairType=" + gchairType + "]";
	}
	public TrainGroup(int gid, String gCode, String gBox, String gboxType, String gchairNum, String gchairType) {
		super();
		this.gid = gid;
		this.gCode = gCode;
		this.gBox = gBox;
		this.gboxType = gboxType;
		this.gchairNum = gchairNum;
		this.gchairType = gchairType;
	}
	public TrainGroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
