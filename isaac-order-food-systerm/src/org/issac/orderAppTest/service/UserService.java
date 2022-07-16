package org.issac.orderAppTest.service;

import org.issac.orderTest.bean.User;

public interface UserService {

	User findByLoginNameAndPass(String loginname, String password);

	User findByLoginName(String loginName);

	void save(User user);

}
