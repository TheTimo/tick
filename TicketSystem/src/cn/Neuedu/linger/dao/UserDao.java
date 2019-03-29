package cn.Neuedu.linger.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;

import com.sun.org.apache.regexp.internal.recompile;
import com.sun.swing.internal.plaf.basic.resources.basic;

import cn.Neuedu.linger.domain.Manager;
import cn.Neuedu.linger.domain.User;
import cn.Neuedu.linger.util.C3P0ConnectionFactory;
import cn.Neuedu.linger.util.DateUtils;


public class UserDao {

	public String Login(Manager manager,HttpServletRequest request) {
		Connection conn = null;  
        PreparedStatement ps = null;  
        ResultSet rs = null;  
        try {  
            conn =new C3P0ConnectionFactory().getConnection();  
            String sql = "SELECT * FROM ti_manager WHERE username='"+manager.getUsername()+"' AND password='"+manager.getPassword()+"'";  
            //System.out.println(sql);
            ps = conn.prepareStatement(sql);  
            rs = ps.executeQuery();  
            if(rs.next()){  
            	return "1";
            }else {
            	String sql1 ="SELECT * FROM ti_user WHERE loginname='"+manager.getUsername()+"' AND password='"+manager.getPassword()+"'";
            
            	PreparedStatement ps1 = conn.prepareStatement(sql1);  
            	ResultSet rs1 = ps1.executeQuery(); 
            	if(rs1.next()) {
            		//将查询信息加入session
            		//request.getSession().setAttribute("username", username);
            		request.getSession().setAttribute("userid", rs1.getInt(1));
            		request.getSession().setAttribute("loginname", rs1.getString(2));
            		request.getSession().setAttribute("password", rs1.getString(3));
            		request.getSession().setAttribute("realname", rs1.getString(4));
            		request.getSession().setAttribute("sex", rs1.getInt(5));
            		request.getSession().setAttribute("provice", rs1.getString(6));
            		request.getSession().setAttribute("citty", rs1.getString(7));
            		request.getSession().setAttribute("cardtype", rs1.getInt(8));
            		request.getSession().setAttribute("cardnum", rs1.getString(9));
            		request.getSession().setAttribute("birthday", rs1.getString(10));
            		request.getSession().setAttribute("travellertype", rs1.getInt(11));
            		request.getSession().setAttribute("info", rs1.getString(12));
            		return "2";
            	}else {
            		return "0";
            	}
            }
        } catch (Exception e) {  
            e.printStackTrace();  
        }
        return "0";
	}
	@Test
	public Boolean Register(User user) { 
		Connection conn = null;  
        PreparedStatement ps = null;  
        int rs;  
        try {  
            conn =new C3P0ConnectionFactory().getConnection();  
            
            String sql = "INSERT INTO ti_user (loginname,password,realname,sex,provice,"
            		+ "citty,cardtype,cardnum,birthday,travellertype,info) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			/*String sql= "INSERT INTO ti_user (loginname,password,realname,sex,provice,"
            		+ "citty,cardtype,cardnum,birthday,travellertype,info) VALUES ('林庚','123','林耿瑞','1','广东省','汕头市','2','123456789','1995-10-1','5','航班飞抵阿哥v你')";*/
			System.out.println(user.toString());
            ps = conn.prepareStatement(sql);  
			ps.setString(1, user.getLoginname()); 
			ps.setString(2, user.getPassword()); 
			ps.setString(3, user.getRealname()); 
		    ps.setInt(4, user.getSex()); 
		    ps.setString(5, user.getProvice()); 
		    ps.setString(6, user.getCitty()); 
		    ps.setInt(7, user.getCardtype()); 
		    ps.setString(8, user.getCardnum()); 
		    ps.setObject(9, new DateUtils().stringConvertToDate(user.getBirthday())); 
		    ps.setInt(10, user.getTravellertype()); 
		    ps.setString(11, user.getInfo()); 
		    
			rs = ps.executeUpdate();
			if(rs==1) {
				return true;
			}
        } catch (Exception e) {  
            e.printStackTrace();  
        }
        return false;
	}
	
	public Boolean Changepassword(String password, String newpassword ,int userid) {

		Connection conn = null;  
        PreparedStatement ps = null;  
        ResultSet rs;  
        try {  
            conn =new C3P0ConnectionFactory().getConnection();  
            
            String sql = "SELECT * FROM ti_user WHERE password = '"+password+"' AND userid ="+userid;
            ps = conn.prepareStatement(sql);  
			rs = ps.executeQuery();
			if(rs.next()) {
				String sql2 = "UPDATE ti_user SET password = '"+newpassword+"' WHERE userid ="+userid;
				PreparedStatement ps2 = conn.prepareStatement(sql2);  
				int rs2 = ps2.executeUpdate();
				if(rs2==1) {
					return true;
				}
			}else {
				return false;
			}
        } catch (Exception e) {  
            e.printStackTrace();  
        }
		return false;
	}
	
	public boolean findloginname(String loginname) {
		Connection conn = null;  
        PreparedStatement ps = null;  
        ResultSet rs;  
        try {  
            conn =new C3P0ConnectionFactory().getConnection();  
            
            String sql = "SELECT * FROM ti_user WHERE loginname = '"+loginname+"'";
            ps = conn.prepareStatement(sql);  
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
        } catch (Exception e) {  
            e.printStackTrace();  
        }
		return false;
	}
	
	public Boolean userinfoedit(User user) {

		Connection conn = null;  
        PreparedStatement ps = null;  
        int rs;  
        try {  
            conn =new C3P0ConnectionFactory().getConnection();  
            
            /*String loginname = request.getParameter("loginname");
    		String userid = request.getParameter("userid");
    		String realname = request.getParameter("realname");
    		String sex= request.getParameter("sex");
    		String provice= request.getParameter("provice");
    		String citty= request.getParameter("citty");
    		String cardtype= request.getParameter("cardtype");
    		String cardnum= request.getParameter("cardnum");
    		String birthday= request.getParameter("birthday");
    		int travellertype= Integer.parseInt(request.getParameter("travellertype"));
    		String info= request.getParameter("info");*/
            String sql = "UPDATE ti_user SET loginname='"+user.getLoginname()
            +"' , realname='"+user.getRealname()
            +"' , sex="+user.getSex()
            +" , provice='"+user.getProvice()
            +"' , citty='"+user.getCitty()
            +"' , cardtype="+user.getCardtype()
            +" , cardnum='"+user.getCardnum()
            +"' , birthday='"+user.getBirthday()
            +"' , travellertype="+user.getTravellertype()
            +" WHERE userid ="+user.getUserid();
            ps = conn.prepareStatement(sql);  
			rs = ps.executeUpdate();
			if(rs==1) {
				if( user.getInfo() != "") {
					 String sql2 = "UPDATE ti_user SET info='"+user.getInfo()+"' WHERE userid ="+user.getUserid();
					 PreparedStatement ps1 = conn.prepareStatement(sql2);  
					 int rs1 = ps.executeUpdate();
					 if(rs1==1) {
						 return true;
					 }
				}
				return true;
			}else {
				return false;
			}
        } catch (Exception e) {  
            e.printStackTrace();  
        }
		return false;
	}
	
}
