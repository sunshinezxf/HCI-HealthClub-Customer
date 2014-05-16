package action;

import model.VIP;
import service.VIPService;
import util.Encryption;

@SuppressWarnings("serial")
public class Login extends BaseAction {
	private String username;
	private String password;
	private VIPService vipService;

	public VIPService getVIPService() {
		return vipService;
	}

	public void setVIPService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {
		String login_username = username;
		String login_password = Encryption.md5(password);
		boolean status = vipService.login(login_username, login_password);
		if (status) {
			VIP vip = vipService.checkVIP("username", login_username);
			session.put("vip", vip);
			return "success";
		} else {
			return "failure";
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
