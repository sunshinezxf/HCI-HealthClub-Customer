package action;

import model.VIP;
import service.VIPService;

@SuppressWarnings("serial")
public class RequestModifyPrivacy extends BaseAction {
	private String v_id;
	private VIPService vipService;

	public VIPService getVipService() {
		return vipService;
	}

	public void setVIPService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {
		VIP vip = vipService.checkVIP("v_id", v_id);
		request.setAttribute("vip", vip);
		return "success";
	}

	public String getV_id() {
		return v_id;
	}

	public void setV_id(String v_id) {
		this.v_id = v_id;
	}
}
