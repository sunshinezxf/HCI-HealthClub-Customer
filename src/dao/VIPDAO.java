package dao;

import java.util.ArrayList;

import util.Prompt;
import model.Activity;
import model.VIP;
import model.card.VIPCard;

public interface VIPDAO {
	public Prompt addVIP(VIP vip);

	public boolean deleteVIP(String username);

	public VIP find(String column, String value);

	public boolean update(VIP vip);

	public ArrayList<VIPCard> viewCard(int v_id);

	public boolean deleteVIP(int v_id);

	public boolean applySG(VIPCard card);

	public VIP request(int c_id, int v_id);
	
	public ArrayList<Activity> checkActivities(int a_id);
	
	public boolean updateVIP(VIP vip);
	
	public ArrayList<Activity> checkReservedActivities(int v_id);
	
	public ArrayList<Activity> checkOtherActivities(int v_id);
	
	public boolean reserve(int ac_id, int v_id);
	
	public boolean cancelActivity(int ac_id, int v_id);
	
	public boolean withdraw(int v_id);
}
