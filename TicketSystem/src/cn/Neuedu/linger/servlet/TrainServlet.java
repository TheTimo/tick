package cn.Neuedu.linger.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.Neuedu.linger.dao.StationDao;
import cn.Neuedu.linger.dao.TrainDao;
import cn.Neuedu.linger.dao.UserDao;
import cn.Neuedu.linger.domain.Station;
import cn.Neuedu.linger.domain.Train;
import cn.Neuedu.linger.util.Page;

/**
 * Servlet implementation class TrainServlet
 */
@WebServlet("/TrainServlet")
public class TrainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TrainServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String method=request.getParameter("method");
		//System.out.println(method);
		if("findAll".equals(method)){
			findAll(request,response);
		}else if("findTrainByDynamic".equals(method)) {
			findTrainByDynamic(request,response);
		}else if("delete".equals(method)) {
			delete(request,response);
		}else if("traininfoedit".equals(method)) {
			traininfoedit(request,response);
		}else if("changeTrainInfo".equals(method)) {
			changeTrainInfo(request,response);
		}else if("addTrain".equals(method)) {
			addTrain(request,response);
		}else if("findtrainid".equals(method)) {
			findtrainid(request,response);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取当前页
        String curpage = request.getParameter("curpage");
        // 获取总数量
        int count = new TrainDao().getAmount();
        //字符串转成整型
        int currentpage = currentPage(curpage);
        // 创建page对象
        Page page = new Page(count, currentpage, 3); //总数   页面号  页面条数
        // 获取当前页的数据
        List<Train> trainList=new TrainDao().findAll(page);
        //将相关数据存储起来
        request.setAttribute("page", page);
        request.setAttribute("aa", "1");
        request.setAttribute("trainList",trainList );
        request.getRequestDispatcher("/Admin/TrainManageQuery.jsp").forward(request, response);
	}
	
	protected void findTrainByDynamic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String trainid=request.getParameter("trainid").trim();
        List<Train> trainList=new TrainDao().findTrainByDynamic(trainid);
        request.setAttribute("trainList",trainList );
        request.getRequestDispatcher("/Admin/TrainManageQuery.jsp").forward(request, response);
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("param");
		//System.out.println(param);
		String cids[] = param.split(":");
		int[] intTemp = new int[cids.length];
		for(int i = 0;i<cids.length;i++) {
			intTemp[i]= Integer.parseInt(cids[i]);
		}
		Boolean res = new TrainDao().delete(intTemp);
		//System.out.println(res);
		request.getRequestDispatcher("/TrainServlet?method=findAll").forward(request, response);
	}
	
	protected void traininfoedit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String trainid=request.getParameter("trainid");
		//System.out.println(sid);
		Train trainList = new TrainDao().findTrainByInfo(trainid);
		request.setAttribute("trainList12",trainList );
        request.getRequestDispatcher("/Admin/TrainManageInfo_Amind_Edit.jsp").forward(request, response);
	}
	
	protected void changeTrainInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String trainid=request.getParameter("trainid");
		String startStation=request.getParameter("startStation");
		String endStation=request.getParameter("endStation");
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		String time=request.getParameter("time");
		String distance=request.getParameter("distance");
		String noTicket=request.getParameter("noTicket");
		String type=request.getParameter("type");
		String classification=request.getParameter("classification");
		//System.out.println(trainid);
		Train train = new Train();
		train.setTrainid(Integer.parseInt(trainid));
		train.setStartStation(startStation);
		train.setEndStation(endStation);
		train.setStartTime(startTime);
		train.setEndTime(endTime);
		train.setTime(time);
		train.setDistance(distance);
		train.setNoTicket(noTicket);
		train.setType(type);
		train.setClassification(classification);
		
		//System.out.println(train.toString());
		Boolean res = new TrainDao().changeTrainInfo(train);
		//System.out.println(res);
		if(res) {
			request.getRequestDispatcher("/TrainServlet?method=findAll").forward(request, response);
		}
	}
	
	protected void addTrain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String trainid=request.getParameter("trainid");
		String startStation=request.getParameter("startStation");
		String endStation=request.getParameter("endStation");
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		String time=request.getParameter("time");
		String distance=request.getParameter("distance");
		String noTicket=request.getParameter("noTicket");
		String type=request.getParameter("type");
		String classification=request.getParameter("classification");
		//System.out.println(trainid);
		Train train = new Train();
		train.setTrainid(Integer.parseInt(trainid));
		train.setStartStation(startStation);
		train.setEndStation(endStation);
		train.setStartTime(startTime);
		train.setEndTime(endTime);
		train.setTime(time);
		train.setDistance(distance);
		train.setNoTicket(noTicket);
		train.setType(type);
		train.setClassification(classification);
		
		//System.out.println(train.toString());
		Boolean res = new TrainDao().addtrain(train);
		//System.out.println(res);
		if(res) {
			response.getWriter().write("true");
			//request.getRequestDispatcher("/TrainServlet?method=findAll").forward(request, response);
		}else {
			response.getWriter().write("false");
		}
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
	
	protected void findtrainid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String trainid = request.getParameter("trainid");
		Boolean res = new TrainDao().findtrainid(trainid);
		if(res) {
			//System.out.println("成功");
			response.getWriter().write("true");
		}else {
			response.getWriter().write("false");;
		}
	}
	
}
