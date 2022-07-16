package org.issac.orderSys.dao;

import org.issac.orderTest.bean.OrderDetail;

import java.sql.Connection;

public interface OrderDetailDao {

	OrderDetail findById(int id);

	void update(OrderDetail orderDetail, Connection connection);

	void addFoods(String[] arrfoodIds, Integer orderId);


}
