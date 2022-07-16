package org.issac.orderAppTest.servlet;

import org.issac.orderAppTest.service.DinnerTableService;
import org.issac.orderAppTest.service.DinnerTableServiceImpl;
import org.issac.orderTest.bean.DinnerTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/app/index.do")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("==========index.do===============");
		
		request.setCharacterEncoding("utf-8");
		//ͨ����ǩ��name����ֵ��ȡǰ�˴��ݹ����Ĳ���
		String  method = request.getParameter("method");
		String  tableName = request.getParameter("tableName");
		String  tableStatus = request.getParameter("tableStatus");
		System.out.println("method:"+method+"����tableName��"+tableName+"    tableStatus:"+tableStatus);
		
		//��ѯδʹ�õĲ���
		DinnerTableService dinnerTableService = new DinnerTableServiceImpl();
		List<DinnerTable> dinnerTables= null;
		if(method != null  && !method.equals("") && method.equals("submitTable")) {
			//������ͨ������鿴������ť����ѯ
			 dinnerTables= dinnerTableService.findDinnerTables(tableStatus,tableName);
		}else {
			//��Ŀһ���оͲ鿴δʹ�õĲ���
			//δʹ�õĲ���
			tableStatus = "0";
			dinnerTables= dinnerTableService.findDinnerTables(tableStatus,null);
		}
		System.out.println("dinnerTables:"+dinnerTables);
		request.setAttribute("tableStatus", tableStatus);
		request.setAttribute("dinnerTables", dinnerTables);
		//������û�жϿ�����ת��������һ��servlet����jsp�л�ȡ������request�е�����
		request.getRequestDispatcher("/WEB-INF/jsp/app/index.jsp").forward(request, response);
	}

}
