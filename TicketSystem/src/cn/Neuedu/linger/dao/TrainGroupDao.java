package cn.Neuedu.linger.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.Neuedu.linger.domain.Train;
import cn.Neuedu.linger.domain.TrainGroup;
import cn.Neuedu.linger.util.C3P0ConnectionFactory;
import cn.Neuedu.linger.util.Page;

public class TrainGroupDao {

	public List<TrainGroup> findAll(Page page) {
		List<TrainGroup> trainGroupList=new ArrayList<TrainGroup>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		String sql="select * from ti_traingroup limit "+page.getStart()+","+page.getSize();
		try {
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				TrainGroup tra=new TrainGroup();
				tra.setGid(rs.getInt(1));
				tra.setgCode(rs.getString(2));
				tra.setgBox(rs.getString(3));
				tra.setGboxType(rs.getString(4));
				tra.setGchairNum(rs.getString(5));
				tra.setGchairType(rs.getString(6));
				//System.out.println(rs.getString(6));
				trainGroupList.add(tra);
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
	return trainGroupList;
	}

	public List<TrainGroup> findTrainGroupByDynamic(String gCode, Page page) {
		List<TrainGroup> trainGroup=new ArrayList<TrainGroup>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		 
		  String sql="select * from ti_traingroup where gCode='"+gCode+"' limit "+page.getStart()+","+page.getSize();
		  System.out.println(sql);
			try {
				PreparedStatement pst=conn.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					TrainGroup tra=new TrainGroup();
					tra.setGid(rs.getInt(1));
					tra.setgCode(rs.getString(2));
					tra.setgBox(rs.getString(3));
					tra.setGboxType(rs.getString(4));
					tra.setGchairNum(rs.getString(5));
					tra.setGchairType(rs.getString(6));
					//System.out.println(rs.getString(6));
					trainGroup.add(tra);
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
		return trainGroup;
	}

	public Boolean delete(int[] intTemp) {
		ResultSet rs = null;  
        String sql = "delete from ti_traingroup where gid=?";
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

	public TrainGroup traingroupinfoedit(String gid) {
		TrainGroup trainGroup = new TrainGroup();
		//List<Station> stationList1=new ArrayList<Station>();
		Connection conn =new C3P0ConnectionFactory().getConnection();
		 
		  String sql="select * from ti_traingroup where gid="+gid;
		  try {
				PreparedStatement pst=conn.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					
					trainGroup.setGid(rs.getInt(1));
					trainGroup.setgCode(rs.getString(2));
					trainGroup.setgBox(rs.getString(3));
					trainGroup.setGboxType(rs.getString(4));
					trainGroup.setGchairNum(rs.getString(5));
					trainGroup.setGchairType(rs.getString(6));
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
		
		return trainGroup;
	}

	public Boolean changeTrainGroupInfo(TrainGroup train) {
		String sql = "UPDATE ti_traingroup SET gCode='"+train.getgCode()
        +"' , gBox='"+train.getgBox()
        +"' , gboxType='"+train.getGboxType()
        +"' , gchairNum='"+train.getGchairNum()
        +"' , gchairType='"+train.getGchairType()
        +"' WHERE gid = "+train.getGid();
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

	public Boolean addTrainGroup(TrainGroup trainGroup) {
		try {  
        	Connection conn =new C3P0ConnectionFactory().getConnection();  
        	String sql = "insert into ti_traingroup values(?,?,?,?,?,?)";
        	PreparedStatement pst = conn.prepareStatement(sql);
			pst.setObject(1, trainGroup.getGid());
			pst.setObject(2, trainGroup.getgCode());
			pst.setObject(3, trainGroup.getgBox());
			pst.setObject(4, trainGroup.getGboxType());
			pst.setObject(5, trainGroup.getGchairNum());
			pst.setObject(6, trainGroup.getGchairType());
			
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
        String sql = "SELECT COUNT(*) FROM ti_traingroup";
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


	public int getAmountTrain(String gCode) {
		Connection conn =new C3P0ConnectionFactory().getConnection();
        String sql = "SELECT COUNT(*) FROM ti_traingroup where gCode='"+gCode+"'";
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

	public Boolean findgid(String gid) {
		Connection conn = null;  
        PreparedStatement ps = null;  
        ResultSet rs;  
        try {  
            conn =new C3P0ConnectionFactory().getConnection();  
            
            String sql = "SELECT * FROM ti_traingroup WHERE gid = "+gid;
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
