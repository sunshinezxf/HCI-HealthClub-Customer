package action;

import service.VIPService;

@SuppressWarnings("serial")
public class CancelActivity extends BaseAction {
	private String v_id;
	private String ac_id;
	private VIPService vipService;

	public VIPService getVIPService() {
		return vipService;
	}

	public void setVIPService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {
		int activity_id = Integer.parseInt(ac_id);
		int vip_id = Integer.parseInt(v_id);
		boolean status = vipService.cancelActivity(activity_id, vip_id);
		if (status) {
			request.setAttribute("prompt",
					"Congratulation! You succeed to cancel the activity.");
			return "success";
		} else {
			request.setAttribute("prompt",
					"Sorry, something's wrong during the operation.");
			return "failure";
		}
	}

	public String getV_id() {
		return v_id;
	}

	public void setV_id(String v_id) {
		this.v_id = v_id;
	}

	public String getAc_id() {
		return ac_id;
	}

	public void setAc_id(String ac_id) {
		this.ac_id = ac_id;
	}
}
