package cn.Neuedu.linger.domain;

public class User {

	private int userid;
	private String loginname;
	private String password;
	private String realname;
	private int sex;
	private String provice;
	private String citty;
	private int cardtype;
	private String cardnum;
	private String birthday;
	private int travellertype;
	private String info;
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getProvice() {
		return provice;
	}
	public void setProvice(String provice) {
		this.provice = provice;
	}
	public String getCitty() {
		return citty;
	}
	public void setCitty(String citty) {
		this.citty = citty;
	}
	public int getCardtype() {
		return cardtype;
	}
	public void setCardtype(int cardtype) {
		this.cardtype = cardtype;
	}
	public String getCardnum() {
		return cardnum;
	}
	public void setCardnum(String cardnum) {
		this.cardnum = cardnum;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getTravellertype() {
		return travellertype;
	}
	public void setTravellertype(int travellertype) {
		this.travellertype = travellertype;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}


	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public User(int userid, String loginname, String password, String realname, int sex, String provice,
			String citty, int cardtype, String cardnum, String birthday, int travellertype, String info) {
		super();
		this.userid = userid;
		this.loginname = loginname;
		this.password = password;
		this.realname = realname;
		this.sex = sex;
		this.provice = provice;
		this.citty = citty;
		this.cardtype = cardtype;
		this.cardnum = cardnum;
		this.birthday = birthday;
		this.travellertype = travellertype;
		this.info = info;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", loginname=" + loginname + ", password=" + password + ", realname="
				+ realname + ", sex=" + sex + ", provice=" + provice + ", citty=" + citty + ", cardtype=" + cardtype
				+ ", cardnum=" + cardnum + ", birthday=" + birthday + ", travellertype=" + travellertype + ", info="
				+ info + "]";
	}
	
}
