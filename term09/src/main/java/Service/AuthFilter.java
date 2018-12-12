package Service;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;

/**
 * Servlet Filter implementation class AuthFilter
 */
public class AuthFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		
		final String LOGIN_PAGE = "login.jsp";
		final String LOGIN_ACTION_PAGE = "loginAction.jsp";
		final String LOGOUT_PAGE = "logoutAction.jsp";
		final String STUDENT_BASE_PAGE = "EnrollmentInformation.jsp";
		final String FACULTY_BASE_PAGE = "EnrollmentInformationFaculty.jsp";
		final String ADMIN_BASE_PAGE = "giveNumber.jsp";
		final String[] STUDENT_MENU_LIST = {
			"EnrollmentInformation.jsp",
			"PersonalInformation.jsp",
			"CourseReference.jsp",
			"CourseDetails.jsp",
			"CourseApply.jsp",
			"Timetable.jsp",
			"GradeDetails.jsp",
			"AllGradeDetails.jsp",
			"ScholarshipList.jsp",
			"planDetails.jsp",
			"addCourse.jsp",
			"editPersonalInfoAction"
		};
		final String[] FACULTY_MENU_LIST = {
			"EnrollmentInformationFaculty.jsp",
			"PersonalInformaionFaculty.jsp",
			"ResponsibilitySubject.jsp",
			"editPersonalInfoAction"
		};
		final String[] ADMIN_MENU_LIST = {
			"giveNumber.jsp",
			"asideAdmin.jsp"
		};
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		
		String uri = httpRequest.getRequestURI();
		
		if (uri.indexOf(LOGIN_PAGE) < 0 &&
			uri.indexOf(LOGIN_ACTION_PAGE) < 0 &&
			uri.indexOf(LOGOUT_PAGE) < 0) {
			if (session == null) {
				httpResponse.sendRedirect(LOGIN_PAGE);
			} else {
				String id = (String) session.getAttribute("sessionID");
				String perm = (String) session.getAttribute("sessionPERM");
				
				if (id == null || perm == null) {
					httpResponse.sendRedirect(LOGIN_PAGE);
				} else {
					int i = 0;
					if (perm.equals("admin")) {
						for (i=0; i<ADMIN_MENU_LIST.length; i++) {
							if (uri.indexOf(ADMIN_MENU_LIST[i]) > 0) break;
						}
						if (i == ADMIN_MENU_LIST.length) httpResponse.sendRedirect(ADMIN_BASE_PAGE);
					} else if (perm.equals("faculty")) {
						for (i=0; i<FACULTY_MENU_LIST.length; i++) {
							if (uri.indexOf(FACULTY_MENU_LIST[i]) > 0) break;
						}
						if (i == FACULTY_MENU_LIST.length) httpResponse.sendRedirect(FACULTY_BASE_PAGE);
					} else if (perm.equals("student")) {
						for (i=0; i<STUDENT_MENU_LIST.length; i++) {
							if (uri.indexOf(STUDENT_MENU_LIST[i]) > 0) break;
						}
						if (i == STUDENT_MENU_LIST.length) httpResponse.sendRedirect(STUDENT_BASE_PAGE);
					}
				}	
			}
			
		}
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
