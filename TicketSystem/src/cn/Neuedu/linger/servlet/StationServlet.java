package cn.Neuedu.linger.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.Neuedu.linger.dao.AdminDao;
import cn.Neuedu.linger.dao.StationDao;
import cn.Neuedu.linger.domain.Station;
import cn.Neuedu.linger.domain.User;
import cn.Neuedu.linger.util.Page;

@WebServlet("/StationServlet")
public class StationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method=request.getParameter("method");
		//System.out.println(method);
		if("findAll".equals(method)){
			findAll(request,response);
		}else if("findStationByDynamic".equals(method)) {
			findStationByDynamic(request,response);
		}else if("delete".equals(method)) {
			delete(request,response);
		}else if("stationinfoedit".equals(method)) {
			stationinfoedit(request,response);
		}else if("changeStationInfo".equals(method)) {
			changeStationInfo(request,response);
		}else if("addStation".equals(method)) {
			addStation(request,response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取当前页
        String curpage = request.getParameter("curpage");
        // 获取总数量
        int count = new StationDao().getAmount();
        //字符串转成整型
        int currentpage = currentPage(curpage);
        // 创建page对象
        Page page = new Page(count, currentpage, 3); //总数   页面号  页面条数
        // 获取当前页的数据
        //List<User> users = userService.getUserInfo(page);
        List<Station> stationList=new StationDao().findAll(page);
        //将相关数据存储起来
        request.setAttribute("page", page);
        request.setAttribute("stationList", stationList);
        request.setAttribute("aa", "1");
        request.getRequestDispatcher("/Admin/StationManageQuery.jsp").forward(request, response);
        
		/*List<Station> stationList=new StationDao().findAll();
        request.setAttribute("stationList",stationList );
        request.getRequestDispatcher("/Admin/StationManageQuery.jsp").forward(request, response);*/
	}
	
	protected void findStationByDynamic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String stationName=request.getParameter("stationName").trim();
		String stationEnglish=request.getParameter("stationEnglish").trim();
		String belongTo= request.getParameter("belongTo").trim();
		//System.out.println(sex);
		//System.out.println(cardType);
		//System.out.println(lvkeType);
		Station station=new Station();
		station.setStationName(stationName);
	    station.setStationEnglish(stationEnglish);
		station.setBelongTo(belongTo);

		// 获取当前页
        String curpage = request.getParameter("curpage");
        // 获取总数量
        int count = new StationDao().getAmountstation(station);
        System.out.println(count);
        //字符串转成整型
        int currentpage = currentPage(curpage);
        // 创建page对象
        Page page = new Page(count, currentpage, 3); //总数   页面号  页面条数
		
        List<Station> stationList=new StationDao().findStationByDynamic(station,page);
        request.setAttribute("stationList",stationList );
        request.setAttribute("station12",station );
        request.setAttribute("aa", "2");
        request.setAttribute("page", page);
        request.getRequestDispatcher("/Admin/StationManageQuery.jsp").forward(request, response);
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("param");
		//System.out.println(param);
		String cids[] = param.split(":");
		int[] intTemp = new int[cids.length];
		for(int i = 0;i<cids.length;i++) {
			intTemp[i]= Integer.parseInt(cids[i]);
		}
		Boolean res = new StationDao().delete(intTemp);
		//System.out.println(res);
		request.getRequestDispatcher("/StationServlet?method=findAll").forward(request, response);
	}
	
	protected void stationinfoedit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sid=request.getParameter("sid");
		//System.out.println(sid);
		Station stationList = new StationDao().findStationByInfo(sid);
		request.setAttribute("stationList12",stationList );
        request.getRequestDispatcher("/Admin/StationManageInfo_Amind_Edit.jsp").forward(request, response);
	}
	
	protected void changeStationInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stationName=request.getParameter("stationName");
		String stationEnglish=request.getParameter("stationEnglish");
		String belongTo= request.getParameter("belongTo");
		String stationRank=request.getParameter("stationRank");
		String administrativeArea=request.getParameter("administrativeArea");
		String address= request.getParameter("address");
		String sid= request.getParameter("sid");
		
		Station station = new Station();
		station.setSid(Integer.parseInt(sid));
		station.setStationName(stationName);
		station.setStationEnglish(stationEnglish);
		station.setBelongTo(belongTo);
		station.setStationRank(stationRank);
		station.setAdministrativeArea(administrativeArea);
		station.setAddress(address);
		//System.out.println(station.toString());
		Boolean res = new StationDao().changeStationInfo(station);
		if(res) {
			//System.out.println("chenggong");
			request.getRequestDispatcher("/StationServlet?method=findAll").forward(request, response);
		}	
	}
	
	protected void addStation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stationName=request.getParameter("stationName");
		String stationEnglish=request.getParameter("stationEnglish");
		String belongTo= request.getParameter("belongTo");
		String stationRank=request.getParameter("stationRank");
		String administrativeArea=request.getParameter("administrativeArea");
		String address= request.getParameter("address");
		
		Station station = new Station();
		station.setStationName(stationName);
		station.setStationEnglish(stationEnglish);
		station.setBelongTo(belongTo);
		station.setStationRank(stationRank);
		station.setAdministrativeArea(administrativeArea);
		station.setAddress(address);
		//System.out.println(station.toString());
		Boolean res = new StationDao().addStationInfo(station);
		//System.out.println(res);
		if(res) {
			response.getWriter().write("true");
			//request.getRequestDispatcher("/StationServlet?method=findAll").forward(request, response);
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
	
}
