package action;

import model.VIP;
import service.VIPService;
import util.Prompt;

@SuppressWarnings("serial")
public class RequestWithdraw extends BaseAction {
	private String v_id;
	private VIPService vipService;

	public VIPService getVipService() {
		return vipService;
	}

	public void setVIPService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {
		int id = Integer.parseInt(v_id);
		VIP vip = vipService.checkVIP("v_id", id + "");
		if (vip != null) {
			request.setAttribute("vip", vip);
			return "success";
		} else {
			request.setAttribute("prompt", new Prompt(false,
					"This user has already been withdrawed."));
			return "false";
		}
	}

	public String getV_id() {
		return v_id;
	}

	public void setV_id(String v_id) {
		this.v_id = v_id;
	}
}
