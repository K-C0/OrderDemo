package org.wdl.hotelAppTest.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.wdl.hotelAppTest.service.DinnerTableService;
import org.wdl.hotelAppTest.service.DinnerTableServiceImpl;
import org.wdl.hotelTest.bean.DinnerTable;
import org.wdl.hotelTest.bean.User;
import org.wdl.hotelTest.util.ConstantUtil;

/**
 * Servlet implementation class DinnerTableServlet
 */
@WebServlet("/app/dinnerTable.action")
public class DinnerTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DinnerTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 占座
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dinnerTableId = request.getParameter("dinnerTableId");
		String tableStatus = request.getParameter("tableStatus");
		User user =(User) request.getSession().getAttribute(ConstantUtil.SESSION_NAME);
		
		
		//①通过餐桌的id查询餐桌
		DinnerTableService dinnerTableService = new DinnerTableServiceImpl();
		DinnerTable  dinnerTable = dinnerTableService.findById(Integer.parseInt(dinnerTableId));
		dinnerTable.setTableStatus(Integer.parseInt(tableStatus));
		dinnerTable.setUseUserId(user.getId());
		
		//② 更改数据库，通过传入对象更改
		dinnerTableService.update(dinnerTable);
		response.sendRedirect(getServletContext().getContextPath()+"/app/menu.action?id="+dinnerTableId);
		
	}

}
