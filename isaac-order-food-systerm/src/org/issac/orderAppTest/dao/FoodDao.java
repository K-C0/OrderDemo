package org.issac.orderAppTest.dao;

import java.util.List;

import org.issac.orderTest.bean.Food;

public interface FoodDao {

	List<Food> findByFoodTypeId(Integer foodTypeId);

	Food findById(Integer foodId);

}
