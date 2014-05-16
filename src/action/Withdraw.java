package action;

import service.VIPService;

@SuppressWarnings("serial")
public class Withdraw extends BaseAction {
	private String v_id;
	private VIPService vipService;

	public VIPService getVIPService() {
		return vipService;
	}

	public void setVIPService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {
		int id = Integer.parseInt(v_id);
		boolean status = vipService.withdrawVIP(id);
		if (status) {
			return "success";
		} else {
			return "failure";
		}
	}

	public String getV_id() {
		return v_id;
	}

	public void setV_id(String v_id) {
		this.v_id = v_id;
	}
}
