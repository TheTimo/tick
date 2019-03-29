package cn.Neuedu.linger.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.Neuedu.linger.domain.Cart;
import cn.Neuedu.linger.domain.Train;
import cn.Neuedu.linger.util.C3P0ConnectionFactory;

public class BuyTicketDao {

	public List<Train> findAll() {
		List<Train> trainList=new ArrayList<Train>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_train";
		try {
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				Train tra=new Train();
				tra.setTrainid(rs.getInt(1));
				tra.setStartStation(rs.getString(2));
				tra.setEndStation(rs.getString(3));
				tra.setStartTime(rs.getString(4));
				tra.setEndTime(rs.getString(5));
				tra.setTime(rs.getString(6));
				tra.setDistance(rs.getString(7));
				tra.setNoTicket(rs.getString(8));
				tra.setType(rs.getString(9));
				tra.setClassification(rs.getString(10));
				trainList.add(tra);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	return trainList;
	}

	public List<Train> findBuyTicketByDynamic(String startStation, String endStation) {
		List<Train> trainList=new ArrayList<Train>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_train where";
		  StringBuilder sb=new StringBuilder(sql);
		  if(startStation !=null&& !"".equals(startStation)){
			 sb.append(" startStation like '%"+startStation+"%' and") ;  
		  } 
		  if(endStation !=null&& !"".equals(endStation)){
				 sb.append(" endStation like '%"+endStation+"%' and") ;  
			  } 
		  
		  //sql ½ØÈ¡
		  String sb1 = sb.substring(0, sb.length()-3);
		  System.out.println(sb1.toString());
			try {
				PreparedStatement pst=conn.prepareStatement(sb1.toString());
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					Train tra = new Train();
					tra.setTrainid(rs.getInt(1));
					tra.setStartStation(rs.getString(2));
					tra.setEndStation(rs.getString(3));
					tra.setStartTime(rs.getString(4));
					tra.setEndTime(rs.getString(5));
					tra.setTime(rs.getString(6));
					tra.setDistance(rs.getString(7));
					tra.setNoTicket(rs.getString(8));
					tra.setType(rs.getString(9));
					tra.setClassification(rs.getString(10));
					trainList.add(tra);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		return trainList;
	}

	
	public Boolean buyticket(int length, String realname, String param, String userid, Train train) {
		try {  
        	Connection conn =new C3P0ConnectionFactory().getConnection();  
        	String sql = "insert into ti_cartticket values(null,?,?,?,?,?,?,?,?,?)";
        	PreparedStatement pst = conn.prepareStatement(sql);
			pst.setObject(1, userid);
			pst.setObject(2, realname);
			pst.setObject(3, train.getStartStation());
			pst.setObject(4, train.getStartTime());
			pst.setObject(5, train.getEndStation());
			pst.setObject(6, train.getEndTime());
			pst.setObject(7, param);
			pst.setObject(8, length);
			pst.setObject(9, length*120);
			
			int rowCount = pst.executeUpdate();
			if (rowCount > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        return false;
	}

	public List<Cart> findCartAll(String userid) {
		List<Cart> cartList=new ArrayList<Cart>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_cartticket where userid='"+userid+"'";
		try {
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				Cart cart=new Cart();
				cart.setCartid(rs.getInt(1));
				cart.setUserid(rs.getString(2));
				cart.setRealname(rs.getString(3));
				cart.setStartStation(rs.getString(4));
				cart.setStartTime(rs.getString(5));
				cart.setEndStation(rs.getString(6));
				cart.setEndTime(rs.getString(7));
				cart.setTrainidparam(rs.getString(8));
				cart.setTicketnum(rs.getString(9));
				cart.setPrice(rs.getString(10));
				cartList.add(cart);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	return cartList;
	}

	public Train findtrain(int i) {
		Connection conn =new C3P0ConnectionFactory().getConnection();
		Train tra = new Train();
		  String sql="select * from ti_train where trainid="+i;
		  //System.out.println(sql);
			try {
				PreparedStatement pst=conn.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					
					tra.setTrainid(rs.getInt(1));
					tra.setStartStation(rs.getString(2));
					tra.setEndStation(rs.getString(3));
					tra.setStartTime(rs.getString(4));
					tra.setEndTime(rs.getString(5));
					tra.setTime(rs.getString(6));
					tra.setDistance(rs.getString(7));
					tra.setNoTicket(rs.getString(8));
					tra.setType(rs.getString(9));
					tra.setClassification(rs.getString(10));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		return tra;
	}

}
