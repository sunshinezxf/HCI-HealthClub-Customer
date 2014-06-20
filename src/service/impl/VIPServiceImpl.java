package service.impl;

import java.util.ArrayList;
import java.util.Random;

import model.Activity;
import model.VIP;
import model.card.HomeVIPCard;
import model.card.VIPCard;
import service.VIPService;
import util.Encryption;
import util.Prompt;
import dao.VIPDAO;

public class VIPServiceImpl implements VIPService {
	private VIPDAO vipDAO;

	public VIPDAO getVIPDAO() {
		return vipDAO;
	}

	public void setVIPDAO(VIPDAO vipDAO) {
		this.vipDAO = vipDAO;
	}

	public Prompt registerVIP(VIP vip) {
		if (vip.getUsername() == null || vip.getUsername().equals(""))
			return new Prompt(false, "username cannot be null");
		if (vip.getName() == null || vip.getName().equals(""))
			return new Prompt(false, "name cannot be null");
		if (vip.getAge() < 10 || vip.getAge() > 60)
			return new Prompt(false, "age should between 10~60");
		return vipDAO.addVIP(vip);
	}

	public boolean login(String username, String password) {
		VIP vip = vipDAO.find("username", username);
		if (vip == null) {
			vip = vipDAO.find("phone", username);
			if (vip == null)
				return false;
		}
		if (vip.getPassword().equals(password))
			return true;
		return false;
	}

	public ArrayList<VIPCard> viewCard(int v_id) {
		return vipDAO.viewCard(v_id);
	}

	public boolean applySGCard(VIPCard card) {
		return vipDAO.applySG(card);
	}

	public HomeVIPCard applyHMCard(String hm_id, int v_id) {
		return null;
	}

	public boolean cancelVIP(String username) {
		return vipDAO.deleteVIP(username);
	}

	public VIP checkVIP(String column, String value) {
		return vipDAO.find(column, value);
	}

	public boolean modifyVIP(VIP vip) {
		return vipDAO.update(vip);
	}

	public boolean withdrawVIP(int v_id) {
		return vipDAO.withdraw(v_id);
	}

	public VIP requestActivate(int c_id, int v_id) {
		return vipDAO.request(c_id, v_id);
	}

	public VIP requestPay(int c_id, int v_id) {
		return vipDAO.request(c_id, v_id);
	}

	public boolean update(VIP vip) {
		return vipDAO.updateVIP(vip);
	}

	public ArrayList<Activity> checkReserved(int v_id) {
		return vipDAO.checkReservedActivities(v_id);
	}

	public ArrayList<Activity> checkOther(int v_id) {
		return vipDAO.checkOtherActivities(v_id);
	}

	public boolean reserve(int ac_id, int v_id) {
		return vipDAO.reserve(ac_id, v_id);
	}

	public boolean cancelActivity(int ac_id, int v_id) {
		return vipDAO.cancelActivity(ac_id, v_id);
	}

	@Override
	public boolean validateTele(String phone) {
		VIP vip = vipDAO.find("phone", phone);
		if(vip == null){
			return false;
		}
		return true;
	}

	@Override
	public VIP getNewPassword(String phone) {
		String newPass = randomString(7);
		VIP vip = vipDAO.find("phone", phone);
		vip.setPassword(Encryption.md5(newPass));
		vipDAO.updateVIP(vip);
		vip.setPassword(newPass);
		return vip;
	}

	private static Random randGen = null;
	private static char[] numbersAndLetters = null;

	public static final String randomString(int length) {
	         if (length < 1) {
	             return null;
	         }
	         if (randGen == null) {
	                randGen = new Random();
	                numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz" +
	                   "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
	                 }
	         char [] randBuffer = new char[length];
	         for (int i=0; i<randBuffer.length; i++) {
	             randBuffer[i] = numbersAndLetters[randGen.nextInt(71)];
	         }
	         return new String(randBuffer);
	}
	
	public boolean queryActivated(int v_id) {
		return vipDAO.isActivated(v_id);
	}
}
