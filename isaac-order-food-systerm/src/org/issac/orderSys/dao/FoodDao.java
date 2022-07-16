package org.issac.orderSys.dao;

import org.issac.orderTest.bean.Food;

import java.util.List;


public interface FoodDao {

	List<Food> find(String keyword, String foodTypeId);

	Food findById(int id);

	void update(Food food);

	Food findByFoodName(String foodName);

	void save(Food food);

}
