package org.issac.orderSys.service;

import org.issac.orderTest.bean.Order;
import org.issac.orderTest.bean.User;

import java.util.List;


public interface OrderService {

	List<Order> find(User user, String orderCode, String orderDate, String dinnerTableId);

	Order findById(int id);

	void update(Order order);

}
