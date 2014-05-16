package dao;

import java.util.ArrayList;

import model.record.PayRecord;

public interface PayRecordDAO {
	public ArrayList<PayRecord> getPayRecord(int v_id);
}
