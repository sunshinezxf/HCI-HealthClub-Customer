package model.card;

public abstract class VIPCard {
	private int c_id;
	private String code;
	private String token;
	private CardType type;
	private boolean activated;
	private boolean payed;
	protected double activatePrice;
	protected double rent;
	private int v_id;

	public VIPCard() {
		code = "";
		activatePrice = 0;
		rent = 0;
		token = "000000";
		type = null;
		activated = false;
		payed = false;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public int getC_id() {
		return c_id;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public void setActivatePrice(double activatePrice) {
		this.activatePrice = activatePrice;
	}

	public double getActivatePrice() {
		return activatePrice;
	}

	public void setRent(double rent) {
		this.rent = rent;
	}

	public double getRent() {
		return rent;
	}

	public abstract double calculatePrice();

	public void setToken(String token) {
		this.token = token;
	}

	public String getToken() {
		return token;
	}

	public void setType(CardType type) {
		this.type = type;
	}

	public CardType getType() {
		return type;
	}

	public void setActivated(boolean activated) {
		this.activated = activated;
	}

	public boolean getActivated() {
		return activated;
	}

	public void setPayed(boolean payed) {
		this.payed = payed;
	}

	public boolean getPayed() {
		return payed;
	}

	public void setV_id(int v_id) {
		this.v_id = v_id;
	}

	public int getV_id() {
		return v_id;
	}

	public boolean activate(double money) {
		if (money >= activatePrice)
			activated = true;
		else
			activated = false;
		return activated;
	}

	public boolean pay(double money) {
		if (money >= rent)
			payed = true;
		else
			payed = false;
		return payed;
	}

	public CardType distinguishCardType() {
		if (code.startsWith("SG"))
			return CardType.SINGLE;
		if (code.startsWith("HM"))
			return CardType.HOME;
		return null;
	}
}
