package org.issac.orderSys.dao;

import org.issac.orderTest.bean.Order;
import org.issac.orderTest.bean.OrderDetail;
import org.issac.orderTest.bean.User;

import java.util.List;


public interface OrderDao {

	List<Order> find(User user, String orderCode, String orderDate, String dinnerTableId);

	Order findById(int id);

	void update(Order order);

	List<OrderDetail> findByOrderId(Integer id);

}
