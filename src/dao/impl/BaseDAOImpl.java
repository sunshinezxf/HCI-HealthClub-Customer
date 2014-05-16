package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dao.BaseDAO;

public class BaseDAOImpl implements BaseDAO{
	private static BaseDAOImpl baseDAO = new BaseDAOImpl();

	private InitialContext jndiContext = null;
	private Connection connection = null;
	private DataSource dataSource = null;

	private BaseDAOImpl() {
		Properties properties = new Properties();
		properties.put(Context.PROVIDER_URL, "jnp:///");
		properties.put(Context.INITIAL_CONTEXT_FACTORY,
				"org.apache.naming.java.javaURLContextFactory");
		try {
			jndiContext = new InitialContext(properties);
			dataSource = (DataSource) jndiContext
					.lookup("java:comp/env/jdbc/healthclub");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static BaseDAOImpl getInstance() {
		return baseDAO;
	}

	public Connection getConnection() {
		try {
			connection = dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public void closeConnection(Connection connection) {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void closePreparedStatement(PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void closeResultSet(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
