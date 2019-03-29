package cn.Neuedu.linger.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.Neuedu.linger.domain.LineManage;
import cn.Neuedu.linger.domain.Station;
import cn.Neuedu.linger.domain.Train;
import cn.Neuedu.linger.util.C3P0ConnectionFactory;
import cn.Neuedu.linger.util.Page;

public class LineManageDao {

	public List<LineManage> findAll(Page page) {
		List<LineManage> lineList=new ArrayList<LineManage>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_linemanage limit "+page.getStart()+","+page.getSize();;
		try {
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				LineManage line=new LineManage();
				line.setLid(rs.getInt(1));
				line.setTrainCode(rs.getString(2));
				line.setStationName(rs.getString(3));
				line.setStartTime(rs.getString(4));
				line.setEndTime(rs.getString(5));
				line.setDistance(rs.getString(6));
				line.setStayTime(rs.getString(7));
				line.setTotalTime(rs.getString(8));
				line.setStationOrder(rs.getString(9));
				
				lineList.add(line);
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
		return lineList;
	}

	public List<LineManage> findLineByDynamic(String stationName, String trainCode, Page page) {

		List<LineManage> lineList=new ArrayList<LineManage>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		 
		  String sql="select * from ti_linemanage where";
		  StringBuilder sb=new StringBuilder(sql);
		  if(stationName !=null&& !"".equals(stationName)){
			 sb.append(" stationName='"+stationName+"' and") ;  
		  }
		  if(trainCode != null && !"".equals(trainCode)){
			  sb.append(" trainCode='"+trainCode+"' and") ;
		  }
		  
		  //sql Ωÿ»°
		  String sb1 = sb.substring(0, sb.length()-3);
		  sb1 = sb1 +"limit "+page.getStart()+","+page.getSize();
		  
		  System.out.println(sb1.toString());
			try {
				PreparedStatement pst=conn.prepareStatement(sb1.toString());
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					LineManage line=new LineManage();
					line.setLid(rs.getInt(1));
					line.setTrainCode(rs.getString(2));
					line.setStationName(rs.getString(3));
					line.setStartTime(rs.getString(4));
					line.setEndTime(rs.getString(5));
					line.setDistance(rs.getString(6));
					line.setStayTime(rs.getString(7));
					line.setTotalTime(rs.getString(8));
					line.setStationOrder(rs.getString(9));
					
					lineList.add(line);
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
		return lineList;
	}

	public Boolean delete(int[] intTemp) {
		ResultSet rs = null;  
        String sql = "delete from ti_linemanage where lid=?";
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

	public LineManage findLineByInfo(String lid) {
		LineManage line=new LineManage();
		//List<Station> stationList1=new ArrayList<Station>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		 
		  String sql="select * from ti_linemanage where lid="+lid;
		  try {
				PreparedStatement pst=conn.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					line.setLid(rs.getInt(1));
					line.setTrainCode(rs.getString(2));
					line.setStationName(rs.getString(3));
					line.setStartTime(rs.getString(4));
					line.setEndTime(rs.getString(5));
					line.setDistance(rs.getString(6));
					line.setStayTime(rs.getString(7));
					line.setTotalTime(rs.getString(8));
					line.setStationOrder(rs.getString(9));
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
		
		return line;
	}

	public Boolean changeLineInfo(LineManage line) {
		String sql = "UPDATE ti_linemanage SET startTime='"+line.getStartTime()
        +"' , endTime='"+line.getEndTime()
        +"' , distance='"+line.getDistance()
        +"' , stayTime='"+line.getStayTime()
        +"' , totalTime='"+line.getTotalTime()
        +"' , stationOrder='"+line.getStationOrder()
        +"' WHERE lid = "+line.getLid();
		System.out.println(sql);
		try {
			Connection conn = new C3P0ConnectionFactory().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			int rs = ps.executeUpdate();
			if (rs == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public Boolean addLineInfo(LineManage line) {
		try {  
        	Connection conn =new C3P0ConnectionFactory().getConnection();  
        	String sql = "insert into ti_linemanage values(?,?,?,?,?,?,?,?,?)";
        	PreparedStatement pst = conn.prepareStatement(sql);
			pst.setObject(1, line.getLid());
			pst.setObject(2, line.getTrainCode());
			pst.setObject(3, line.getStationName());
			pst.setObject(4, line.getStartTime());
			pst.setObject(5, line.getEndTime());
			pst.setObject(6, line.getDistance());
			pst.setObject(7, line.getStayTime());
			pst.setObject(8, line.getTotalTime());
			pst.setObject(9, line.getStationOrder());
			
			int rowCount = pst.executeUpdate();
			if (rowCount > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        return false;
	}

	public int getAmount() {
		Connection conn =new C3P0ConnectionFactory().getConnection();
        String sql = "SELECT COUNT(*) FROM ti_linemanage";
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

	public int getAmountLine(String stationName, String trainCode) {
		Connection conn =new C3P0ConnectionFactory().getConnection();
		
		String sql="select COUNT(*) from ti_linemanage where";
		  StringBuilder sb=new StringBuilder(sql);
		  if(stationName !=null&& !"".equals(stationName)){
			 sb.append(" stationName='"+stationName+"' and") ;  
		  }
		  if(trainCode != null && !"".equals(trainCode)){
			  sb.append(" trainCode='"+trainCode+"' and") ;
		  }
		  
		  //sql Ωÿ»°
		 String sb1 = sb.substring(0, sb.length()-3);
        int count = 0;
        try {
        	PreparedStatement pst=conn.prepareStatement(sb1);
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

	public Boolean findtrainid(String lid) {
		Connection conn = null;  
        PreparedStatement ps = null;  
        ResultSet rs;  
        try {  
            conn =new C3P0ConnectionFactory().getConnection();  
            
            String sql = "SELECT * FROM ti_linemanage WHERE lid = "+lid;
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
	
}
