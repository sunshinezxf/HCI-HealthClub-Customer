package action;

import service.CardService;

@SuppressWarnings("serial")
public class DeleteCard extends BaseAction {
	private String c_id;
	private CardService cardService;

	public CardService getCardService() {
		return cardService;
	}

	public void setCardService(CardService cardService) {
		this.cardService = cardService;
	}

	public String execute() throws Exception {
		int id = Integer.parseInt(c_id);
		boolean status = cardService.deleteCard(id);
		if (status) {
			request.setAttribute("prompt",
					"Congratulation! You succeed to drop one of your vip card!");
			return "success";
		} else {
			request.setAttribute("prompt", "Sorry, something's wrong during your operation.");
			return "failure";
		}
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
}
