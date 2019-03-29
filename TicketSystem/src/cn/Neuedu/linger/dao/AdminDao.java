package cn.Neuedu.linger.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.Neuedu.linger.domain.Cart;
import cn.Neuedu.linger.domain.User;
import cn.Neuedu.linger.util.C3P0ConnectionFactory;
import cn.Neuedu.linger.util.Page;

import java.util.ArrayList;
import java.util.List;


public class AdminDao {

	public Boolean insert(User user) {
		Connection conn = null;  
        PreparedStatement pst = null;  
        ResultSet rs = null;  
        try {  
            conn =new C3P0ConnectionFactory().getConnection();  
			String sql = "insert into ti_user values(null,?,null,?,?,?,?,?,?,?,?,?)";

			pst = conn.prepareStatement(sql);
			pst.setObject(1, user.getLoginname());
			pst.setObject(2, user.getRealname());
			pst.setObject(3, user.getSex());
			pst.setObject(4, user.getProvice());
			pst.setObject(5, user.getCitty());
			pst.setObject(6, user.getCardtype());
			pst.setObject(7, user.getCardnum());
			pst.setObject(8, user.getBirthday());
			pst.setObject(9, user.getTravellertype());
			pst.setObject(10, user.getInfo());
			
			int rowCount = pst.executeUpdate();
			if (rowCount > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return false;
	}

	public List<User> findAll(Page page) {

		List<User> userList=new ArrayList<User>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_user limit "+page.getStart()+","+page.getSize();
		try {
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				User user=new User();
				user.setUserid(rs.getInt(1));
				user.setLoginname(rs.getString(2));
				user.setRealname(rs.getString(4));
				user.setSex(rs.getInt(5));
				user.setProvice(rs.getString(6));
				user.setCitty(rs.getString(7));
				user.setCardtype(rs.getInt(8));
				user.setCardnum(rs.getString(9));
				user.setBirthday(rs.getString(10));
				user.setTravellertype(rs.getInt(11));
				user.setInfo(rs.getString(12));
				//System.out.println(user.toString());
				userList.add(user);
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
	return userList;
	}
	
	/**
	 * 动态条件查询
	 * @param page 
	 * @return
	 */
	public List<User> findUsersByDynamic (User u, Page page){
		

		List<User> userList=new ArrayList<User>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		  System.out.println(u.toString());
		  String sql="select * from ti_user where";
		  StringBuilder sb=new StringBuilder(sql);
		  if(u.getRealname()!=null&& !"".equals(u.getRealname())){
			 sb.append(" realname like '%"+u.getRealname()+"%' and") ;  
		  }
		  if(u.getSex() == 1 || u.getSex() == 2){
			  sb.append(" sex="+u.getSex()+" and") ;
		  }
		  if(u.getCardtype() ==1 || u.getCardtype() ==2){
			  sb.append(" cardtype="+u.getCardtype()+" and") ;
		  } 
		  if(u.getCardtype() ==3 ||u.getCardtype() ==4){
			  sb.append(" cardtype="+u.getCardtype()+" and") ;
		  } 
		  if(u.getCardnum()!=null && !"".equals(u.getCardnum())){
			  sb.append(" cardnum='"+u.getCardnum()+"' and") ;
		  }
		  
		  if(u.getTravellertype() ==1 ||u.getTravellertype() ==2){
			  sb.append(" travellertype="+u.getTravellertype()+" and") ;
			  
		  }
		  if(u.getTravellertype() ==3 ||u.getTravellertype() ==4 ){
			  sb.append(" travellertype="+u.getTravellertype()+" and") ;
			  
		  }
		  //sql 截取
		  String sb1 = sb.substring(0, sb.length()-3);
		  sb1 = sb1 +" limit "+page.getStart()+","+page.getSize();
		  System.out.println(sb1.toString());
			try {
				PreparedStatement pst=conn.prepareStatement(sb1.toString());
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					User user=new User();
					user.setUserid(rs.getInt(1));
					user.setLoginname(rs.getString(2));
					user.setRealname(rs.getString(4));
					user.setSex(rs.getInt(5));
					user.setProvice(rs.getString(6));
					user.setCitty(rs.getString(7));
					user.setCardtype(rs.getInt(8));
					user.setCardnum(rs.getString(9));
					user.setBirthday(rs.getString(10));
					user.setTravellertype(rs.getInt(11));
					user.setInfo(rs.getString(12));
					//System.out.println(user.toString());
					userList.add(user);
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
		return userList;
	}
	
	
	public Boolean delete(int uid[]) {
        ResultSet rs = null;  
        String sql = "delete from ti_user where userid=?";
        try {  
        	Connection conn =new C3P0ConnectionFactory().getConnection();  

        	conn.setAutoCommit(false);
			PreparedStatement pst = conn.prepareStatement(sql);
			for(int i=0;i<uid.length;i++) {
				pst.setInt(1, uid[i]);
				pst.addBatch();
			}
			
			int rowCount[] = pst.executeBatch();
			conn.commit();
			if (rowCount.length > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return false;
	}

	public int getAmount() {
		Connection conn =new C3P0ConnectionFactory().getConnection();
        String sql = "SELECT COUNT(*) FROM ti_user";
        int count = 0;
        try {
        	PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
                System.out.println(count);
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
        return count;
	}

	public int getAmountUser(User u) {
		Connection conn =new C3P0ConnectionFactory().getConnection();
		  String sql="select COUNT(*) from ti_user where";
		  StringBuilder sb=new StringBuilder(sql);
		  if(u.getRealname()!=null&& !"".equals(u.getRealname())){
			 sb.append(" realname like '%"+u.getRealname()+"%' and") ;  
		  }
		  if(u.getSex() == 1 || u.getSex() == 2){
			  sb.append(" sex="+u.getSex()+" and") ;
		  }
		  if(u.getCardtype() ==1 || u.getCardtype() ==2){
			  sb.append(" cardtype="+u.getCardtype()+" and") ;
		  } 
		  if(u.getCardtype() ==3 ||u.getCardtype() ==4){
			  sb.append(" cardtype="+u.getCardtype()+" and") ;
		  } 
		  if(u.getCardnum()!=null && !"".equals(u.getCardnum())){
			  sb.append(" cardnum='"+u.getCardnum()+"' and") ;
		  }
		  
		  if(u.getTravellertype() ==1 ||u.getTravellertype() ==2){
			  sb.append(" travellertype="+u.getTravellertype()+" and") ;
			  
		  }
		  if(u.getTravellertype() ==3 ||u.getTravellertype() ==4 ){
			  sb.append(" travellertype="+u.getTravellertype()+" and") ;
			  
		  }
		  //sql 截取
		  String sb1 = sb.substring(0, sb.length()-3);
		  System.out.println(sb1.toString());
		  int count = 0;
			try {
				PreparedStatement pst=conn.prepareStatement(sb1.toString());
				ResultSet rs=pst.executeQuery();
				if(rs.next()) {
					count=rs.getInt(1);
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
		return count;
	}

	public List<Cart> adminfindCartAll() {
		List<Cart> cartList=new ArrayList<Cart>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_cartticket";
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

	public Cart cartInfoEdit(String cartid) {
		Cart cart=new Cart();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_cartticket where cartid="+cartid;
		try {
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				
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
	return cart;
	}

	public Boolean deletecart(int[] intTemp) {
		ResultSet rs = null;  
        String sql = "delete from ti_cartticket where cartid=?";
        try {  
        	Connection conn =new C3P0ConnectionFactory().getConnection();  

        	conn.setAutoCommit(false);
			PreparedStatement pst = conn.prepareStatement(sql);
			for(int i=0;i<intTemp.length;i++) {
				pst.setInt(1, intTemp[i]);
				pst.addBatch();
			}
			
			int rowCount[] = pst.executeBatch();
			conn.commit();
			if (rowCount.length > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return false;
	}

	public User userInfoEdit(String userid) {
		User user=new User();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_user where userid="+userid;
		try {
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				user.setUserid(rs.getInt(1));
				user.setLoginname(rs.getString(2));
				user.setRealname(rs.getString(4));
				user.setSex(rs.getInt(5));
				user.setProvice(rs.getString(6));
				user.setCitty(rs.getString(7));
				user.setCardtype(rs.getInt(8));
				user.setCardnum(rs.getString(9));
				user.setBirthday(rs.getString(10));
				user.setTravellertype(rs.getInt(11));
				user.setInfo(rs.getString(12));
				//System.out.println(user.toString());
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
	return user;
	}

	public Boolean userinfoeditadmin(User user) {
		 String sql = "UPDATE ti_user SET loginname='"+user.getLoginname()
		                               +"' , realname='"+user.getRealname()
		                               +"' , sex="+user.getSex()
	        		                   +" , provice='"+user.getProvice()
	        		                   +"' , citty='"+user.getCitty()
	        		                   +"' , cardtype="+user.getCardtype()
	        		                   +" , cardnum='"+user.getCardnum()
	        		                   +"' , birthday='"+user.getBirthday()
	        		                   +"' , travellertype="+user.getTravellertype()
	        		                   +" , info='"+user.getInfo()
	        		                   +"' WHERE userid ="+user.getUserid();
	        //System.out.println(sql);
	        try {  
	        	Connection conn =new C3P0ConnectionFactory().getConnection();  
	        	PreparedStatement ps = conn.prepareStatement(sql);  
	        	int rs = ps.executeUpdate();
	        	if(rs==1) {
	        		return true;
	        	}
			} catch (Exception e) {
				e.printStackTrace();
			}
	        return false;
	}
	
}
