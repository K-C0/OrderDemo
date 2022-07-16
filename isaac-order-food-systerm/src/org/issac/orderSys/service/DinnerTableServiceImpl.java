package org.issac.orderSys.service;

import org.issac.orderSys.dao.DinnerTableDao;
import org.issac.orderSys.dao.DinnerTableDaoImpl;
import org.issac.orderTest.bean.DinnerTable;

import java.util.List;

public class DinnerTableServiceImpl implements DinnerTableService {

	private DinnerTableDao dinnerTableDao = new DinnerTableDaoImpl();
	@Override
	public List<DinnerTable> find(String keyword, String tableStatus, String disabled) {
		return dinnerTableDao.find(keyword,tableStatus,disabled);
	}
	@Override
	public DinnerTable findById(int id) {
		return dinnerTableDao.findById(id);
	}
	@Override
	public void update(DinnerTable dinnerTable) {
		dinnerTableDao.update(dinnerTable);
	}
	@Override
	public DinnerTable findByTableName(String tableName) {
		return dinnerTableDao.findByTableName(tableName);
	}
	@Override
	public void save(DinnerTable table) {
		dinnerTableDao.save(table);
	}

}
