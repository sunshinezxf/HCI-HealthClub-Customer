package model;

import java.util.ArrayList;

import model.card.VIPCard;
import model.record.ActivityRecord;
import model.record.PayRecord;
import util.manager.ActivityManager;
import util.manager.PayManager;

public class VIP {
	private int v_id;
	private ArrayList<VIPCard> cardList;
	private String username;
	private String name;
	private Gender gender;
	private Phone phone;
	private int age;
	private String address;
	private String password;
	private CreditCard creditCard;
	private ArrayList<ActivityRecord> activityRecord;

	public VIP() {
		creditCard = new CreditCard();
		cardList = new ArrayList<VIPCard>();
		activityRecord = new ArrayList<ActivityRecord>();
	}

	public int getV_id() {
		return v_id;
	}

	public void setV_id(int v_id) {
		this.v_id = v_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public Phone getPhone() {
		return phone;
	}

	public void setPhone(Phone phone) {
		this.phone = phone;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public CreditCard getCreditCard() {
		return creditCard;
	}

	public void setCreditCard(CreditCard creditCard) {
		this.creditCard = creditCard;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ArrayList<VIPCard> getCardList() {
		return cardList;
	}

	public void setCardList(ArrayList<VIPCard> cardList) {
		this.cardList = cardList;
	}

	public ArrayList<ActivityRecord> getActivityRecord() {
		return activityRecord;
	}

	public void setActivityRecord(ArrayList<ActivityRecord> activityRecord) {
		this.activityRecord = activityRecord;
	}

	public void addCard(VIPCard card) {
		cardList.add(card);
	}

	public ArrayList<VIPCard> removeCard(VIPCard card) {
		cardList.remove(card);
		return cardList;
	}

	/**
	 * function to modify vip information *
	 * 
	 * @param name
	 * @param password
	 * @return whether the modify action is success
	 */
	public boolean modifyInfo(String name, String password) {
		setName(name);
		setPassword(password);
		return true;
	}

	/**
	 * function to activate the card *
	 * 
	 * @param card
	 * @param money
	 * @return whether the activate action is success
	 */
	public boolean activate(VIPCard card, double money) {
		return card.activate(money);
	}

	/**
	 * function to pay the rent every month *
	 * 
	 * @param card
	 * @param money
	 * @return whether the pay action is success
	 */
	public boolean pay(VIPCard card, double money) {
		return card.pay(money);
	}

	/**
	 * * function to check the activity record of the vip himself/herself
	 * 
	 * @return the record list
	 */
	public ArrayList<ActivityRecord> checkActivityRecord() {
		return ActivityManager.checkActivityRecord(username);
	}

	/**
	 * function to check the pay record of the vip himself/herself *
	 * 
	 * @return the record list
	 */
	public ArrayList<PayRecord> checkPayRecord() {
		return PayManager.checkPayRecord(username);
	}

	/**
	 * function to reserve activity *
	 * 
	 * @param a_id
	 * @return whether the reserve action is success or not
	 */
	public boolean reserveActivity(String a_id) {
		return ActivityManager.reserveActivity(a_id, v_id);
	}
}
