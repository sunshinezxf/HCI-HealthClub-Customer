package action;

import model.CreditCard;
import model.Gender;
import model.Phone;
import model.VIP;
import service.VIPService;
import util.Encryption;
import util.IDGenerator;

@SuppressWarnings("serial")
public class Register extends BaseAction {
	private String name;
	private String gender;
	private String phone;
	private int age;
	private String password;
	private String repassword;
	private String credit;
	private String address;
	private VIPService vipService;

	public VIPService getVIPService() {
		return vipService;
	}

	public void setVIPService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {
		if (name == null || name.equals("") || gender == null
				|| gender.equals("") || phone == null || phone.equals("")
				|| password == null || password.equals("") || age == 0
				|| address == null || address.equals("")) {
			session.put("prompt", "Please fill all the needed information!!");
			return "failure";
		}
		if(!password.equals(repassword)){
			session.put("prompt", "Please enter same the password twice!!");
			return "failure";
		}
		String username = IDGenerator.generateUsername();
		VIP vip = new VIP();
		vip.setUsername(username);
		vip.setName(name);
		Gender gender = (this.gender.equals("male")) ? Gender.MALE
				: Gender.FEMALE;
		vip.setGender(gender);
		Phone phone = new Phone(this.phone);
		vip.setPhone(phone);
		vip.setAge(age);
		vip.setCreditCard(new CreditCard(credit));
		vip.setPassword(Encryption.md5(password));
		vip.setAddress(address);
		boolean status = vipService.registerVIP(vip);
		if (status) {
			session.put("username", vip.getUsername());
			session.put("prompt", "Welcome to Health Club, your username is "
					+ vip.getUsername());
			return "success";
		}
		return "failure";
	}

	
	
	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
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

	public int getAge() {
		return age;
	}

	public void setAge(String age) {
		if (age == null || age.equals(""))
			this.age = 0;
		else
			this.age = Integer.parseInt(age);
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
