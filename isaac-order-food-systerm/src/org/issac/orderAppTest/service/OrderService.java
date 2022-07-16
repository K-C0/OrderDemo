package org.issac.orderAppTest.service;

import java.util.List;
import java.util.Map;

import org.issac.orderTest.bean.Order;

public interface OrderService {

	void order(int dinnerTableId, Map<Integer, Integer> shopCar, String total, Integer userId);

	List<Order> findByTableId(int dinnerTableId, Integer userId);

	Order findById(int id);

	void pay(Order order);

	void deleteOrder(Order order);

	List<Order> findAll(Integer userId);

}
