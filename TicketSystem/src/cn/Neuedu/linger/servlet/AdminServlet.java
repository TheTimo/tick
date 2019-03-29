package cn.Neuedu.linger.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.Neuedu.linger.dao.AdminDao;
import cn.Neuedu.linger.dao.BuyTicketDao;
import cn.Neuedu.linger.dao.StationDao;
import cn.Neuedu.linger.dao.UserDao;
import cn.Neuedu.linger.domain.Cart;
import cn.Neuedu.linger.domain.Station;
import cn.Neuedu.linger.domain.User;
import cn.Neuedu.linger.util.DateUtils;
import cn.Neuedu.linger.util.Page;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method=request.getParameter("method");
		//System.out.println(method);
		if("insert".equals(method)){
			insert(request,response);
		}else if("delete".equals(method)){
			delete(request,response);
		}else if("findAll".equals(method)){
			findAll(request,response);
		}else if("findUsersByDynamic".equals(method)){
			findUsersByDynamic(request,response);
		}else if("findCartAll".equals(method)){
			findCartAll(request,response);
		}
		else if("cartInfoEdit".equals(method)){
			cartInfoEdit(request,response);
		}else if("deletecart".equals(method)){
			deletecart(request,response);
		}else if("userinfoedit".equals(method)){
			userinfoedit(request,response);
		}else if("userinfoeditadmin".equals(method)){
			userinfoeditadmin(request,response);
		}
	}

	private void findUsersByDynamic(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String realName=request.getParameter("username");
		String sex=request.getParameter("sex");
		
		String cardType=request.getParameter("cardtype");
		String cardNumber=request.getParameter("cardnum");
		String lvkeType= request.getParameter("travellertype");
		System.out.println(sex);
		System.out.println(cardType);
		System.out.println(lvkeType);
		User u=new User();
		u.setRealname(realName);
		if(sex != "") {
			int sex1 =Integer.parseInt(sex.trim()); 
			u.setSex(sex1);
		}
		if(cardType != "") {
			int cardType1 =Integer.parseInt(cardType.trim()); 
			u.setCardtype(cardType1);
		}
		if(lvkeType != "") {
			int lvkeType1 =Integer.parseInt(lvkeType.trim()); 
			u.setTravellertype(lvkeType1);
		}
		u.setCardnum(cardNumber);

		System.out.println(u.toString());
		// 获取当前页
        String curpage = request.getParameter("curpage");
        // 获取总数量
        int count = new AdminDao().getAmountUser(u);
        System.out.println(count);
        //字符串转成整型
        int currentpage = currentPage(curpage);
        // 创建page对象
        Page page = new Page(count, currentpage, 3); //总数   页面号  页面条数
		
        List<User> userList=new AdminDao().findUsersByDynamic(u,page);
        request.setAttribute("aa", "2");
        request.setAttribute("u", u);
        request.setAttribute("page", page);
        request.setAttribute("userList",userList );
        request.getRequestDispatcher("/Admin/UserManageQuery.jsp").forward(request, response);
		
	}
	private void findAll(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// 获取当前页
        String curpage = request.getParameter("curpage");
        // 获取总数量
        int count = new AdminDao().getAmount();
        //字符串转成整型
        int currentpage = currentPage(curpage);
        // 创建page对象
        Page page = new Page(count, currentpage, 3); //总数   页面号  页面条数
        // 获取当前页的数据
        List<User> userList=new AdminDao().findAll(page);
        //将相关数据存储起来
        request.setAttribute("page", page);
        request.setAttribute("aa", "1");
        request.setAttribute("userList",userList );
        request.getRequestDispatcher("/Admin/UserManageQuery.jsp").forward(request, response);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("param");
		//System.out.println(param);
		String cids[] = param.split(":");
		int[] intTemp = new int[cids.length];
		for(int i = 0;i<cids.length;i++) {
			intTemp[i]= Integer.parseInt(cids[i]);
		}
		Boolean res = new AdminDao().delete(intTemp);
		//System.out.println(res);
		request.getRequestDispatcher("/AdminServlet?method=findAll").forward(request, response);
	}

	private void findCartAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 List<Cart> cartList = new AdminDao().adminfindCartAll();
		 request.setAttribute("cartList",cartList);
	     request.getRequestDispatcher("/Admin/CartManage.jsp").forward(request, response);
	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String loginName = request.getParameter("loginName");
		String realName = request.getParameter("realName");
		String provice = request.getParameter("provice");
		String city = request.getParameter("city");
		int sex = Integer.parseInt(request.getParameter("sex"));
		int cardType = Integer.parseInt(request.getParameter("cardType"));
		String cardNumber = request.getParameter("cardNumber");
		String birthday = request.getParameter("birthday");
		int lvkeType = Integer.parseInt(request.getParameter("lvkeType"));
		String info = request.getParameter("info");
		User user = new User();
		user.setLoginname(loginName);
		user.setRealname(realName);
		user.setProvice(provice);
		user.setCitty(city);
		user.setSex(sex);
		user.setCardtype(cardType);
		user.setCardnum(cardNumber);
		user.setBirthday(birthday);
		user.setTravellertype(lvkeType);
		user.setInfo(info);
		if (new AdminDao().insert(user)) {
			response.sendRedirect(request.getContextPath()+"/Admin/UserInfo_Add.jsp");
			System.out.println("添加成功");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

	public int currentPage(String cpage){
        int currentpage = cpage!=null && !"".equals(cpage) && isint(cpage)? currentpage=Integer.parseInt(cpage):1;
        return currentpage;
    }
	public boolean isint(String str){
        boolean bo = true;
        try {
            Integer.parseInt(str);
        } catch (Exception e) {
            bo = false;
        }
        return bo;
    }
	
	protected void cartInfoEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cartid = request.getParameter("cartid");
		Cart cart = new AdminDao().cartInfoEdit(cartid);
		request.setAttribute("cart",cart);
	     request.getRequestDispatcher("/Admin/CartManageInfo_Amind_Edit.jsp").forward(request, response);
	}
	
	protected void deletecart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("param");
		//System.out.println(param);
		String cids[] = param.split(":");
		int[] intTemp = new int[cids.length];
		for(int i = 0;i<cids.length;i++) {
			intTemp[i]= Integer.parseInt(cids[i]);
		}
		Boolean res = new AdminDao().deletecart(intTemp);
		//System.out.println(res);
		request.getRequestDispatcher("/AdminServlet?method=findCartAll").forward(request, response);
	}
	
	protected void userinfoedit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		User user = new AdminDao().userInfoEdit(userid);
		request.setAttribute("user",user);
		request.setAttribute("userid123",userid);
	     request.getRequestDispatcher("/Admin/UserManageInfo_Amind_Edit.jsp").forward(request, response);
	}
	
	protected void userinfoeditadmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginname = request.getParameter("loginname");
		String realname = request.getParameter("realname");
		String sex = request.getParameter("sex");
		String provice = request.getParameter("provice");
		String userid = request.getParameter("userid");
		String citty = request.getParameter("citty");
		String cardtype = request.getParameter("cardtype");
		String cardnum = request.getParameter("cardnum");
		String birthday = request.getParameter("birthday");
		String travellertype = request.getParameter("travellertype");
		String info = request.getParameter("info");
		
		User user = new User();
		user.setUserid(Integer.parseInt(userid));
		user.setLoginname(loginname);
		user.setRealname(realname);
		user.setProvice(provice);
		user.setCitty(citty);
		user.setSex(Integer.parseInt(sex));
		user.setCardtype(Integer.parseInt(cardtype));
		user.setCardnum(cardnum);
		user.setBirthday(birthday);
		user.setTravellertype(Integer.parseInt(travellertype));
		user.setInfo(info);
		
		//System.out.println(user.toString());
		Boolean res = new AdminDao().userinfoeditadmin(user);
		if(res) {
			request.getRequestDispatcher("/AdminServlet?method=findAll").forward(request, response);
		}
	}
	
	
	
}
