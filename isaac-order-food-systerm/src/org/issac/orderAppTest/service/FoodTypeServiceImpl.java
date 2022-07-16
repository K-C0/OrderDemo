package org.issac.orderAppTest.service;

import java.util.List;

import org.issac.orderAppTest.dao.FoodTypeDao;
import org.issac.orderAppTest.dao.FoodTypeDaoImpl;
import org.issac.orderTest.bean.FoodType;

public class FoodTypeServiceImpl implements FoodTypeService {

	private FoodTypeDao foodTypeDao = new FoodTypeDaoImpl();
	@Override
	public List<FoodType> findAll() {
		return foodTypeDao.findAll();
	}

}
