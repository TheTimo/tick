package cn.Neuedu.linger.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.Neuedu.linger.dao.LineManageDao;
import cn.Neuedu.linger.dao.StationDao;
import cn.Neuedu.linger.dao.TrainDao;
import cn.Neuedu.linger.domain.LineManage;
import cn.Neuedu.linger.domain.Station;
import cn.Neuedu.linger.domain.Train;
import cn.Neuedu.linger.util.Page;

/**
 * Servlet implementation class LineManageServlet
 */
@WebServlet("/LineManageServlet")
public class LineManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LineManageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String method=request.getParameter("method");
		//System.out.println(method);
		if("findAll".equals(method)){
			findAll(request,response);
		}else if("findLineManageByDynamic".equals(method)) {
			findLineManageByDynamic(request,response);
		}else if("delete".equals(method)) {
			delete(request,response);
		}else if("lineinfoedit".equals(method)) {
			lineinfoedit(request,response);
		}else if("changeLineInfo".equals(method)) {
			changeLineInfo(request,response);
		}else if("addLine".equals(method)) {
			addLine(request,response);
		}else if("findlid".equals(method)) {
			findlid(request,response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 获取当前页
        String curpage = request.getParameter("curpage");
        // 获取总数量
        int count = new LineManageDao().getAmount();
        //字符串转成整型
        int currentpage = currentPage(curpage);
        // 创建page对象
        Page page = new Page(count, currentpage, 3); //总数   页面号  页面条数
        // 获取当前页的数据
        //List<Station> stationList=new StationDao().findAll(page);
        List<LineManage> lineManage =new LineManageDao().findAll(page);
        //将相关数据存储起来
        request.setAttribute("page", page);
        request.setAttribute("lineManage",lineManage );
        request.setAttribute("aa", "1");
        request.getRequestDispatcher("/Admin/LineManageQuery.jsp").forward(request, response);
		
		/*List<LineManage> lineManage =new LineManageDao().findAll();
        request.setAttribute("lineManage",lineManage );
        request.getRequestDispatcher("/Admin/LineManageQuery.jsp").forward(request, response);*/
	}
	
	protected void findLineManageByDynamic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stationName=request.getParameter("stationName").trim();
		String trainCode=request.getParameter("trainCode").trim();
		
		// 获取当前页
        String curpage = request.getParameter("curpage");
        // 获取总数量
        int count = new LineManageDao().getAmountLine(stationName,trainCode);
        //System.out.println(count);
        //字符串转成整型
        int currentpage = currentPage(curpage);
        // 创建page对象
        Page page = new Page(count, currentpage, 3); //总数   页面号  页面条数
		
        
        List<LineManage> lineManage  =new LineManageDao().findLineByDynamic(stationName,trainCode,page);
        request.setAttribute("stationName",stationName );
        request.setAttribute("trainCode",trainCode );
        request.setAttribute("aa", "2");
        request.setAttribute("page", page);
		
		
        request.setAttribute("lineManage",lineManage );
        request.getRequestDispatcher("/Admin/LineManageQuery.jsp").forward(request, response);
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("param");
		//System.out.println(param);
		String cids[] = param.split(":");
		int[] intTemp = new int[cids.length];
		for(int i = 0;i<cids.length;i++) {
			intTemp[i]= Integer.parseInt(cids[i]);
		}
		Boolean res = new LineManageDao().delete(intTemp);
		//System.out.println(res);
		request.getRequestDispatcher("/LineManageServlet?method=findAll").forward(request, response);
	}
	
	protected void lineinfoedit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lid=request.getParameter("lid");
		//System.out.println(sid);
		LineManage line = new LineManageDao().findLineByInfo(lid);
		request.setAttribute("line",line );
        request.getRequestDispatcher("/Admin/LineManageInfo_Amind_Edit.jsp").forward(request, response);
	}
	
	protected void changeLineInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lid=request.getParameter("lid");
		String trainCode=request.getParameter("trainCode");
		String stationName=request.getParameter("stationName");
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		String distance=request.getParameter("distance");
		String stayTime=request.getParameter("stayTime");
		String totalTime=request.getParameter("totalTime");
		String stationOrder=request.getParameter("stationOrder");
		
		LineManage line=new LineManage();
		line.setLid(Integer.parseInt(lid));
		line.setTrainCode(trainCode);
		line.setStationName(stationName);
		line.setStartTime(startTime);
		line.setEndTime(endTime);
		line.setDistance(distance);
		line.setStayTime(stayTime);
		line.setTotalTime(totalTime);
		line.setStationOrder(stationOrder);
		
		Boolean res = new LineManageDao().changeLineInfo(line);
		//System.out.println(res);
		if(res) {
			request.getRequestDispatcher("/LineManageServlet?method=findAll").forward(request, response);
		}
	}
	
	protected void addLine(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lid=request.getParameter("lid");
		String trainCode=request.getParameter("trainCode");
		String stationName=request.getParameter("stationName");
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		String distance=request.getParameter("distance");
		String stayTime=request.getParameter("stayTime");
		String totalTime=request.getParameter("totalTime");
		String stationOrder=request.getParameter("stationOrder");
		
		LineManage line=new LineManage();
		line.setLid(Integer.parseInt(lid));
		line.setTrainCode(trainCode);
		line.setStationName(stationName);
		line.setStartTime(startTime);
		line.setEndTime(endTime);
		line.setDistance(distance);
		line.setStayTime(stayTime);
		line.setTotalTime(totalTime);
		line.setStationOrder(stationOrder);
		
		Boolean res = new LineManageDao().addLineInfo(line);
		//System.out.println(res);
		if(res) {
			response.getWriter().write("true");
			//request.getRequestDispatcher("/LineManageServlet?method=findAll").forward(request, response);
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
	
	protected void findlid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lid = request.getParameter("lid");
		Boolean res = new LineManageDao().findtrainid(lid);
		if(res) {
			//System.out.println("成功");
			response.getWriter().write("true");
		}else {
			response.getWriter().write("false");;
		}
	}
}
