package com.rays.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.rays.bean.JobBean;
import com.rays.bean.UserBean;
import com.rays.exception.DuplicateRecordException;
import com.rays.util.JDBCDataSource;

public class JobModel {
	
	
//next pk method 
	public int nextPk() throws Exception {

		int pk = 0;

		Connection conn = JDBCDataSource.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("select max(id) from st_job");
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			pk = rs.getInt(1);
			System.out.println("max id: " + pk);
		}

		conn.close();
		return pk + 1;

	}
	
	
	//add method
	public void add(JobBean bean) throws Exception {


		Connection conn = JDBCDataSource.getConnection();

		PreparedStatement pstmt = conn.prepareStatement("insert into st_job values(?, ?, ?, ?, ?)");

		int pk = nextPk();

		pstmt.setInt(1, pk);
		pstmt.setString(2, bean.getTitle());
		pstmt.setDate(3, new java.sql.Date(bean.getJoiningDate().getTime()));
		pstmt.setString(4, bean.getExperience());
		pstmt.setString(5, bean.getStatus());
		
		int i = pstmt.executeUpdate();

		System.out.println("data inserted successfully: " + i);
		JDBCDataSource.closeConnection(conn);
	}
	
	//delete method
	public void delete(int id) throws Exception {

		Connection conn = JDBCDataSource.getConnection();

		PreparedStatement pstmt = conn.prepareStatement("delete from st_job where id = ?");

		pstmt.setInt(1, id);

		int i = pstmt.executeUpdate();
		System.out.println("data deleted successfully: " + i);
		JDBCDataSource.closeConnection(conn);

	}
	
	
	//update method
	public void update(JobBean bean) throws Exception {

		Connection conn = JDBCDataSource.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(
				"update st_job set title = ?, joiningDate = ?, Experience = ?, status = ? where id = ?");

		pstmt.setString(1, bean.getTitle());
		pstmt.setDate(2, new java.sql.Date(bean.getJoiningDate().getTime()));
		pstmt.setString(3, bean.getExperience());
		pstmt.setString(4, bean.getStatus());
		pstmt.setInt(5, bean.getId());
		

		int i = pstmt.executeUpdate();
		System.out.println("data updated successfully: " + i);
		JDBCDataSource.closeConnection(conn);

	}
	
	//find by pk
	public JobBean findById(int id) throws Exception {

		Connection conn = JDBCDataSource.getConnection();

		PreparedStatement pstmt = conn.prepareStatement("select * from st_job where id = ?");

		pstmt.setInt(1, id);

		ResultSet rs = pstmt.executeQuery();

		JobBean bean = null;
		while (rs.next()) {
			bean = new JobBean();
			bean.setId(rs.getInt(1));
			bean.setTitle(rs.getString(2));
			bean.setJoiningDate(rs.getDate(3));;
			bean.setExperience(rs.getString(4));
			bean.setStatus(rs.getString(5));
			
		}

		JDBCDataSource.closeConnection(conn);
		return bean ;

	}
	
	//search method
	public List search(JobBean bean, int pageNo, int pageSize) throws Exception {

		List list = new ArrayList();

		StringBuffer sql = new StringBuffer("select * from st_job where 1 = 1");

		if (bean != null) {
			if (bean.getTitle() != null && bean.getTitle().length() > 0) {
				sql.append(" and title like '" + bean.getTitle() + "%'");
			}
		}

		if (pageSize > 0) {
			pageNo = (pageNo - 1) * pageSize;
			sql.append(" limit " + pageNo + ", " + pageSize);
		}

		Connection conn = JDBCDataSource.getConnection();
		System.out.println("sql ----> " + sql.toString());
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			bean = new JobBean();
			bean.setId(rs.getInt(1));
			bean.setTitle(rs.getString(2)); 
			bean.setJoiningDate(rs.getDate(3));
			bean.setExperience(rs.getString(4));
			bean.setStatus(rs.getString(5));
			
			
			list.add(bean);

		}

		JDBCDataSource.closeConnection(conn);
		return list;

	}


}
