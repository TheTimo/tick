package cn.Neuedu.linger.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.Neuedu.linger.domain.Station;
import cn.Neuedu.linger.domain.Train;
import cn.Neuedu.linger.util.C3P0ConnectionFactory;
import cn.Neuedu.linger.util.Page;


public class TrainDao {

	public List<Train> findAll(Page page) {
		List<Train> trainList=new ArrayList<Train>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_train limit "+page.getStart()+","+page.getSize();
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

	public List<Train> findTrainByDynamic(String trainid) {
		List<Train> trainList=new ArrayList<Train>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		 
		  String sql="select * from ti_train where trainid="+trainid;
		  System.out.println(sql);
			try {
				PreparedStatement pst=conn.prepareStatement(sql);
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

	public Boolean delete(int[] intTemp) {
		ResultSet rs = null;  
        String sql = "delete from ti_train where trainid=?";
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

	public Train findTrainByInfo(String trainid) {

		Train train2 = new Train();
		//List<Station> stationList1=new ArrayList<Station>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		 
		  String sql="select * from ti_train where trainid="+trainid;
		  try {
				PreparedStatement pst=conn.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					
					train2.setTrainid(rs.getInt(1));
					train2.setStartStation(rs.getString(2));
					train2.setEndStation(rs.getString(3));
					train2.setStartTime(rs.getString(4));
					train2.setEndTime(rs.getString(5));
					train2.setTime(rs.getString(6));
					train2.setDistance(rs.getString(7));
					train2.setNoTicket(rs.getString(8));
					train2.setType(rs.getString(9));
					train2.setClassification(rs.getString(10));
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
		
		return train2;
	}

	public Boolean changeTrainInfo(Train train) {
		String sql = "UPDATE ti_train SET startStation='"+train.getStartStation()
		                              +"' , endStation='"+train.getEndStation()
		                              +"' , startTime='"+train.getStartTime()
		                              +"' , endTime='"+train.getEndTime()
		                              +"' , time='"+train.getTime()
		                              +"' , distance='"+train.getDistance()
		                              +"' , noTicket='"+train.getNoTicket()
		                              +"' , type='"+train.getType()
		                              +"' , classification='"+train.getClassification()
		                              +"' WHERE trainid = "+train.getTrainid();
        System.out.println(sql);
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

	public Boolean addtrain(Train train) {
		try {  
        	Connection conn =new C3P0ConnectionFactory().getConnection();  
        	String sql = "insert into ti_train values(?,?,?,?,?,?,?,?,?,?)";
        	PreparedStatement pst = conn.prepareStatement(sql);
			pst.setObject(1, train.getTrainid());
			pst.setObject(2, train.getStartStation());
			pst.setObject(3, train.getEndStation());
			pst.setObject(4, train.getStartTime());
			pst.setObject(5, train.getEndTime());
			pst.setObject(6, train.getTime());
			pst.setObject(7, train.getDistance());
			pst.setObject(8, train.getNoTicket());
			pst.setObject(9, train.getType());
			pst.setObject(10, train.getClassification());
			
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
        String sql = "SELECT COUNT(*) FROM ti_train";
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
	

	public boolean findtrainid(String trainid) {
		Connection conn = null;  
        PreparedStatement ps = null;  
        ResultSet rs;  
        try {  
            conn =new C3P0ConnectionFactory().getConnection();  
            
            String sql = "SELECT * FROM ti_train WHERE trainid = '"+trainid+"'";
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
