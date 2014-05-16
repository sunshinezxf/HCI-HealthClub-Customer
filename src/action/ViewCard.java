package action;

import java.util.ArrayList;

import model.VIP;
import model.card.VIPCard;
import service.VIPService;

@SuppressWarnings("serial")
public class ViewCard extends BaseAction {
	String v_id;
	private VIPService vipService;
	private VIP vip;

	public VIP getVip() {
		return vip;
	}

	public void setVip(VIP vip) {
		this.vip = vip;
	}

	public VIPService getVIPService() {
		return vipService;
	}

	public void setVIPService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {
		int id = Integer.parseInt(v_id);
		ArrayList<VIPCard> cardList = vipService.viewCard(id);
		vip = vipService.checkVIP("v_id", v_id);
		vip.setCardList(cardList);
		session.put("vip", vip);
		return "success";
	}

	public String getV_id() {
		return v_id;
	}

	public void setV_id(String v_id) {
		this.v_id = v_id;
	}
}
