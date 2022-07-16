package org.issac.orderSys.servlet;

import org.issac.orderTest.util.ConstantUtil;
import org.issac.orderTest.util.CookieUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class LoginOutServlet
 */
@WebServlet("/sys/loginout.action")
public class LoginOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("========退出===============");	
		request.getSession().removeAttribute("session_user");
			CookieUtils.removeCookie(ConstantUtil.COOKIE_NAME,request,response);
			request.getRequestDispatcher("/WEB-INF/jsp/sys/login.jsp").forward(request, response);
	}

}
