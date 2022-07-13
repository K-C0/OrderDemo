package org.wdl.hotelAppTest.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.wdl.hotelAppTest.service.DinnerTableService;
import org.wdl.hotelAppTest.service.DinnerTableServiceImpl;
import org.wdl.hotelAppTest.service.FoodService;
import org.wdl.hotelAppTest.service.FoodServiceImpl;
import org.wdl.hotelAppTest.service.FoodTypeService;
import org.wdl.hotelAppTest.service.FoodTypeServiceImpl;
import org.wdl.hotelAppTest.service.OrderService;
import org.wdl.hotelAppTest.service.OrderServiceImpl;
import org.wdl.hotelTest.bean.DinnerTable;
import org.wdl.hotelTest.bean.Food;
import org.wdl.hotelTest.bean.FoodType;
import org.wdl.hotelTest.bean.Order;
import org.wdl.hotelTest.bean.User;
import org.wdl.hotelTest.util.ConstantUtil;


/**
 * Servlet implementation class MenuListServlet
 */
@WebServlet("/app/menu.action")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("=======menu.action================");
		String foodTypeId = request.getParameter("foodTypeId");
		//��ȡ������id ͨ��request.getParameter��ʽ��ȡ�Ĳ���ֵ����String����
		String id = request.getParameter("id");
		System.out.println("id:"+id);
		
		
		//�� ͨ��������id��ѯ����
		DinnerTableService dinnerTableService = new DinnerTableServiceImpl();
		DinnerTable dinnerTable = dinnerTableService.findById(Integer.parseInt(id));
		System.out.println("dinnerTable:"+dinnerTable);
		request.setAttribute("dinnerTable", dinnerTable);
		
		
		FoodTypeService foodTypeService = new FoodTypeServiceImpl();
		//�� ��ѯ����δɾ���Ĳ�ϵ����
		List<FoodType> foodTypes= foodTypeService.findAll();
		System.out.println("foodTypes:"+foodTypes);
		
		if(foodTypeId == null || foodTypeId.equals("")) {
			//�� Ĭ�ϲ�ѯ���в�ϵ�е�һ��δɾ����ϵ�Ĳ�Ʒ
			Integer  foodTypeIdInt = foodTypes.get(0).getId();
			foodTypeId = Integer.toString(foodTypeIdInt);
		}
		
		FoodService foodService = new FoodServiceImpl();
		List<Food> foods = foodService.findByFoodTypeId(Integer.parseInt(foodTypeId));
		System.out.println("foods:"+foods);
		request.setAttribute("foodTypes", foodTypes);
		request.setAttribute("foods", foods);
		
		System.out.println("dinnerTable.getTableStatus().equals(\"1\"):"+Objects.equals(dinnerTable.getTableStatus(), 1));
		User user =(User) request.getSession().getAttribute(ConstantUtil.SESSION_NAME);
		if(Objects.equals(dinnerTable.getTableStatus(), 0)) {
			//����δʹ��
			request.getRequestDispatcher("/WEB-INF/jsp/app/menu.jsp").forward(request, response);
			
		}else if(Objects.equals(dinnerTable.getTableStatus(), 1)  &&  Objects.equals(user.getId(),dinnerTable.getUseUserId())  ){
			//��������ʹ��,��ʹ�����ǵ�ǰ�û�
			//�жϸò����Ƿ���δ����Ķ�������������ת����������ҳ��ȥ�����û������ת�������ĵ��ҳ��
			OrderService orderService = new OrderServiceImpl();
			List<Order>  orders= orderService.findByTableId(Integer.parseInt(id),null);
			System.out.println("orders:"+orders);
			if(orders != null && orders.size() >0) {
				//��ת����������ҳ��
				request.setAttribute("orders", orders);
				request.getRequestDispatcher("/WEB-INF/jsp/app/orderItem.jsp").forward(request, response);
			}else {
				//�� ��߲����Ĺ��ﳵչʾ 
				HttpSession  session = request.getSession();
				//ͨ��������id��ȡ�乺�ﳵ��   ���ﳵ  keyΪ��Ʒid  valueΪ��������
				Map<Integer, Integer> shopCar= (Map<Integer, Integer>) session.getAttribute(id);
				List<Food>  foods2 = new ArrayList<>();
				//���㹺�ﳵ����Ʒ�ܽ��
				Double total = 0.00;
				if(shopCar != null) {
					//�õ���ǰ�������ﳵ�����еĲ�Ʒid
					Set<Integer> foodIds = shopCar.keySet();
					for (Integer foodId : foodIds) {
						//ͨ����Ʒ��id��ѯ��Ʒ
						Food food = foodService.findById(foodId);
						System.out.println("ͨ��id��ѯfood:"+food);
						//ͨ�����ﳵ��key��ȡvalue������������
						Integer buyNum = shopCar.get(foodId);
						food.setBuyNum(buyNum);
						foods2.add(food);
						
						//��ǰ��Ʒ������Ҫ�ļ۸�
						Double price = food.getBuyNum()*food.getPrice()*food.getDiscount();
						total = total+price;
					}
				}
			
			
				request.setAttribute("foods2", foods2);
				request.setAttribute("total", total);
				//response.sendRedirect���������Ͽ�����ת����������һ��servlet��jsp�л�ȡ������request�е�����
				//response.sendRedirect("/WEB-INF/jsp/app/menu.jsp");
				request.getRequestDispatcher("/WEB-INF/jsp/app/menu.jsp").forward(request, response);
			}
			
		}else if(Objects.equals(dinnerTable.getTableStatus(), 1)  &&  user.getId()!=dinnerTable.getUseUserId() ){
			//��������ʹ��,��ʹ���˲��ǵ�ǰ�û�
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter  printWriter = response.getWriter();
			printWriter.println("<script type=\"text/javascript\"> alert(\"��ǰ��������ʹ�ã�\");  window.location.href = \""+request.getServletContext().getContextPath()+"/app/index.do\"; </script>");
			printWriter.flush();
   }
		
	}

}
