package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface BaseDAO {
	public Connection getConnection();
	
	public void closeConnection(Connection connection);
	
	public void closePreparedStatement(PreparedStatement ps);
	
	public void closeResultSet(ResultSet rs);
}
