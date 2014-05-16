package action;

import service.CardService;

@SuppressWarnings("serial")
public class PayCard extends BaseAction {
	private String v_id;
	private String c_id;
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
		boolean status = cardService.pay(card_id, vip_id);
		if (status) {
			request.setAttribute("prompt",
					"Congratulation! You succeed to pay the rent!");
			return "success";
		} else {
			request.setAttribute("prompt",
					"Sorry, something's wrong during your operation.");
			return "failure";
		}
	}

	public String getV_id() {
		return v_id;
	}

	public void setV_id(String v_id) {
		this.v_id = v_id;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
}
