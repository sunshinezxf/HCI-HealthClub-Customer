package dao.impl;

import dao.AutoPayDAO;
import dao.BaseDAO;

public class AutoPayDAOImpl implements AutoPayDAO{
	private BaseDAO baseDAO;
	
	public BaseDAO getBaseDAO() {
		return baseDAO;
	}
	
	public void setBaseDAO(BaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}
	
	public void autopay(){
		
	}
}
