package action;

import java.util.ArrayList;

import model.record.PayRecord;
import service.PayRecordService;

@SuppressWarnings("serial")
public class ViewPay extends BaseAction {
	private String v_id;
	private PayRecordService payRecordService;

	public PayRecordService getPayRecordService() {
		return payRecordService;
	}

	public void setPayRecordService(PayRecordService payRecordService) {
		this.payRecordService = payRecordService;
	}

	public String execute() throws Exception {
		int vip_id = Integer.parseInt(v_id);
		ArrayList<PayRecord> recordList = payRecordService.getPayRecord(vip_id);
		if (recordList == null || recordList.size() == 0) {
			return "failure";
		} else {
			request.setAttribute("recordList", recordList);
			return "success";
		}
	}

	public String getV_id() {
		return v_id;
	}

	public void setV_id(String v_id) {
		this.v_id = v_id;
	}
}
