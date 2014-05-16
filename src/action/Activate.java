package action;

import service.CardService;

/**
 * @author zhang xu fan
 * @version 1.0
 * @see this action is called by customer to activate their card
 */

@SuppressWarnings("serial")
public class Activate extends BaseAction {
	private String c_id;
	private String v_id;
	private CardService cardService;

	public CardService getCardService() {
		return cardService;
	}

	public void setCardService(CardService cardService) {
		this.cardService = cardService;
	}

	public String execute() throws Exception {
		int card_id = Integer.parseInt(c_id);
		int vip_id = Integer.parseInt(v_id);
		boolean activated = cardService.activate(card_id, vip_id);
		if (activated) {
			request.setAttribute("prompt",
					"Congratulation! You succeed to activate your card!");
			return "success";
		} else {
			request.setAttribute("prompt",
					"Sorry, Something's wrong during the operation.");
			return "failure";
		}
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getV_id() {
		return v_id;
	}

	public void setV_id(String v_id) {
		this.v_id = v_id;
	}
}
