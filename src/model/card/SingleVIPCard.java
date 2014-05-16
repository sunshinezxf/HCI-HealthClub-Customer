package model.card;

import util.IDGenerator;

public class SingleVIPCard extends VIPCard {
	private final static double ACTIVATE = 75;
	private final static double RENT = 40;

	public SingleVIPCard() {
		super();
		setCode(IDGenerator.generateSGVIP());
		setType(CardType.SINGLE);
		setActivatePrice(ACTIVATE);
		setRent(RENT);
	}

	@Override
	public double calculatePrice() {
		return rent;
	}

}
