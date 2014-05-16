package service;

import java.util.ArrayList;

import model.record.PayRecord;

public interface PayRecordService {
	public ArrayList<PayRecord> getPayRecord(int v_id);
}
