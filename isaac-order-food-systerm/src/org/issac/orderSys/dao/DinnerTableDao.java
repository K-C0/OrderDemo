package org.issac.orderSys.dao;

import org.issac.orderTest.bean.DinnerTable;

import java.util.List;


public interface DinnerTableDao {

	List<DinnerTable> find(String keyword, String tableStatus, String disabled);

	DinnerTable findById(int id);

	void update(DinnerTable dinnerTable);

	DinnerTable findByTableName(String tableName);

	void save(DinnerTable table);

}
