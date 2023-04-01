package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import accounts.Account;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			request.getSession(true).invalidate();
			
			//make sure that email is valid
			String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";
			
			//collect date from a login form
			String user = request.getParameter("username");
			String password = request.getParameter("password");
			String rem = request.getParameter("remember");
			
			Account acc = new Account();
			acc.setName(user);
			acc.setPwd(password);
			
			HttpSession session = request.getSession(true);
			
			if (!password.matches(regex) || !user.matches(regexMail)) {
				session.setAttribute("error", "invalid syntax");
				response.sendRedirect("web/login.jsp");
				return;
			}
			
			//read information of account in web.xml
			String uid = getServletContext().getInitParameter("username");
			String pwd = getServletContext().getInitParameter("password");
			
			//check account - use validate code in assignment 1 to valid user
			if(user != null && acc.getPwd().equals(pwd) && acc.getName().equalsIgnoreCase(uid)) {
				//setting remember
				if(rem != null) {
					
					Cookie cooUser = new Cookie("cookuser", user);
					Cookie cooPass = new Cookie("cookpass", password);
					Cookie cooRemb = new Cookie("cookremb", rem);
					
					// setting time cookie
					cooUser.setMaxAge(1 * 60);
					cooPass.setMaxAge(1 * 60);
					cooRemb.setMaxAge(1 * 60);
					
					// add cookie
					response.addCookie(cooUser);
					response.addCookie(cooPass);
					response.addCookie(cooRemb);
				}
				
				//set session
				session.setAttribute("user", user);
				//login is valid, now redirect to index page of admin
				response.sendRedirect("web/admin/index.jsp");
			}else {
				session.setAttribute("error", "Wrong username or password ");
				response.sendRedirect("web/login.jsp");
			}
		}catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("web/login.jsp");
			rd.forward(request, response);
		}catch (Exception ex) {
			response.getWriter().println(ex);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			request.getSession(true).invalidate();
			
			//make sure that email is valid
			String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";
			
			//collect date from a login form
			String user = request.getParameter("username");
			String password = request.getParameter("password");
			
			Account acc = new Account();
			acc.setName(user);
			acc.setPwd(password);
			
			HttpSession session = request.getSession(true);
			
			if (!password.matches(regex) || !user.matches(regexMail)) {
				session.setAttribute("error", "invalid syntax");
				response.sendRedirect("web/login.jsp");
				return;
			}
			
			//read information of account in web.xml
			String uid = getServletContext().getInitParameter("username");
			String pwd = getServletContext().getInitParameter("password");
			
			//check account - use validate code in assignment 1 to valid user
			if(user != null && acc.getPwd().equals(pwd) && acc.getName().equalsIgnoreCase(uid)) {
				//setting remember
				if(request.getParameter("remember") != null) {
					String rem = request.getParameter("remember");
					
					Cookie cooUser = new Cookie("cookuser", user);
					Cookie cooPass = new Cookie("cookpass", password);
					Cookie cooRemb = new Cookie("cookremb", rem);
					
					// setting time cookie
					cooUser.setMaxAge(1 * 60);
					cooPass.setMaxAge(1 * 60);
					cooRemb.setMaxAge(1 * 60);
					
					// add cookie
					response.addCookie(cooUser);
					response.addCookie(cooPass);
					response.addCookie(cooRemb);
				}
				
				//set session
				session.setAttribute("user", user);
				//login is valid, now redirect to index page of admin
				response.sendRedirect("web/admin/index.jsp");
			}else {
				session.setAttribute("error", "Wrong username or password");
				response.sendRedirect("web/login.jsp");
			}
		}catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("web/login.jsp");
			rd.forward(request, response);
		}catch (Exception ex) {
			response.getWriter().println(ex);
		}
	}

}
