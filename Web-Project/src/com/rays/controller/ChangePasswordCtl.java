package com.rays.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rays.bean.UserBean;
import com.rays.model.UserModel;

@WebServlet("/ChangePasswordCtl")
public class ChangePasswordCtl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("ChangePasswordView.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserBean bean = new UserBean();
		UserModel model = new UserModel();

		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String login = request.getParameter("login");

		try {
			model.changePassword(oldPassword, newPassword, login);

			System.out.println("password changed");
			request.setAttribute("successMsg", "Password changed successfully");
			RequestDispatcher rd = request.getRequestDispatcher("ChangePasswordView.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			// Handle invalid login or old password
			request.setAttribute("errorMsg", "Invalid login id or old password");
			RequestDispatcher rd = request.getRequestDispatcher("ChangePasswordView.jsp");
			rd.forward(request, response);

			e.printStackTrace();
		}

	}
}
