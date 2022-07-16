package org.issac.orderSys.dao;

import org.issac.orderTest.bean.FoodType;

import java.util.List;


public interface FoodTypeDao {

	List<FoodType> find(String keyword, String disabled);

	FoodType findByFoodName(String foodTypeName);

	void save(FoodType foodType2);

	FoodType findById(int id);

	void update(FoodType foodType2);

}
