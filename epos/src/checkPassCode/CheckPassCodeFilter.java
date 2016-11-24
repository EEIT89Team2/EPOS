package checkPassCode;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee.model.EmpVO;


@WebFilter(urlPatterns = {
		"/DISCOUNT/updateDisc.do",
		"/MEMBER/deleteMem.do",
		"/MEMBER/addMem.jsp",
		"/MEMBER/searchMem.jsp",
		"/MEMBER/allForUpdateMem.do",
		"/EMPLOYEE/searchEmp.jsp",
		"/EMPLOYEE/addEmp.jsp",
		"/EMPLOYEE/SetPassCode.jsp",
		"/EMPLOYEE/updateDeleteEmp.do",
		"/COMPANY/searchCom.jsp",
		"/COMPANY/addCom.jsp",
		"/COMPANY/updateDeleteCom.do",
		"/REQUISITION/addReq.jsp",
		"/REQUISITION/SelectReq.jsp",
		"/REQUISITION/getAllReq.do",
		"/REQUISITION/SelectbyDate.jsp",
		"/REQUISITION/selectOfN.do",
		"/QUOTATION/addQuo0.do",
		"/QUOTATION/SelectQuo.jsp",
		"/QUOTATION/getAllQuo.do",
		"/QUOTATION/SelectbyDate.jsp",
		"/QUOTATION/selectOfN.do",
		"/QUOTATION/selectOfY.do",
		"/PURCHASE/insertPur00.do",
		"/PURCHASE/SelectPur.jsp",
		"/PURCHASE/getAllPur.do",
		"/PURCHASE/SelectbyDate.jsp",
		"/BILL_OF_PURCHASE/selectOfY.do",
		"/BILL_OF_PURCHASE/SelectBOP0.jsp",
		"/BILL_OF_PURCHASE/getAllBop.do",
		"/BILL_OF_PURCHASE/SelectbyDate.jsp",
		"/BILL_OF_PURCHASE/selectOfN.do",
		"/BILL_OF_PURCHASE/selectOfY2.do",
		"/VALUATION/addVltList.do",
		"/VALUATION/searchList.jsp",
		"/VALUATION/SelectVltAll.jsp",
		"/VALUATION/SelectVltAllForCHK.jsp",
		"/ORDER/order.jsp",
		"/ORDER/OrdsearchList.jsp",
		"/ORDER/SelectOrdAll.jsp",
		"/ORDER/Querydetail_DeleteOrd.do",
		"/ORDER/OrdToShip.do"
		
		
		
		
})
//@WebFilter(urlPatterns = {"/*"})
public class CheckPassCodeFilter implements Filter {

	String requestURI;
	
    public CheckPassCodeFilter() {
    }


	public void destroy() {
	}

	

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		if (request instanceof HttpServletRequest
				&& response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
						
			System.out.println(req.getServletPath());
			if(checkPCode(req)){
				chain.doFilter(request, response);
			}else{
				requestURI = (String) req.getSession().getAttribute("requestURI");
				System.out.println(requestURI);
				
				resp.sendRedirect("javascript:'onclick='history.back(); ");
				System.out.println("沒有權限");
			}						
		}		
	}

	
	private boolean checkPCode(HttpServletRequest req){
		HttpSession session = req.getSession();
		EmpVO empVO = (EmpVO) session.getAttribute("LoginOK");
		String[] passCode = (empVO.getPass_code()).split(",");

		if(checkPCode2(passCode,req)){
			return true;
		}
	
		return false;
	}
	
	private boolean checkPCode2(String[] passCode,HttpServletRequest req){
		HttpSession session = req.getSession();

		String servletPath = req.getServletPath();	
		System.out.println("servletPath="+servletPath);
		servletPath = servletPath.substring(servletPath.lastIndexOf("/"));		
		for(int i=0;i<=(passCode.length)-1;i++){
			System.out.println(passCode[i]);
			if(passCode[i].equals(servletPath) || passCode[i].equals("ALL") ){
				return true;
			}				
		}
		requestURI  = req.getRequestURI();
		session.setAttribute("requestURI", requestURI);
		return false;
	}
	
	
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
