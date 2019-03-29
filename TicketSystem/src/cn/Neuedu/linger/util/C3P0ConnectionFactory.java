package cn.Neuedu.linger.util;  
  
import java.sql.Connection;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;
import java.util.Properties;

import com.mchange.v2.c3p0.ComboPooledDataSource;  
  
public class C3P0ConnectionFactory {  
      
    private static ComboPooledDataSource ds;  
      
    //��̬��ʼ������г�ʼ��  
    static{  
        try {  
            ds = new ComboPooledDataSource();//�������ӳ�ʵ��  
            
            //Properties props = new Properties();  
            //props.load(C3P0ConnectionFactory.class.getResourceAsStream("config.properties"));  
            
           /* ds.setDriverClass(props.getProperty("DriverClass"));  
            ds.setJdbcUrl(props.getProperty("JdbcUrl"));  
            ds.setUser(props.getProperty("User"));  
            ds.setPassword(props.getProperty("Password"));  
              
            ds.setMaxPoolSize(Integer.parseInt(props.getProperty("MaxPoolSize")));  
            ds.setMinPoolSize(Integer.parseInt(props.getProperty("MinPoolSize")));  
            ds.setInitialPoolSize(Integer.parseInt(props.getProperty("InitialPoolSize")));  
            ds.setMaxStatements(Integer.parseInt(props.getProperty("MaxStatements")));  
            ds.setMaxIdleTime(Integer.parseInt(props.getProperty("MaxIdleTime")));  */
            
            
            ds.setDriverClass("com.mysql.jdbc.Driver");//�������ӳ��������ݿ����������  
              
            ds.setJdbcUrl("jdbc:mysql://localhost:3306/ticketsys");//�����������ݿ��URL  
              
            ds.setUser("root");//�����������ݿ���û���  
              
            ds.setPassword("root");//�����������ݿ������  
              
            ds.setMaxPoolSize(40);//�������ӳص����������  
              
            ds.setMinPoolSize(2);//�������ӳص���С������  
              
            ds.setInitialPoolSize(10);//�������ӳصĳ�ʼ������  
              
            ds.setMaxStatements(100);//�������ӳصĻ���Statement�������              
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
      
    //��ȡ��ָ�����ݿ������  
    public static ComboPooledDataSource getInstance(){  
        return ds;  
    }   
  
    //�����ӳط���һ������  
    public static Connection getConnection(){  
        Connection conn = null;  
        try {  
            conn = ds.getConnection();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return conn;  
    }  
      
    //�ͷ���Դ  
    public static void realeaseResource(ResultSet rs,PreparedStatement ps,Connection conn){  
        if(null != rs){  
            try {  
                rs.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
          
        if(null != ps){  
            try {  
                ps.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
  
        try {  
            conn.close();  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
    }  
} 