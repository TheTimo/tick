package cn.Neuedu.linger.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.Neuedu.linger.dao.UserDao;
import cn.Neuedu.linger.domain.Manager;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	public static final int WIDTH = 200;
	public static final int HEIGHT = 70;
	private static final long serialVersionUID = 1L;
	String num = "";
	
    public LoginServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		response.reset();
		BufferedImage image = new BufferedImage(WIDTH,HEIGHT,BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics(); 
		//设置背景
		setBackGround(g);
		//设置边框
		setBorber(g);
		//画干扰线
		dramRandomLine(g);
		//随机生成数或汉字
		drawRandomNum((Graphics2D)g);
		//输出图片
		response.setContentType("image/jpeg");
		ImageIO.write(image, "jpg", response.getOutputStream());
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		response.reset();
		
		response.setContentType("text/html;charset=UTF-8");
		//response.setCharacterEncoding("UTF=8");
		request.setCharacterEncoding("UTF-8");
		String yanzhengma = request.getParameter("yanzhengma");
		if(yanzhengma.trim().equals(num)) {
			String username = request.getParameter("username");
			String password  = request.getParameter("password");
			Manager m= new Manager();
			m.setUsername(username);
			m.setPassword(password);
			//数据库的链接和数据查询
			String res = new UserDao().Login(m,request);
			
			if(res == "1") {
				request.getSession().setAttribute("username", username);
				response.sendRedirect(request.getContextPath()+"/Admin/Index.jsp");
			}else if(res == "2") {
				response.sendRedirect(request.getContextPath()+"/User/Index.jsp");
			}else {
				System.out.println("登陆失败");
				//request.getRequestDispatcher("/Index.jsp").forward(request,response);
				response.sendRedirect(request.getContextPath()+"/Index.jsp");
			}
		}else {
			System.out.println("验证码错误");
		}
		
	}

	private void drawRandomNum(Graphics2D g) {
		// TODO Auto-generated method stub
		g.setColor(Color.RED);
		g.setFont(new Font("黑体",Font.BOLD,50));
		num="";
		String array[] = {"1","2","3","4","5","6","7","8","9","0"};
		
		for(int i = 0;i < 5;i++) {
			int degree = new Random().nextInt(40);
			int a = new Random().nextInt(10);
			
			g.rotate(degree*Math.PI/180,40*i, 50);
			g.drawString(array[a], 40*i, 50);
			g.rotate(-degree*Math.PI/180,40*i, 50);
			
			num =num+array[a];
		}
		System.out.println(num);
	}

	private void setBorber(Graphics g) {
		// TODO Auto-generated method stub
		g.setColor(Color.BLUE);
		g.drawRect(0, 0, WIDTH-1, HEIGHT-1);
	}

	private void dramRandomLine(Graphics g) {
		// TODO Auto-generated method stub
		g.setColor(Color.GREEN);
		for(int i=0;i<8;i++) {
			int x1 = new Random().nextInt(WIDTH);
			int y1 = new Random().nextInt(HEIGHT);
			
			int x2 = new Random().nextInt(WIDTH);
			int y2 = new Random().nextInt(HEIGHT);
			
			g.drawLine(x1, y1, x2, y2);
		}
		
	}

	private void setBackGround(Graphics g) {
		// TODO Auto-generated method stub
		g.setColor(Color.WHITE);
		g.fillRect(0, 0,WIDTH, HEIGHT);
	}
}
