package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import model.Activity;
import model.CreditCard;
import model.Gender;
import model.Phone;
import model.Place;
import model.VIP;
import model.card.CardType;
import model.card.HomeVIPCard;
import model.card.SingleVIPCard;
import model.card.VIPCard;
import dao.BaseDAO;
import dao.VIPDAO;

public class VIPDAOImpl implements VIPDAO {
	private BaseDAO baseDAO;

	public BaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(BaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}

	public boolean addVIP(VIP vip) {
		Connection connection = baseDAO.getConnection();
		PreparedStatement ps = null;
		String username = vip.getUsername();
		String name = vip.getName();
		String gender = (vip.getGender() == Gender.MALE) ? "male" : "female";
		String phone = vip.getPhone().getNo();
		int age = vip.getAge();
		String password = vip.getPassword();
		String cr_no = vip.getCreditCard().getCr_no();
		String address = vip.getAddress();
		String sql = "insert into vip(username, name, gender, phone, age, password, cr_no, address) values (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, name);
			ps.setString(3, gender);
			ps.setString(4, phone);
			ps.setInt(5, age);
			ps.setString(6, password);
			ps.setString(7, cr_no);
			ps.setString(8, address);
			int i = ps.executeUpdate();
			if (i > 0)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		return false;
	}

	public boolean deleteVIP(String username) {
		Connection connection = baseDAO.getConnection();
		String sql = "delete from vip where username = ?";
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, username);
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

