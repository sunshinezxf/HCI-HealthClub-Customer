package model;

public class CreditCard {
	private int v_id;
	private String cr_no;
	private double balance;

	public CreditCard() {
		cr_no = "";
		balance = 0;
	}

	public CreditCard(String cr_no) {
		this.cr_no = cr_no;
		balance = 0;
	}

	public int getV_id() {
		return v_id;
	}

	public void setV_id(int v_id) {
		this.v_id = v_id;
	}

	public String getCr_no() {
		return cr_no;
	}

	public void setCr_no(String cr_no) {
		this.cr_no = cr_no;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}
}
