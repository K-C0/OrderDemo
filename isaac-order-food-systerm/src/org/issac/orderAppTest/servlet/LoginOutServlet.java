package org.issac.orderAppTest.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.issac.orderTest.util.ConstantUtil;
import org.issac.orderTest.util.CookieUtils;

/**
 * Servlet implementation class LoginOutServlet
 */
@WebServlet("/app/loginout.action")
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
		//删除保存在session中的用户信息
		request.getSession().removeAttribute(ConstantUtil.SESSION_NAME);
		
		CookieUtils.removeCookie(ConstantUtil.COOKIE_NAME,request,response);
		
		request.getRequestDispatcher("/app/login.do").forward(request, response);
	}

}
