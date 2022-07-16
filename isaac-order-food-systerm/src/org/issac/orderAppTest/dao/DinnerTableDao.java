package org.issac.orderAppTest.dao;

import org.issac.orderTest.bean.DinnerTable;

import java.util.List;

public interface DinnerTableDao {

	List<DinnerTable> findDinnerTables(String tableStatus, String tableName);

	DinnerTable findById(int id);

	void update(DinnerTable dinnerTable);

}
