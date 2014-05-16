package action;

import service.VIPService;
import model.CreditCard;
import model.Gender;
import model.Phone;
import model.VIP;

@SuppressWarnings("serial")
public class ConfirmPrivacy extends BaseAction {
	private String username;
	private String name;
	private String gender;
	private String phone;
	private String age;
	private String address;
	private String cr_no;
	private VIPService vipService;

	public VIPService getVipService() {
		return vipService;
	}

	public void setVIPService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {
		VIP vip = new VIP();
		vip.setUsername(username);
		vip.setName(name);
		vip.setGender((gender.equals("male")) ? Gender.MALE : Gender.FEMALE);
		vip.setPhone(new Phone(phone));
		vip.setAge(Integer.parseInt(age));
		vip.setAddress(address);
		vip.setCreditCard(new CreditCard(cr_no));
		boolean status = vipService.update(vip);
		vip = vipService.checkVIP("username", username);
		session.put("vip", vip);
		if (status) {
			request.setAttribute("prompt",
					"Congratulation! Registration data updated.");
			return "success";
		} else {
			request.setAttribute("prompt",
					"Sorry, registration data not succeed to update");
			return "failure";
		}
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCr_no() {
		return cr_no;
	}

	public void setCr_no(String cr_no) {
		this.cr_no = cr_no;
	}
}
