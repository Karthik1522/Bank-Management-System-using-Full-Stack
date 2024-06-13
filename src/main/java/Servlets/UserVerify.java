package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserVerify
 */
@WebServlet("/UserVerify")
public class UserVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserVerify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	try {
   		PrintWriter out = response.getWriter();
    		String name = request.getParameter("username");
    		String email = request.getParameter("email");
    		
    		out.println(name);
    		SendEmail sm = new SendEmail();
    		String code = sm.getRandom();

    		
    		User user = new User(name,email,code);
    		
    		boolean test = sm.sendEmail(user);
    		out.println(test);
    		System.out.println(test);
    		if(test) {
    			HttpSession s = request.getSession();
    			s.setAttribute("authcode",user);
    			response.sendRedirect("verify.jsp");
    			
    		}
    	}catch(Exception e) {}
    	
    }
    
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	processRequest(request,response);
	}

}
