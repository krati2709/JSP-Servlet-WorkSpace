package com.rays.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

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

@WebServlet("/JobCtl.do")
public class JobCtl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		JobModel model = new JobModel();
		JobBean bean = new JobBean();

		String id = request.getParameter("id");
		System.out.println("id >>>>-- " + id);

		if (id != null) {
			try {
				bean = model.findById(Integer.parseInt(id));
				request.setAttribute("bean", bean);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		RequestDispatcher rd = request.getRequestDispatcher("JobView.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String op = request.getParameter("operation");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		JobBean bean = new JobBean();
		JobModel model = new JobModel();

		String title = request.getParameter("title");
		String joiningDate = request.getParameter("joiningDate");
		String experience = request.getParameter("experience");
		String status = request.getParameter("status");

		try {
			bean.setTitle(title);;
			bean.setExperience(experience);
			bean.setStatus(status);
			bean.setJoiningDate(sdf.parse(joiningDate));

			if (op.equals("update")) {
				bean.setId(Integer.parseInt(request.getParameter("id")));
				model.update(bean);
				request.setAttribute("successMsg", "Requirement updated Successfully");
			} else {
				model.add(bean);
				request.setAttribute("successMsg", "Requirement added Successfully");
			}

		} catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("JobView.jsp");
		rd.forward(request, response);

	}

}