package com.rays.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rays.bean.JobBean;
import com.rays.bean.UserBean;
import com.rays.model.JobModel;
import com.rays.model.UserModel;


@WebServlet("/JobListCtl.do")
public class JobListCtl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JobModel model = new JobModel();
		JobBean bean = new JobBean();
		int pageNo = 1;
		int pageSize = 5;
		try {
			List list = model.search(bean,pageNo,pageSize);
			List nextList = model.search(bean,pageNo+1,pageSize);
			request.setAttribute("list", list);
			request.setAttribute("nextList", nextList);
			request.setAttribute("pageNo", pageNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("JobListView.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JobModel model = new JobModel();
		JobBean bean = new JobBean();
		String[] ids = request.getParameterValues("ids");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int pageNo = 1;
		int pageSize = 5;

		if (request.getParameter("operation").equals("delete")) {
			if (ids != null && ids.length > 0) {
				for (String id : ids) {
					try {
						model.delete(Integer.parseInt(id));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				request.setAttribute("successMsg", "Record deleted successfully");
			} else {
				request.setAttribute("errorMsg", "Plesae select at least one record");
			}
		}
		if (request.getParameter("operation").equals("next")) {
			pageNo =(Integer) Integer.parseInt(request.getParameter("pageNo"));
			pageNo++;
		}
		if (request.getParameter("operation").equals("previous")) {
			pageNo =(Integer) Integer.parseInt(request.getParameter("pageNo"));
			pageNo--;
		}
		if (request.getParameter("operation").equals("search")) {
				bean.setTitle(request.getParameter("searchByTitle"));
				try {
					model.search(bean,pageNo,pageSize);
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		
		try {
			List list = model.search(bean,pageNo,pageSize);
			List nextList = model.search(bean,pageNo+1,pageSize);
			request.setAttribute("list", list);
			request.setAttribute("nextList", nextList);
			request.setAttribute("pageNo", pageNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("JobListView.jsp");
		rd.forward(request, response);
	}
}