	public VIP find(String column, String value) {
		Connection connection = baseDAO.getConnection();
		String sql = "select * from vip where " + column + " = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection inner_con = null;
		PreparedStatement inner_ps = null;
		ResultSet inner_rs = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, value);
			rs = ps.executeQuery();
			rs.beforeFirst();
			if (rs.next()) {
				VIP vip = new VIP();
				int t_v_id = rs.getInt(1);
				String t_username = rs.getString(2);
				String t_name = rs.getString(3);
				String t_gender_string = rs.getString(4);
				Gender t_gender = (t_gender_string.equals("male")) ? Gender.MALE
						: Gender.FEMALE;
				String t_phone_string = rs.getString(5);
				Phone t_phone = new Phone(t_phone_string);
				int t_age = rs.getInt(6);
				String t_password = rs.getString(7);
				String cr_no = rs.getString(8);
				String address = rs.getString(9);
				String inner_sql = "select * from credit where cr_no = ?";
				inner_con = baseDAO.getConnection();
				inner_ps = inner_con.prepareStatement(inner_sql);
				inner_ps.setString(1, cr_no);
				inner_rs = inner_ps.executeQuery();
				inner_rs.beforeFirst();
				if (inner_rs.next()) {
					CreditCard credit = new CreditCard();
					double balance = inner_rs.getDouble(2);
					credit.setCr_no(cr_no);
					credit.setBalance(balance);
					vip.setCreditCard(credit);
				}
				baseDAO.closeResultSet(inner_rs);
				baseDAO.closePreparedStatement(inner_ps);
				baseDAO.closeConnection(inner_con);
				vip.setV_id(t_v_id);
				vip.setUsername(t_username);
				vip.setName(t_name);
				vip.setGender(t_gender);
				vip.setPhone(t_phone);
				vip.setAge(t_age);
				vip.setPassword(t_password);
				vip.setAddress(address);
				return vip;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs);
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		return null;
	}

	public boolean update(VIP vip) {
		return true;
	}

	public ArrayList<VIPCard> viewCard(int v_id) {
		Connection connection = baseDAO.getConnection();
		PreparedStatement ps = null;
		String sql = "select * from card where v_id = ?";
		ResultSet rs = null;
		ArrayList<VIPCard> cardList = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, v_id);
			rs = ps.executeQuery();
			rs.beforeFirst();
			cardList = new ArrayList<VIPCard>();
			while (rs.next()) {
				VIPCard card = null;
				String cardType = rs.getString(4);
				if (cardType.equals("SG")) {
					card = new SingleVIPCard();
				} else {
					card = new HomeVIPCard();
				}
				int c_id = rs.getInt(1);
				String c_code = rs.getString(2);
				String c_token = rs.getString(3);
				String c_type = rs.getString(4);
				boolean c_activated = rs.getBoolean(5);
				boolean c_payed = rs.getBoolean(6);
				double c_activatePrice = rs.getDouble(7);
				double c_rent = rs.getDouble(8);
				card.setC_id(c_id);
				card.setCode(c_code);
				card.setToken(c_token);
				CardType type = (c_type.equals("SG")) ? CardType.SINGLE
						: CardType.HOME;
				card.setType(type);
				card.setActivated(c_activated);
				card.setPayed(c_payed);
				card.setActivatePrice(c_activatePrice);
				card.setRent(c_rent);
				card.setV_id(v_id);
				cardList.add(card);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs);
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		if (cardList.size() == 0)
			return null;
		return cardList;
	}

	public boolean deleteVIP(int v_id) {
		Connection connection = baseDAO.getConnection();
		PreparedStatement ps = null;
		String sql = "delete from vip where v_id = ?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, v_id);
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

	public boolean applySG(VIPCard card) {
		Connection connection = baseDAO.getConnection();
		PreparedStatement ps = null;
		String code = card.getCode();
		String token = card.getToken();
		String type = (card.getType() == CardType.SINGLE) ? "SG" : "HM";
		boolean activated = card.getActivated();
		boolean payed = card.getPayed();
		double activatePrice = card.getActivatePrice();
		double rent = card.getRent();
		int v_id = card.getV_id();
		String sql = "insert into card(code, token, type, activated, payed, activatePrice, rent, v_id) values (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, token);
			ps.setString(3, type);
			ps.setBoolean(4, activated);
			ps.setBoolean(5, payed);
			ps.setDouble(6, activatePrice);
			ps.setDouble(7, rent);
			ps.setInt(8, v_id);
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

	public VIP request(int c_id, int v_id) {
		VIP vip = null;
		Connection connection = baseDAO.getConnection();
		String sql = "select * from vip where v_id = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, v_id);
			rs = ps.executeQuery();
			rs.beforeFirst();
			if (rs.next()) {
				vip = new VIP();
				String username = rs.getString(2);
				String name = rs.getString(3);
				Gender gender = (rs.getString(4).equals("male")) ? Gender.MALE
						: Gender.FEMALE;
				Phone phone = new Phone(rs.getString(5));
				int age = rs.getInt(6);
				String password = rs.getString(7);
				vip.setV_id(v_id);
				vip.setUsername(username);
				vip.setName(name);
				vip.setGender(gender);
				vip.setPhone(phone);
				vip.setAge(age);
				vip.setPassword(password);
				String cr_no = rs.getString(8);
				String s_1 = "select * from credit where cr_no = ?";
				PreparedStatement ps_1 = connection.prepareStatement(s_1);
				ps_1.setString(1, cr_no);
				ResultSet rs_1 = ps_1.executeQuery();
				rs_1.beforeFirst();
				if (rs_1.next()) {
					CreditCard credit = new CreditCard();
					double balance = rs_1.getDouble(2);
					credit.setCr_no(cr_no);
					credit.setBalance(balance);
					vip.setCreditCard(credit);
				}
				baseDAO.closeResultSet(rs_1);
				baseDAO.closePreparedStatement(ps_1);
				String s_2 = "select * from card where c_id = ?";
				PreparedStatement ps_2 = connection.prepareStatement(s_2);
				ps_2.setInt(1, c_id);
				ResultSet rs_2 = ps_2.executeQuery();
				rs_2.beforeFirst();
				ArrayList<VIPCard> cardList = null;
				if (rs_2.next()) {
					cardList = new ArrayList<VIPCard>();
					VIPCard card = null;
					String type = rs_2.getString(4);
					if (type.equals("SG")) {
						card = new SingleVIPCard();
						CardType cd = CardType.SINGLE;
						card.setType(cd);
					} else {
						card = new HomeVIPCard();
						CardType cd = CardType.HOME;
						card.setType(cd);
					}
					String code = rs_2.getString(2);
					String token = rs_2.getString(3);
					boolean activated = rs_2.getBoolean(5);
					boolean payed = rs_2.getBoolean(6);
					double activatePrice = rs_2.getDouble(7);
					double rent = rs_2.getDouble(8);
					card.setC_id(c_id);
					card.setCode(code);
					card.setToken(token);
					card.setActivated(activated);
					card.setPayed(payed);
					card.setActivatePrice(activatePrice);
					card.setRent(rent);
					card.setV_id(v_id);
					cardList.add(card);
				}
				vip.setCardList(cardList);
				baseDAO.closeResultSet(rs_2);
				baseDAO.closePreparedStatement(ps_2);
				return vip;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs);
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		return null;
	}

	public ArrayList<Activity> checkActivities(int a_id) {
		return null;
	}

	public boolean updateVIP(VIP vip) {
		Connection connection = baseDAO.getConnection();
		String sql = "update vip set name = ?, gender = ?, phone = ?, age = ?, cr_no = ?, address = ?,password = ? where username = ?";
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, vip.getName());
			ps.setString(2, (vip.getGender() == Gender.MALE) ? "male"
					: "female");
			ps.setString(3, vip.getPhone().getNo());
			ps.setInt(4, vip.getAge());
			ps.setString(5, vip.getCreditCard().getCr_no());
			ps.setString(6, vip.getAddress());
			ps.setString(7, vip.getPassword());
			ps.setString(8, vip.getUsername());
			int count = ps.executeUpdate();
			if (count > 0) {
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

	public ArrayList<Activity> checkReservedActivities(int v_id) {
		Connection connection = baseDAO.getConnection();
		String sql = "select c.ac_id, a.ac_name, a.a_id, a.location, a.start, a.end, a.co_no from choose c, activity a where c.ac_id = a.ac_id and v_id = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Activity> activities = new ArrayList<Activity>();
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, v_id);
			rs = ps.executeQuery();
			rs.beforeFirst();
			while (rs.next()) {
				Activity activity = new Activity();
				int ac_id = rs.getInt(1);
				String ac_name = rs.getString(2);
				int a_id = rs.getInt(3);
				Place place = new Place(rs.getString(4));
				Date startDate = rs.getDate(5);
				Date endDate = rs.getDate(6);
				String coach_no = rs.getString(7);
				activity.setAc_id(ac_id);
				activity.setAc_name(ac_name);
				activity.setA_id(a_id);
				activity.setPlace(place);
				activity.setStartDate(startDate);
				activity.setEndDate(endDate);
				activity.setCoach_no(coach_no);
				activities.add(activity);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs);
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		return activities;
	}

	public ArrayList<Activity> checkOtherActivities(int v_id) {
		Connection connection = baseDAO.getConnection();
		String sql = "select * from activity where ac_id not in(select ac_id from choose where v_id = ?)";
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Activity> activities = new ArrayList<Activity>();
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, v_id);
			rs = ps.executeQuery();
			rs.beforeFirst();
			while (rs.next()) {
				Activity activity = new Activity();
				int ac_id = rs.getInt(1);
				String ac_name = rs.getString(2);
				int a_id = rs.getInt(3);
				Place place = new Place(rs.getString(4));
				Date startDate = rs.getDate(5);
				Date endDate = rs.getDate(6);
				String coach_no = rs.getString(7);
				activity.setAc_id(ac_id);
				activity.setAc_name(ac_name);
				activity.setA_id(a_id);
				activity.setPlace(place);
				activity.setStartDate(startDate);
				activity.setEndDate(endDate);
				activity.setCoach_no(coach_no);
				activities.add(activity);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs);
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		return activities;
	}

	public boolean reserve(int ac_id, int v_id) {
		Connection connection = baseDAO.getConnection();
		String sql = "insert into choose(v_id, ac_id, attended) values (?, ?, ?)";
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, v_id);
			ps.setInt(2, ac_id);
			ps.setBoolean(3, false);
			int row = ps.executeUpdate();
			if (row > 0) {
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

	public boolean cancelActivity(int ac_id, int v_id) {
		Connection connection = baseDAO.getConnection();
		String sql = "delete from choose where ac_id = ? and v_id = ?";
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, ac_id);
			ps.setInt(2, v_id);
			int count = ps.executeUpdate();
			if (count > 0) {
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

	public boolean withdraw(int v_id) {
		Connection connection = baseDAO.getConnection();
		String sql = "delete from vip where v_id = ?";
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, v_id);
			int count = ps.executeUpdate();
			if (count > 0) {
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
