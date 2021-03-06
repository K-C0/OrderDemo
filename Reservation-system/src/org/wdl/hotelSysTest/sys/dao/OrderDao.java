package org.wdl.hotelSysTest.sys.dao;

import java.util.List;

import org.wdl.hotelTest.bean.Order;
import org.wdl.hotelTest.bean.OrderDetail;
import org.wdl.hotelTest.bean.User;


public interface OrderDao {

	List<Order> find(User user, String orderCode, String orderDate, String dinnerTableId);

	Order findById(int id);

	void update(Order order);

	List<OrderDetail> findByOrderId(Integer id);

}
