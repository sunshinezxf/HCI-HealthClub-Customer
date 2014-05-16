package service;

public interface CardService {
	public boolean deleteCard(int c_id);
	
	public boolean activate(int c_id, int v_id);
	
	public boolean pay(int c_id, int v_id);
}
