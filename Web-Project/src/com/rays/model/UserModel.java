package com.rays.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.rays.bean.UserBean;
import com.rays.exception.DuplicateRecordException;
import com.rays.exception.PasswordUnchangedException;
import com.rays.exception.RecordNotFoundException;
import com.rays.util.JDBCDataSource;

public class UserModel {
	
	//next pk method
	public int nextPk() throws Exception {
		int pk = 0;
		Connection conn = JDBCDataSource.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("select max(id) from st_user");
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			pk = rs.getInt(1);
		}
		
		JDBCDataSource.closeConnection(conn);
		return pk + 1;
	}
	
	
	
	// method to insert a record
		public void add(UserBean bean) throws Exception {

			UserBean existsBean = findByLogin(bean.getLogin());

			if (existsBean != null) {
				throw new DuplicateRecordException("login id already exists");
			}

			Connection conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("insert into st_user values(?, ?, ?, ?, ?, ?)");

			int pk = nextPk();

			pstmt.setInt(1, pk);
			pstmt.setString(2, bean.getFirstName());
			pstmt.setString(3, bean.getLastName());
			pstmt.setString(4, bean.getLogin());
			pstmt.setString(5, bean.getPassword());
			pstmt.setDate(6, new java.sql.Date(bean.getDob().getTime()));

			int i = pstmt.executeUpdate();
			System.out.println("data inserted successfully: " + i);
			JDBCDataSource.closeConnection(conn);
		}

		// delete a record
		public void delete(UserBean bean) throws Exception {

			Connection conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("delete from st_user where id = ?");
			pstmt.setInt(1, bean.getId());
			int i = pstmt.executeUpdate();
			System.out.println("data deleted successfully: " + i);
			JDBCDataSource.closeConnection(conn);
		}

		// update a record
		public void update(UserBean bean) throws Exception {

			Connection conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(
					"update st_user set firstName = ?, lastName = ?, login = ?, password = ?, dob = ? where id = ?");
			pstmt.setString(1, bean.getFirstName());
			pstmt.setString(2, bean.getLastName());
			pstmt.setString(3, bean.getLogin());
			pstmt.setString(4, bean.getPassword());
			pstmt.setDate(5, new java.sql.Date(bean.getDob().getTime()));
			;
			pstmt.setInt(6, bean.getId());

			int i = pstmt.executeUpdate();
			System.out.println("data updated successfully: " + i);
			JDBCDataSource.closeConnection(conn);
		}

		// find by login
		public UserBean findByLogin(String login) throws Exception {

			Connection conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("select * from st_user where login = ?");
			pstmt.setString(1, login);

			ResultSet rs = pstmt.executeQuery();

			UserBean bean = null;
			while (rs.next()) {
				bean = new UserBean();

				bean.setId(rs.getInt(1));
				bean.setFirstName(rs.getString(2));
				bean.setLastName(rs.getString(3));
				bean.setLogin(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setDob(rs.getDate(6));

			}
			JDBCDataSource.closeConnection(conn);
			return bean;

		}

		// authenticate id and password
		public UserBean authenticate(String login, String password) throws Exception {

			Connection conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("select * from st_user where login = ? and password = ?");
			pstmt.setString(1, login);
			pstmt.setString(2, password);

			ResultSet rs = pstmt.executeQuery();

			UserBean bean = null;
			while (rs.next()) {
				bean = new UserBean();
				bean.setLogin(rs.getString(4));
				bean.setPassword(rs.getString(5));
			}
			JDBCDataSource.closeConnection(conn);
			return bean;
		}

		// change password
		public void changePassword(String oldPassword, String newPassword, String login) throws Exception {

			UserBean existBean = findByLogin(login);

//			System.out.println("database password: " + existBean.getPassword());
//			System.out.println("oldPassword: " + oldPassword);

			if (oldPassword == newPassword) {
				throw new PasswordUnchangedException("add new password");

			} else if (existBean.getPassword().equals(oldPassword)) {
				Connection conn = JDBCDataSource.getConnection();

				PreparedStatement pstmt = conn.prepareStatement("update st_user set password = ? where login = ?");
				pstmt.setString(1, newPassword);
				pstmt.setString(2, login);

				int i = pstmt.executeUpdate();
				System.out.println("password changed successfully: " + i);
				JDBCDataSource.closeConnection(conn);
			} else {
				throw new RecordNotFoundException("old passwood is incorrect");
			}

		}

		public UserBean findById(int id) throws Exception {

			Connection conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("select * from st_user where id = ?");

			pstmt.setInt(1, id);

			ResultSet rs = pstmt.executeQuery();

			UserBean bean = null;
			while (rs.next()) {
				bean = new UserBean();
				bean.setId(rs.getInt(1));
				bean.setFirstName(rs.getString(2));
				bean.setLastName(rs.getString(3));
				bean.setLogin(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setDob(rs.getDate(6));

			}

			JDBCDataSource.closeConnection(conn);
			return bean;
		}

		// search method
		public List search(UserBean bean) throws Exception {

			List list = new ArrayList();
			StringBuffer sql = new StringBuffer("select * from st_user where 1 = 1"); // where 1 = 1 is sql injection
			// and if it's true then we can append multiple queries

			if (bean != null) {
				if (bean.getFirstName() != null && bean.getFirstName().length() > 0) {
					sql.append(" and firstName like '" + bean.getFirstName() + "%'");
				}
				if (bean.getLastName() != null && bean.getLastName().length() > 0) {
					sql.append(" and lastName like '" + bean.getLastName() + "%'");
				}
				if (bean.getLogin() != null && bean.getLogin().length() > 0) {
					sql.append(" and login like '" + bean.getLogin() + "%'");
				}
				if (bean.getPassword() != null && bean.getPassword().length() > 0) {
					sql.append(" and password like '" + bean.getPassword() + "%'");
				}
				if (bean.getDob() != null && bean.getDob().getTime() > 0) {
					sql.append(" and dob like '" + new java.sql.Date(bean.getDob().getTime()) + "%'");
				}

			}

			Connection conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new UserBean();
				bean.setId(rs.getInt(1));
				bean.setFirstName(rs.getString(2));
				bean.setLastName(rs.getString(3));
				bean.setLogin(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setDob(rs.getDate(6));
				list.add(bean);
			}
			JDBCDataSource.closeConnection(conn);
			return list;
		}
	

}
