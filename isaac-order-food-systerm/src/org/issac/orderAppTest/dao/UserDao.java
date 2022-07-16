package org.issac.orderAppTest.dao;

import org.issac.orderTest.bean.User;

public interface UserDao {

	User findByLoginNameAndPass(String loginname, String password);

	User findByLoginName(String loginName);

	void save(User user);

}
