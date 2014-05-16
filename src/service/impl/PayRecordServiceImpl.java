package service.impl;

import java.util.ArrayList;

import model.record.PayRecord;
import dao.PayRecordDAO;
import service.PayRecordService;

public class PayRecordServiceImpl implements PayRecordService {
	private PayRecordDAO payRecordDAO;

	public PayRecordDAO getPayRecordDAO() {
		return payRecordDAO;
	}

	public void setPayRecordDAO(PayRecordDAO payRecordDAO) {
		this.payRecordDAO = payRecordDAO;
	}

	public ArrayList<PayRecord> getPayRecord(int v_id) {
		return payRecordDAO.getPayRecord(v_id);
	}
}
