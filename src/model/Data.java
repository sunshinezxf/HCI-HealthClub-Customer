package model;

public class Data {
	private String name;
	private double data;

	public Data() {
		name = "";
	}

	public Data(String name) {
		this.name = name;
	}
	
	public Data(String name, double data) {
		this.name = name;
		this.data = data;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getData() {
		return data;
	}

	public void setData(double data) {
		this.data = data;
	}
}
