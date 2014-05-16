package model;

import java.util.ArrayList;

import model.record.ActivityRecord;
import model.record.PayRecord;
import util.manager.ActivityManager;
import util.manager.PayManager;

public class Attendant {
	private int a_id;
	private String username;
	private String password;
	private String name;

	public Attendant() {
		username = "";
		name = "";
		password = "";
	}

	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public VIP checkVIPInformation(String username) {
		return null;
	}

	public ArrayList<ActivityRecord> checkActivityRecord(String username) {
		return ActivityManager.checkActivityRecord(username);
	}

	public ArrayList<PayRecord> checkPayRecord(String username) {
		return PayManager.checkPayRecord(username);
	}

	public boolean modifyVIPInfomation(VIP vip) {
		return true;
	}

	public boolean modifyVIPActivityRecord(VIP vip) {
		return ActivityManager.modifyVIPActivityRecord(vip);
	}

}
