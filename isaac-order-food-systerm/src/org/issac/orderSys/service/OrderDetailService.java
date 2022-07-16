package org.issac.orderSys.service;

import org.issac.orderTest.bean.OrderDetail;

public interface OrderDetailService {

	OrderDetail findById(int id);

	void update(OrderDetail orderDetail, Integer flag);

	void addFoods(String[] arrfoodIds, Integer orderId);


}
