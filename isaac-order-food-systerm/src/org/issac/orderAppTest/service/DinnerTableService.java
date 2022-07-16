package org.issac.orderAppTest.service;

import org.issac.orderTest.bean.DinnerTable;

import java.util.List;

public interface DinnerTableService {


	List<DinnerTable> findDinnerTables(String parseInt, String tableName);

	DinnerTable findById(int id);

	void update(DinnerTable dinnerTable);

}
