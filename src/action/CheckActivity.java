package action;

import service.VIPService;

@SuppressWarnings("serial")
public class CheckActivity extends BaseAction {
	private String a_id;
	private VIPService vipService;

	public VIPService getVIPService() {
		return vipService;
	}

	public void setVIPService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {
		return "failure";
	}

	public String getA_id() {
		return a_id;
	}

	public void SetA_id(String a_id) {
		this.a_id = a_id;
	}
}
