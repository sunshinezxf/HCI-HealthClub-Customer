package service;

import java.util.ArrayList;

import model.Activity;
import model.VIP;
import model.card.HomeVIPCard;
import model.card.VIPCard;

public interface VIPService {
	public boolean registerVIP(VIP vip);

	public boolean login(String username, String password);

	public ArrayList<VIPCard> viewCard(int v_id);

	public boolean applySGCard(VIPCard card);

	public HomeVIPCard applyHMCard(String hm_id, int v_id);

	public boolean cancelVIP(String username);

	public VIP checkVIP(String column, String value);

	public boolean modifyVIP(VIP vip);

	public boolean withdrawVIP(int v_id);

	public VIP requestActivate(int c_id, int v_id);
	
	public VIP requestPay(int c_id, int v_id);
	
	public boolean update(VIP vip);
	
	public ArrayList<Activity> checkReserved(int v_id);
	
	public ArrayList<Activity> checkOther(int v_id);
	
	public boolean reserve(int ac_id, int v_id);
	
	public boolean cancelActivity(int ac_id, int v_id);
	
	public boolean validateTele(String phone);
	
	public String getNewPassword(String phone);
	
	
}
