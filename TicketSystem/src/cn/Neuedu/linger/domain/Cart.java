package cn.Neuedu.linger.domain;

public class Cart {

	private int cartid;
	private String userid;
	private String realname;
	private String trainidparam;
	private String ticketnum;
	private String price;
	private String startStation;
	private String endStation;
	private String startTime;
	private String endTime;
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getTrainidparam() {
		return trainidparam;
	}
	public void setTrainidparam(String trainidparam) {
		this.trainidparam = trainidparam;
	}
	public String getTicketnum() {
		return ticketnum;
	}
	public void setTicketnum(String ticketnum) {
		this.ticketnum = ticketnum;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
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
	@Override
	public String toString() {
		return "Cart [cartid=" + cartid + ", userid=" + userid + ", realname=" + realname + ", trainidparam="
				+ trainidparam + ", ticketnum=" + ticketnum + ", price=" + price + ", startStation=" + startStation
				+ ", endStation=" + endStation + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
	public Cart(int cartid, String userid, String realname, String trainidparam, String ticketnum, String price,
			String startStation, String endStation, String startTime, String endTime) {
		super();
		this.cartid = cartid;
		this.userid = userid;
		this.realname = realname;
		this.trainidparam = trainidparam;
		this.ticketnum = ticketnum;
		this.price = price;
		this.startStation = startStation;
		this.endStation = endStation;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
