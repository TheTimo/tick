package cn.Neuedu.linger.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.Neuedu.linger.dao.BuyTicketDao;
import cn.Neuedu.linger.dao.TrainDao;
import cn.Neuedu.linger.domain.Cart;
import cn.Neuedu.linger.domain.Train;

/**
 * Servlet implementation class BuyTicketServlet
 */
@WebServlet("/BuyTicketServlet")
public class BuyTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuyTicketServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method=request.getParameter("method");
		//System.out.println(method);
		if("findtrainAll".equals(method)){
			findtrainAll(request,response);
		}else if("findBuyTicketByDynamic".equals(method)) {
			findBuyTicketByDynamic(request,response);
		}else if("BuyTicket".equals(method)) {
			BuyTicket(request,response);
		}else if("findCartAll".equals(method)) {
			findCartAll(request,response);
		}/*else if("changeTrainInfo".equals(method)) {
			changeTrainInfo(request,response);
		}else if("addTrain".equals(method)) {
			addTrain(request,response);
		}else if("findtrainid".equals(method)) {
			findtrainid(request,response);
		}*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void findtrainAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Train> trainList=new BuyTicketDao().findAll();
        //将相关数据存储起来
        request.setAttribute("trainList",trainList );
        request.getRequestDispatcher("/User/UserBuyTicket.jsp").forward(request, response);
	}
	protected void findBuyTicketByDynamic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startStation=request.getParameter("startStation").trim();
		String endStation=request.getParameter("endStation").trim();
        List<Train> trainList=new BuyTicketDao().findBuyTicketByDynamic(startStation,endStation);
        request.setAttribute("trainList",trainList );
        request.getRequestDispatcher("/User/UserBuyTicket.jsp").forward(request, response);
	}
	
	protected void BuyTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("param");
		String realname = request.getParameter("realname");
		String userid = request.getParameter("userid");
		//System.out.println(realname+"  "+userid);
		String cids[] = param.split("A");
		int[] intTemp = new int[cids.length];
		for(int i = 0;i<cids.length;i++) {
			intTemp[i]= Integer.parseInt(cids[i]);
		}
		//System.out.println(intTemp[0]);
		Train train = new BuyTicketDao().findtrain(intTemp[0]);
		Boolean res = new BuyTicketDao().buyticket(intTemp.length,realname,param,userid,train);
		if(res) {
			//System.out.println("成功");
			response.getWriter().write("true");
		}else {
			response.getWriter().write("false");
		}
	}
	
	protected void findCartAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		 List<Cart> cartList = new BuyTicketDao().findCartAll(userid);
		 request.setAttribute("cartList",cartList);
	     request.getRequestDispatcher("/User/CartTicket.jsp").forward(request, response);
	}
}
