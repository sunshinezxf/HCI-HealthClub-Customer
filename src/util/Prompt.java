package util;

public class Prompt {
	private boolean state;
	private String message;

	public Prompt() {

	}

	public Prompt(boolean state, String message) {
		this();
		this.state = state;
		this.message = message;
	}

	public boolean getState() {
		return state;
	}

	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
}
