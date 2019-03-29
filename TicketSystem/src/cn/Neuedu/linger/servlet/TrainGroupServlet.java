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
import cn.Neuedu.linger.dao.TrainGroupDao;
import cn.Neuedu.linger.domain.Station;
import cn.Neuedu.linger.domain.Train;
import cn.Neuedu.linger.domain.TrainGroup;
import cn.Neuedu.linger.util.Page;

/**
 * Servlet implementation class TrainGroupServlet
 */
@WebServlet("/TrainGroupServlet")
public class TrainGroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public TrainGroupServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method=request.getParameter("method");
		//System.out.println(method);
		if("findAll".equals(method)){
			findAll(request,response);
		}else if("findTrainGroupByDynamic".equals(method)) {
			findTrainGroupByDynamic(request,response);
		}else if("delete".equals(method)) {
			delete(request,response);
		}else if("traingroupinfoedit".equals(method)) {
			traingroupinfoedit(request,response);
		}else if("changeTrainGroupInfo".equals(method)) {
			changeTrainGroupInfo(request,response);
		}else if("addTrainGroup".equals(method)) {
			addTrainGroup(request,response);
		}else if("findgid".equals(method)) {
			findgid(request,response);
		}
	    
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取当前页
        String curpage = request.getParameter("curpage");
        // 获取总数量
        int count = new TrainGroupDao().getAmount();
        //字符串转成整型
        int currentpage = currentPage(curpage);
        // 创建page对象
        Page page = new Page(count, currentpage, 3); //总数   页面号  页面条数
        // 获取当前页的数据
        List<TrainGroup> trainGroupList=new TrainGroupDao().findAll(page);
        //将相关数据存储起来
        request.setAttribute("page", page);
        request.setAttribute("aa", "1");
        
        request.setAttribute("trainGroupList",trainGroupList );
        request.getRequestDispatcher("/Admin/TrainGroupManageQuery.jsp").forward(request, response);
	}
	
	protected void findTrainGroupByDynamic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  gCode=request.getParameter("gCode").trim();
		
		// 获取当前页
        String curpage = request.getParameter("curpage");
        // 获取总数量
        int count = new TrainGroupDao().getAmountTrain(gCode);
        System.out.println(count);
        //字符串转成整型
        int currentpage = currentPage(curpage);
        // 创建page对象
        Page page = new Page(count, currentpage, 3); //总数   页面号  页面条数
		
        List<TrainGroup> trainGroupList=new TrainGroupDao().findTrainGroupByDynamic(gCode,page);
        request.setAttribute("gCode",gCode );
        request.setAttribute("aa", "2");
        request.setAttribute("page", page);
		
		
        request.setAttribute("trainGroupList",trainGroupList );
        request.getRequestDispatcher("/Admin/TrainGroupManageQuery.jsp").forward(request, response);
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("param");
		//System.out.println(param);
		String cids[] = param.split(":");
		int[] intTemp = new int[cids.length];
		for(int i = 0;i<cids.length;i++) {
			intTemp[i]= Integer.parseInt(cids[i]);
		}
		Boolean res = new TrainGroupDao().delete(intTemp);
		//System.out.println(res);
		if(res) {
			request.getRequestDispatcher("/TrainGroupServlet?method=findAll").forward(request, response);
		}
		
	}
	
	protected void traingroupinfoedit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gid=request.getParameter("gid");
		//System.out.println(sid);
		TrainGroup trainGroup = new TrainGroupDao().traingroupinfoedit(gid);
		request.setAttribute("trainGroup1",trainGroup );
        request.getRequestDispatcher("/Admin/TrainGroupManageInfo_Amind_Edit.jsp").forward(request, response);
	}
	
	protected void changeTrainGroupInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gid=request.getParameter("gid");
		String gCode=request.getParameter("gCode");
		String gBox=request.getParameter("gBox");
		String gboxType=request.getParameter("gboxType");
		String gchairNum=request.getParameter("gchairNum");
		String gchairType=request.getParameter("gchairType");
		//System.out.println(trainid);
		TrainGroup train = new TrainGroup();
		train.setGid(Integer.parseInt(gid));
		train.setgCode(gCode);
		train.setgBox(gBox);
		train.setGboxType(gboxType);
		train.setGchairNum(gchairNum);
		train.setGchairType(gchairType);
		
		Boolean res = new TrainGroupDao().changeTrainGroupInfo(train);
		//System.out.println(res);
		if(res) {
			request.getRequestDispatcher("/TrainGroupServlet?method=findAll").forward(request, response);
		}
	}
	protected void addTrainGroup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gid=request.getParameter("gid");
		String gCode=request.getParameter("gCode");
		String gBox=request.getParameter("gBox");
		String gboxType=request.getParameter("gboxType");
		String gchairNum=request.getParameter("gchairNum");
		String gchairType=request.getParameter("gchairType");
		//System.out.println(trainid);
		TrainGroup train = new TrainGroup();
		train.setGid(Integer.parseInt(gid));
		train.setgCode(gCode);
		train.setgBox(gBox);
		train.setGboxType(gboxType);
		train.setGchairNum(gchairNum);
		train.setGchairType(gchairType);

		// System.out.println(train.toString());
		Boolean res = new TrainGroupDao().addTrainGroup(train);
		// System.out.println(res);
		if (res) {
			response.getWriter().write("true");
			//request.getRequestDispatcher("/TrainGroupServlet?method=findAll").forward(request, response);
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
	protected void findgid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gid = request.getParameter("gid");
		Boolean res = new TrainGroupDao().findgid(gid);
		if(res) {
			//System.out.println("成功");
			response.getWriter().write("true");
		}else {
			response.getWriter().write("false");;
		}
	}
}
