package org.issac.orderAppTest.service;

import java.util.List;

import org.issac.orderTest.bean.Food;

public interface FoodService {

	List<Food> findByFoodTypeId(Integer foodTypeId);

	Food findById(Integer foodId);

}
