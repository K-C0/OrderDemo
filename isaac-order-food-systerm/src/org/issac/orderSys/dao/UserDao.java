package org.issac.orderSys.dao;

import org.issac.orderTest.bean.User;

import java.util.List;

public interface UserDao {

	User findByLoginNameAndPass(String loginname, String password);

	void save(User user);

	List<User> find(String sql);

	User findById(int id);

	void update(User user);

	User findByLoginName(String loginName);

}
