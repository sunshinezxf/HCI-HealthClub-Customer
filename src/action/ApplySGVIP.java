package action;

import model.card.CardType;
import model.card.SingleVIPCard;
import model.card.VIPCard;
import service.VIPService;
import util.IDGenerator;

@SuppressWarnings("serial")
public class ApplySGVIP extends BaseAction {
	private VIPService vipService;
	private String v_id;

	public VIPService getVIPService() {
		return vipService;
	}

	public void setVIPService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {
		String sg_id = IDGenerator.generateSGVIP();
		VIPCard card = new SingleVIPCard();
		card.setCode(sg_id);
		card.setType(CardType.SINGLE);
		card.setActivated(false);
		card.setPayed(false);
		card.setV_id(Integer.parseInt(v_id));
		boolean status = vipService.applySGCard(card);
		if (status) {
			request.setAttribute("card", card);
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
