package org.issac.orderSys.service;

import org.issac.orderTest.bean.User;

import java.util.List;

public interface UserService {

	User findByLoginNameAndPass(String loginname, String password);

	void save(User user);

	List<User> find(String searchType, String keyword, String disabled);

	User findById(int id);

	void update(User user);

	User findByLoginName(String loginName);

}
