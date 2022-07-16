package org.issac.orderSys.service;

import org.issac.orderTest.bean.DinnerTable;

import java.util.List;


public interface DinnerTableService {

	List<DinnerTable> find(String keyword, String tableStatus, String disabled);

	DinnerTable findById(int id);

	void update(DinnerTable dinnerTable);

	DinnerTable findByTableName(String tableName);

	void save(DinnerTable table);

}
