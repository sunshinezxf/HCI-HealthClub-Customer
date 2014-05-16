package dao;

public interface CardDAO {
	public boolean delete(int c_id);
	
	public boolean activate(int c_id, int v_id);
	
	public boolean pay(int c_id, int v_id);
}
