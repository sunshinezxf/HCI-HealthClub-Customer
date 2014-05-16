package action;

import java.util.ArrayList;

import model.Activity;
import service.VIPService;

@SuppressWarnings("serial")
public class ViewActivity extends BaseAction {
	private String v_id;
	private VIPService vipService;

	public VIPService getVIPService() {
		return vipService;
	}

	public void setVIPService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {
		int vip_id = Integer.parseInt(v_id);
		ArrayList<Activity> activityList = vipService.checkReserved(vip_id);
		request.setAttribute("reserved", activityList);
		ArrayList<Activity> otherList = vipService.checkOther(vip_id);
		request.setAttribute("other", otherList);
		return "success";
	}

	public String getV_id() {
		return v_id;
	}

	public void setV_id(String v_id) {
		this.v_id = v_id;
	}
}
