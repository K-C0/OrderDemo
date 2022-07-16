package org.issac.orderAppTest.service;

import org.issac.orderAppTest.dao.UserDao;
import org.issac.orderAppTest.dao.UserDaoImpl;
import org.issac.orderTest.bean.User;

public class UserServiceImpl implements UserService {
	private UserDao userDao = new UserDaoImpl();
	@Override
	public User findByLoginNameAndPass(String loginname, String password) {
		return userDao.findByLoginNameAndPass(loginname,password);
	}
	@Override
	public User findByLoginName(String loginName) {
		return userDao.findByLoginName(loginName);
	}
	@Override
	public void save(User user) {
		userDao.save(user);
	}

}
