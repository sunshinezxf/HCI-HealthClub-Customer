package action;

@SuppressWarnings("serial")
public class Quit extends BaseAction {
	public String execute() throws Exception {
		session.clear();
		return "success";
	}
}
