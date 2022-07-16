package org.issac.orderSys.service;

import org.issac.orderTest.bean.Food;

import java.util.List;


public interface FoodService {

	List<Food> find(String keyword, String foodTypeId);

	Food findById(int id);

	void update(Food food);

	Food findByFoodName(String foodName);

	void save(Food food);

}
