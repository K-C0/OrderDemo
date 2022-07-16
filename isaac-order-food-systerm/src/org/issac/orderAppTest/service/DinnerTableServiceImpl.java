package org.issac.orderAppTest.service;

import org.issac.orderAppTest.dao.DinnerTableDao;
import org.issac.orderAppTest.dao.DinnerTableDaoImpl;
import org.issac.orderTest.bean.DinnerTable;

import java.util.List;

public class DinnerTableServiceImpl implements DinnerTableService {

	private DinnerTableDao dinnerTableDao = new DinnerTableDaoImpl();
	@Override
	public List<DinnerTable> findDinnerTables(String tableStatus, String tableName) {
		return dinnerTableDao.findDinnerTables(tableStatus,tableName);
	}
	@Override
	public DinnerTable findById(int id) {
		return dinnerTableDao.findById(id);
	}
	@Override
	public void update(DinnerTable dinnerTable) {
		dinnerTableDao.update(dinnerTable);
	}	
}
