package org.issac.orderSys.service;

import org.issac.orderSys.dao.FoodDao;
import org.issac.orderSys.dao.FoodDaoImpl;
import org.issac.orderTest.bean.Food;

import java.util.List;

public class FoodServiceImpl implements FoodService {

	private FoodDao foodDao = new FoodDaoImpl();
	@Override
	public List<Food> find(String keyword, String foodTypeId) {
		return foodDao.find(keyword,foodTypeId);
	}
	@Override
	public Food findById(int id) {
		return foodDao.findById(id);
	}
	@Override
	public void update(Food food) {
		foodDao.update(food);
	}
	@Override
	public Food findByFoodName(String foodName) {
		return foodDao.findByFoodName(foodName);
	}
	@Override
	public void save(Food food) {
		foodDao.save(food);
	}

}
