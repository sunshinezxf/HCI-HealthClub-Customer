package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import model.record.PayRecord;
import model.record.PayType;
import dao.BaseDAO;
import dao.CardDAO;

public class CardDAOImpl implements CardDAO {
	private BaseDAO baseDAO;

	public BaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(BaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}

	public boolean delete(int c_id) {
		Connection connection = baseDAO.getConnection();
		PreparedStatement ps = null;
		String sql = "delete from card where c_id = ?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, c_id);
			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		return false;
	}

	public boolean activate(int c_id, int v_id) {
		Connection connection = baseDAO.getConnection();
		String s_1 = "select * from card where c_id = ?";
		String s_2 = "select * from vip where v_id = ?";
		PreparedStatement ps_1 = null;
		PreparedStatement ps_2 = null;
		ResultSet rs_1 = null;
		ResultSet rs_2 = null;
		double price = 0;
		String code = "";
		try {
			ps_1 = connection.prepareStatement(s_1);
			ps_1.setInt(1, c_id);
			rs_1 = ps_1.executeQuery();
			rs_1.beforeFirst();
			if (rs_1.next()) {
				code = rs_1.getString(2);
				boolean activated = rs_1.getBoolean(5);
				if (activated) {
					return false;
				}
				price = rs_1.getDouble(7);
			}
			baseDAO.closeResultSet(rs_1);
			baseDAO.closePreparedStatement(ps_1);
			ps_2 = connection.prepareStatement(s_2);
			ps_2.setInt(1, v_id);
			rs_2 = ps_2.executeQuery();
			rs_2.beforeFirst();
			if (rs_2.next()) {
				String username = rs_2.getString(2);
				String cr_no = rs_2.getString(8);
				String s_3 = "select * from credit where cr_no = ?";
				PreparedStatement ps_3 = null;
				ResultSet rs_3 = null;
				ps_3 = connection.prepareStatement(s_3);
				ps_3.setString(1, cr_no);
				rs_3 = ps_3.executeQuery();
				rs_3.beforeFirst();
				if (rs_3.next()) {
					double balance = rs_3.getDouble(2);
					if (balance > price) {
						String s_4 = "update credit set balance = "
								+ (balance - price) + " where cr_no = " + cr_no;
						PreparedStatement ps_4 = connection
								.prepareStatement(s_4);
						int row = ps_4.executeUpdate();
						baseDAO.closePreparedStatement(ps_4);
						baseDAO.closeResultSet(rs_3);
						baseDAO.closePreparedStatement(ps_3);
						if (row > 0) {
							String s_5 = "update card set activated = " + true
									+ " where c_id = " + c_id;
							PreparedStatement ps_5 = connection
									.prepareStatement(s_5);
							row = ps_5.executeUpdate();
							baseDAO.closePreparedStatement(ps_5);
							PayRecord record = new PayRecord();
							record.setV_id(v_id);
							record.setC_id(c_id);
							record.setUsername(username);
							record.setCode(code);
							record.setPrice(price);
							record.setPayType(PayType.ACTIVATE);
							record.setDate(new Date());
							record.setCr_no(cr_no);
							boolean inserted = insert(record);
							if (row > 0 && inserted) {
								return true;
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs_2);
			baseDAO.closePreparedStatement(ps_2);
			baseDAO.closeResultSet(rs_1);
			baseDAO.closePreparedStatement(ps_1);
			baseDAO.closeConnection(connection);
		}
		return false;
	}

	public boolean pay(int c_id, int v_id) {
		Connection connection = baseDAO.getConnection();
		String s_1 = "select * from card where c_id = ?";
		String s_2 = "select * from vip where v_id = ?";
		PreparedStatement ps_1 = null;
		PreparedStatement ps_2 = null;
		ResultSet rs_1 = null;
		ResultSet rs_2 = null;
		double rent = 0;
		String code = "";
		try {
			ps_1 = connection.prepareStatement(s_1);
			ps_1.setInt(1, c_id);
			rs_1 = ps_1.executeQuery();
			rs_1.beforeFirst();
			if (rs_1.next()) {
				code = rs_1.getString(2);
				boolean payed = rs_1.getBoolean(6);
				if (payed) {
					return false;
				}
				rent = rs_1.getDouble(8);
			}
			baseDAO.closeResultSet(rs_1);
			baseDAO.closePreparedStatement(ps_1);
			ps_2 = connection.prepareStatement(s_2);
			ps_2.setInt(1, v_id);
			rs_2 = ps_2.executeQuery();
			rs_2.beforeFirst();
			if (rs_2.next()) {
				String username = rs_2.getString(2);
				String cr_no = rs_2.getString(8);
				String s_3 = "select * from credit where cr_no = ?";
				PreparedStatement ps_3 = null;
				ResultSet rs_3 = null;
				ps_3 = connection.prepareStatement(s_3);
				ps_3.setString(1, cr_no);
				rs_3 = ps_3.executeQuery();
				rs_3.beforeFirst();
				if (rs_3.next()) {
					double balance = rs_3.getDouble(2);
					if (balance > rent) {
						String s_4 = "update credit set balance = "
								+ (balance - rent) + " where cr_no = " + cr_no;
						PreparedStatement ps_4 = connection
								.prepareStatement(s_4);
						int row = ps_4.executeUpdate();
						baseDAO.closePreparedStatement(ps_4);
						baseDAO.closeResultSet(rs_3);
						baseDAO.closePreparedStatement(ps_3);
						if (row > 0) {
							String s_5 = "update card set payed = " + true
									+ " where c_id = " + c_id;
							PreparedStatement ps_5 = connection
									.prepareStatement(s_5);
							row = ps_5.executeUpdate();
							baseDAO.closePreparedStatement(ps_5);
							PayRecord record = new PayRecord();
							record.setV_id(v_id);
							record.setC_id(c_id);
							record.setUsername(username);
							record.setCode(code);
							record.setPrice(rent);
							record.setPayType(PayType.RENT);
							record.setDate(new Date());
							record.setCr_no(cr_no);
							boolean inserted = insert(record);
							if (row > 0 && inserted) {
								return true;
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs_2);
			baseDAO.closePreparedStatement(ps_2);
			baseDAO.closeResultSet(rs_1);
			baseDAO.closePreparedStatement(ps_1);
			baseDAO.closeConnection(connection);
		}
		return false;
	}

	private boolean insert(PayRecord record) {
		Connection connection = baseDAO.getConnection();
		String sql = "insert into payrecord(v_id, c_id, username, code, price, payType, date, cr_no) values (?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, record.getV_id());
			ps.setInt(2, record.getC_id());
			ps.setString(3, record.getUsername());
			ps.setString(4, record.getCode());
			ps.setDouble(5, record.getPrice());
			ps.setString(6,
					(record.getPayType() == PayType.ACTIVATE) ? "activate"
							: "rent");
			Date date = record.getDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			String text = sdf.format(date);
			ps.setString(7, text);
			ps.setString(8, record.getCr_no());
			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		return false;
	}
}
