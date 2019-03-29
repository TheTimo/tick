package cn.Neuedu.linger.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import cn.Neuedu.linger.dao.UserDao;
import cn.Neuedu.linger.domain.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		if(request.getParameter("method").equals("Register")) {
			Register(request, response);
		}
		if(request.getParameter("method").equals("quit")) {
			Logout(request, response);
		}
		if(request.getParameter("method").equals("Changepassword")) {
			Changepassword(request, response);
		}
		if(request.getParameter("method").equals("findloginname")) {
			findloginname(request, response);
		}
		if(request.getParameter("method").equals("userinfoedit")) {
			userinfoedit(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	/*
	 * 
	 * 用户修改信息
	 */
	protected void userinfoedit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String loginname = request.getParameter("loginname");
		String userid = request.getParameter("userid");
		String realname = request.getParameter("realname");
		String sex= request.getParameter("sex");
		String provice= request.getParameter("provice");
		String citty= request.getParameter("citty");
		String cardtype= request.getParameter("cardtype");
		String cardnum= request.getParameter("cardnum");
		String birthday= request.getParameter("birthday");
		int travellertype= Integer.parseInt(request.getParameter("travellertype"));
		String info= request.getParameter("info");
		
		/*System.out.println(loginname +"  "+userid +"  "+realname +"  "+
		sex+"  "+provice +"  "+ citty+"  "+cardtype +"  "+cardnum +"  "+birthday +"  "+ travellertype+"  "+info);*/
		User user = new User();
		user.setLoginname(loginname);
		user.setUserid(Integer.parseInt(userid));
		user.setRealname(realname);
		user.setSex(Integer.parseInt(sex));
		user.setProvice(provice);
		user.setCitty(citty);
		user.setCardtype(Integer.parseInt(cardtype));
		user.setCardnum(cardnum);
		user.setBirthday(birthday);
		user.setTravellertype(travellertype);
		user.setInfo(info);
		
		//System.out.println(user.toString());
		 Boolean res = new UserDao().userinfoedit(user);
		if(res) {
			request.getRequestDispatcher("/User/UserManageInfo.jsp").forward(request, response);
		}
	}
	
	
	/*
	 * 
	 * 用户注册
	 */
	protected void Register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginname = request.getParameter("loginname");
		String password = request.getParameter("password");
		String realname = request.getParameter("realname");
		String sex= request.getParameter("sex");
		String provice= request.getParameter("provice");
		String citty= request.getParameter("citty");
		String cardtype= request.getParameter("cardtype");
		String cardnum= request.getParameter("cardnum");
		String birthday= request.getParameter("birthday");
		int travellertype= Integer.parseInt(request.getParameter("travellertype"));
		String info= request.getParameter("info");
		
		User user = new User();
		user.setLoginname(loginname);
		user.setPassword(password);
		user.setRealname(realname);
		user.setSex(Integer.parseInt(sex));
		user.setProvice(provice);
		user.setCitty(citty);
		user.setCardtype(Integer.parseInt(cardtype));
		user.setCardnum(cardnum);
		user.setBirthday(birthday);
		user.setTravellertype(travellertype);
		user.setInfo(info);
		
		//System.out.println(user.toString());
		Boolean res = new UserDao().Register(user);
		
		if(res) {
			System.out.println("添加成功");
			response.sendRedirect(request.getContextPath()+"/Index.jsp");
		}else {
			System.out.println("添加失败");
			
		}
	}
	
	/*
	 * 
	 * 用户撤销
	 */
	protected void Logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
		
		//request.getRequestDispatcher(request.getContextPath()+"/Index.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/Index.jsp");
	}
	/*
	 * 
	 * 修改用户密码
	 */
	protected void Changepassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("password");
		String newpassword = request.getParameter("newpassword");
		String renewpassword = request.getParameter("renewpassword");
		HttpSession session = request.getSession();
		int userid = (int) session.getAttribute("userid");
		
		//System.out.println(password+"  "+newpassword+"  "+renewpassword+"  "+userid);
		
        Boolean res = new UserDao().Changepassword(password,newpassword, userid);
        
        /*response.setContentType("text/html;charset=utf-8");
        PrintWriter out= response.getWriter();
		
		if(res) {
			System.out.println("修改成功");
			out.write("success");
			
		}else {
			System.out.println("修改失败");
			out.write("false");
		}*/
        if(res) {
			System.out.println("修改成功");
			response.getWriter().write("true");
			
		}else {
			System.out.println("修改失败");
			response.getWriter().write("false");
		}
	}
	
	/*
	 * 
	 * 判断是否重复loginname
	 */
	protected void findloginname(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginname = request.getParameter("loginname");
		Boolean res = new UserDao().findloginname(loginname);
		if(res) {
			//System.out.println("成功");
			response.getWriter().write("true");
		}else {
			response.getWriter().write("false");;
		}
	}
	
	
	
	
	
}
