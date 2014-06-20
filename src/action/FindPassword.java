package action;

import com.sun.org.apache.xml.internal.security.encryption.EncryptedData;

import service.VIPService;
import util.Encryption;

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
			String result = vipService.getNewPassword(phone);
			session.remove("prompt");
			session.put("prompt", "Your new Password is "+result);
			return "success";
		}else{
			session.remove("prompt");
			session.put("prompt", "the phone is not redgistered yet!!!");
			return "failure";
		}
		
	}

}
