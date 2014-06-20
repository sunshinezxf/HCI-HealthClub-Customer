package action;

import model.VIP;
import service.VIPService;
import util.Prompt;

/**
 * @author wang cheng
 * @version 1.0
 * @see this action is called by customer to find their password
 */

@SuppressWarnings("serial")

public class FindPassword extends BaseAction{

	private String phone;

	private VIPService vipService;

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public VIPService getVipService() {
		return vipService;
	}

	public void setVipService(VIPService vipService) {
		this.vipService = vipService;
	}

	public String execute() throws Exception {

		if(vipService.validateTele(phone)){
			VIP result = vipService.getNewPassword(phone);
			Prompt prompt = new Prompt(true,
					"Your usename is "+result.getUsername()+" and the new Password is "+result.getPassword());
			request.setAttribute("prompt", prompt);
			return "success";
		}else{
			Prompt prompt = new Prompt(false,
					"the phone is not redgistered yet!!!");
			request.setAttribute("prompt", prompt);
			return "failure";
		}

	}

}