package Test;

import org.junit.Test;

import cn.Neuedu.linger.util.MailUtil;

public class MailUtilTest {

	@Test
	public void test() throws Exception {
		new MailUtil().sendActiveMail("2721103505@qq.com", "123456789");
	}
}



/** 

public ServiceReturnObj activemail(){  
    String mailcode = param.get("mailcode");  
    try {  
        //1.���ݼ���������ݿ����û���Ϣ  
        ShopUser user = shopUserDao.selectUserByMailCode(mailcode);  
        //2.����ܲ������ô���Ǿͽ�����û��ļ�����״̬��Ϊ����  
        if (user!=null) {  
            shopUserDao.updateUserMailActive(user.getId());  
        }  
    } catch (SQLException e) {  
        e.printStackTrace();  
        return ServiceReturnObj.newServiceReturn("/success.jsp", "���伤��ʧ��");  
    }  
      
    return ServiceReturnObj.newServiceReturn("/success.jsp", "���伤��ɹ�");  
}  


public ShopUser selectUserByMailCode(String mailcode) throws SQLException {  
    String sql = "select * from shop_user where MAILACTIVECODE=?";  
    return queryRunner.query(DbUtil.getConnection(),sql,new BeanHandler(ShopUser.class),mailcode);  
}  
  
public void updateUserMailActive(String id) throws SQLException {  
    String sql="update shop_user set MAILACTIVEFLAG='1',MAILACTIVECODE=null where id=?";  
    int rows = queryRunner.update(DbUtil.getConnection(),sql,id);  
}  

 */

