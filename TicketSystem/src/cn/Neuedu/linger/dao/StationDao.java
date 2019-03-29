package cn.Neuedu.linger.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.Neuedu.linger.domain.Station;
import cn.Neuedu.linger.domain.User;
import cn.Neuedu.linger.util.C3P0ConnectionFactory;
import cn.Neuedu.linger.util.Page;

public class StationDao {

	/*public List<Station> findAll() {

		List<Station> userList=new ArrayList<Station>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_station";
		try {
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				Station sta=new Station();
				sta.setSid(rs.getInt(1));
				sta.setStationName(rs.getString(2));
				sta.setStationEnglish(rs.getString(3));
				sta.setBelongTo(rs.getString(4));
				sta.setStationRank(rs.getString(5));
				sta.setAdministrativeArea(rs.getString(6));
				sta.setAddress(rs.getString(7));
				
				userList.add(sta);
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
	}*/

	public List<Station> findStationByDynamic(Station station, Page page) {
		List<Station> stationList=new ArrayList<Station>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		 
		  String sql="select * from ti_station where";
		  StringBuilder sb=new StringBuilder(sql);
		  if(station.getStationName() !=null&& !"".equals(station.getStationName())){
			 sb.append(" stationName like '%"+station.getStationName()+"%' and") ;  
		  }
		  if(station.getStationEnglish() != null && !"".equals(station.getStationEnglish())){
			  sb.append(" stationEnglish='"+station.getStationEnglish()+"' and") ;
		  }
		  if(station.getBelongTo() !=null && !"".equals(station.getBelongTo())){
			  sb.append(" belongTo='"+station.getBelongTo()+"' and") ;
		  } 
		  
		  //sql 截取
		  String sb1 = sb.substring(0, sb.length()-3);
		  
		  sb1 = sb1 +"limit "+page.getStart()+","+page.getSize();
		  System.out.println(sb1.toString());
			try {
				PreparedStatement pst=conn.prepareStatement(sb1.toString());
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					Station station2 = new Station();
					station2.setSid(rs.getInt(1));
					station2.setStationName(rs.getString(2));
					station2.setStationEnglish(rs.getString(3));
					station2.setBelongTo(rs.getString(4));
					station2.setStationRank(rs.getString(5));
					station2.setAdministrativeArea(rs.getString(6));
					station2.setAddress(rs.getString(7));
					stationList.add(station2);
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
		return stationList;
	}

	public Boolean delete(int[] intTemp) {
		ResultSet rs = null;  
        String sql = "delete from ti_station where sid=?";
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
	
	public Station findStationByInfo(String sid) {
		Station station2 = new Station();
		//List<Station> stationList1=new ArrayList<Station>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		 
		  String sql="select * from ti_station where sid="+sid;
		  try {
				PreparedStatement pst=conn.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					
					station2.setSid(rs.getInt(1));
					station2.setStationName(rs.getString(2));
					station2.setStationEnglish(rs.getString(3));
					station2.setBelongTo(rs.getString(4));
					station2.setStationRank(rs.getString(5));
					station2.setAdministrativeArea(rs.getString(6));
					station2.setAddress(rs.getString(7));
					//stationList1.add(station2);
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
		
		return station2;
	}
	
	
	public Boolean changeStationInfo(Station station) {
        String sql = "UPDATE ti_station SET stationName='"+station.getStationName()+"' , stationEnglish='"+station.getStationEnglish()+"' , belongTo='"+station.getBelongTo()+"' "
        		+ ", stationRank='"+station.getStationRank()+"' , administrativeArea='"+station.getAdministrativeArea()+"' , address='"+station.getAddress()+"' WHERE sid ="+station.getSid();
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

	public Boolean addStationInfo(Station station) {
		try {  
        	Connection conn =new C3P0ConnectionFactory().getConnection();  
        	String sql = "insert into ti_station values(null,?,?,?,?,?,?)";
        	PreparedStatement pst = conn.prepareStatement(sql);
			pst.setObject(1, station.getStationName());
			pst.setObject(2, station.getStationEnglish());
			pst.setObject(3, station.getBelongTo());
			pst.setObject(4, station.getStationRank());
			pst.setObject(5, station.getAdministrativeArea());
			pst.setObject(6, station.getAddress());
			
			int rowCount = pst.executeUpdate();
			if (rowCount > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        return false;
	}

	/*
	 * 
	 * 获取当前表格中所有的数据数量
	 */
	public int getAmount() {
		Connection conn =new C3P0ConnectionFactory().getConnection();
        String sql = "SELECT COUNT(*) FROM ti_station";
        int count = 0;
        try {
        	PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
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

	public List<Station> findAll(Page page) {
		List<Station> userList=new ArrayList<Station>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_station limit "+page.getStart()+","+page.getSize();
		try {
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				Station sta=new Station();
				sta.setSid(rs.getInt(1));
				sta.setStationName(rs.getString(2));
				sta.setStationEnglish(rs.getString(3));
				sta.setBelongTo(rs.getString(4));
				sta.setStationRank(rs.getString(5));
				sta.setAdministrativeArea(rs.getString(6));
				sta.setAddress(rs.getString(7));
				
				userList.add(sta);
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

	public int getAmountstation(Station station) {
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="SELECT COUNT(*) FROM ti_station WHERE";
		  StringBuilder sb=new StringBuilder(sql);
		  if(station.getStationName() !=null&& !"".equals(station.getStationName())){
			 sb.append(" stationName like '%"+station.getStationName()+"%' AND") ;  
		  }
		  if(station.getStationEnglish() != null && !"".equals(station.getStationEnglish())){
			  sb.append(" stationEnglish='"+station.getStationEnglish()+"' AND") ;
		  }
		  if(station.getBelongTo() !=null && !"".equals(station.getBelongTo())){
			  sb.append(" belongTo='"+station.getBelongTo()+"' AND") ;
		  } 
		  
		  //sql 截取
		  String sb1 = sb.substring(0, sb.length()-4);
		  System.out.println(sb1.toString());
		  
        int count = 0;
        try {
        	PreparedStatement pst=conn.prepareStatement(sb1);
			ResultSet rs=pst.executeQuery();
            if(rs.next()){
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
	
	
}
