package com.springMVC.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.employee.model.EmpService;
import com.employee.model.EmpVO;


/**
 * Servlet implementation class Employee_Servlet
 */

@Controller
public class Employee_Controller {
	
	private final static EmpService empSrv =new EmpService();
//	private  EmpService empSrv;
//	
//	public EmpService getEmpSrv() {
//		return empSrv;
//	}
//
//	public void setEmpSrv(EmpService empSrv) {
//		this.empSrv = empSrv;
//	}

//	@RequestMapping(method = RequestMethod.GET, value = "/i")
//	public String addEmp(ModelMap model) {
//		System.out.println("OK");
//		EmpVO empVO = new EmpVO();
//		model.addAttribute("empVO", empVO);
//		return "/Index1";
//	}

	@RequestMapping(method = RequestMethod.POST, value = "/EMPLOYEE/getOneEmp.do")
	public String getOneEmp(@RequestParam("emp_id") String emp_id, ModelMap model) {
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
		 List<String> errorMsgs = new LinkedList<String>();

		if (emp_id == null || emp_id == "") {
			errorMsgs.add("請輸入員工編號");
		}
		if (!errorMsgs.isEmpty()) {
		model.addAttribute("message", errorMsgs);
		return "redirect:/EMPLOYEE/employee.jsp";
		}
		/*************************** 2.永續層存取 ***************************************/
//		EmpService empSrv = new EmpService();
		EmpVO empVO;
		List list = new LinkedList<EmpVO>();

		try {
			empVO = empSrv.getOne(emp_id);

			if (empVO == null) {
				model.addAttribute("message", "查無資料");
				return "redirect:/EMPLOYEE/employee.jsp";
			}
		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/
			list.add(empVO);

		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("list", list);

		return "/EMPLOYEE/AllEmp";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/EMPLOYEE/getAllEmp.do")
	public String getAllEmp(ModelMap model) {
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

		/*************************** 2.永續層存取 ***************************************/
		EmpService empSrv = new EmpService();
		List<EmpVO> list = null;
		try {
			list = empSrv.getAll();
		} catch (IOException e) {

			e.printStackTrace();
		}
		model.addAttribute("list", list);

		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/

		return "/EMPLOYEE/AllEmp";
	}
	

	@RequestMapping(method = RequestMethod.POST,value = "/EMPLOYEE/insertEmp.do")
	public String insertEmp(ModelMap model,HttpServletRequest request) throws Exception, Exception {
		
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

		List<String> errorMsgs = new LinkedList<String>();
		request.setAttribute("errorMsgs", errorMsgs);

		String emp_pwd = request.getParameter("emp_pwd");
		String emp_name = request.getParameter("emp_name");
		String emp_sex = request.getParameter("emp_sex");
		String emp_idnum = request.getParameter("emp_idnum");
		String emp_addr = request.getParameter("emp_addr");
		String emp_mail = request.getParameter("emp_mail");
		String emp_phone = request.getParameter("emp_phone");
		Date emp_bday = Date.valueOf(request.getParameter("emp_bday"));
		Date emp_reg = Date.valueOf(request.getParameter("emp_reg"));
		Date emp_due;
		if (request.getParameter("emp_due").length() == 0) {
			emp_due = null;
		} else {
			emp_due = Date.valueOf(request.getParameter("emp_due"));
		}

		Part filePart1 = request.getPart("picture");
		InputStream in = filePart1.getInputStream();
		byte[] picture = new byte[in.available()];
		in.read(picture);
		
		String key_id = request.getParameter("key_id");
		long nowD = new java.util.Date().getTime();
		Date key_date = new Date(nowD);

		EmpVO empVO = new EmpVO();

		empVO.setEmp_pwd(emp_pwd);
		empVO.setEmp_name(emp_name);
		empVO.setEmp_sex(emp_sex);
		empVO.setEmp_idnum(emp_idnum);
		empVO.setEmp_addr(emp_addr);
		empVO.setEmp_mail(emp_mail);
		empVO.setEmp_phone(emp_phone);
		empVO.setEmp_bday(emp_bday);
		empVO.setEmp_reg(emp_reg);
		empVO.setEmp_due(emp_due);
		empVO.setPicture(Base64.getEncoder().encodeToString(picture));
		empVO.setKey_id(key_id);
		empVO.setKey_date(key_date);

		/*************************** 2.永續層存取 ***************************************/
//		EmpService empSrv = new EmpService();
		List<EmpVO> list = null;
		try {
			empSrv.insertOne(empVO);
			list = empSrv.getAll();
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("list", list);

		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/

		return "redirect:/EMPLOYEE/AllEmp.jsp";
	}



	@RequestMapping(method = RequestMethod.POST, value = "/EMPLOYEE/getEmpByName.do")
	public String getEmpByName(ModelMap model,HttpServletRequest request,
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
		
		@RequestParam("emp_name")String emp_name) {
		List<String> errorMsgs = new LinkedList<String>();
		
		if (emp_name == null || emp_name == "") {
			errorMsgs.add("請輸入員工姓名");
		}
		if (!errorMsgs.isEmpty()) {
		model.addAttribute("message", errorMsgs);
		return "redirect:/EMPLOYEE/employee.jsp";
		}
		/*************************** 2.永續層存取 ***************************************/
//		EmpService empSrv = new EmpService();
		List list=empSrv.getByName(emp_name);

		if (list.isEmpty()) {
			errorMsgs.add("查無此員工");
		}
		// Send the use back to the form, if there were errors
		if (!errorMsgs.isEmpty()) {
			model.addAttribute("message", errorMsgs);
			return "redirect:/EMPLOYEE/employee.jsp";
			}
		
		request.getSession().setAttribute("list", list);

		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/

		return "redirect:/EMPLOYEE/AllEmp.jsp";
	}

	
	@RequestMapping(method = RequestMethod.POST,value ={"/updateDeleteEmp.do","/EMPLOYEE/updateDeleteEmp.do"})
	public String updateDeleteEmp(ModelMap model,HttpServletRequest request,
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			@RequestParam("action")String action,
			@RequestParam("emp_id") String emp_id
			) throws Exception, Exception {
		/*************************** 2.永續層存取 ***************************************/
			if("update".equals(action)){
//				EmpService empSrv = new EmpService();
				EmpVO empVO=null;
				try {
					empVO = empSrv.getOne(emp_id);
				} catch (IOException e) {
					e.printStackTrace();
				}					
				model.addAttribute("empVO", empVO);
				return "/EMPLOYEE/UpdateEmp";
			}

			if("delete".equals(action)){
//				EmpService empSrv = new EmpService();
				empSrv.delete(emp_id);
				
				List list = empSrv.getAll();
				
				request.getSession().setAttribute("list", list);
				request.setAttribute("list", list);
				return "redirect:/EMPLOYEE/AllEmp.jsp";
			}
		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/
			return null;
	}
	
	@RequestMapping(method = RequestMethod.POST,value = {"/EMPLOYEE/updateEmp.do","/updateEmp.do"})
	public String updateEmp(ModelMap model,HttpServletRequest request) throws Exception, Exception {
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
		List<String> errorMsgs = new LinkedList<String>();
		request.setAttribute("errorMsgs", errorMsgs);

		String emp_id = request.getParameter("emp_id");
		String emp_pwd = request.getParameter("emp_pwd");
		String emp_name = request.getParameter("emp_name");
		String emp_sex = request.getParameter("emp_sex");
		String emp_idnum = request.getParameter("emp_idnum");
		String emp_addr = request.getParameter("emp_addr");
		String emp_mail = request.getParameter("emp_mail");
		String emp_phone = request.getParameter("emp_phone");
		Date emp_bday = Date.valueOf(request.getParameter("emp_bday"));
		Date emp_reg = Date.valueOf(request.getParameter("emp_reg"));
		
		Date emp_due;
		if (request.getParameter("emp_due").length() == 0) {
			emp_due = null;
		} else {
			emp_due = Date.valueOf(request.getParameter("emp_due"));
		}

		Part filePart1 = request.getPart("newPicture");
		String picture;
		if(filePart1.getSize()!=0){
		InputStream in = filePart1.getInputStream();
		byte[] BytePicture = new byte[in.available()];
		in.read(BytePicture);
		picture=Base64.getEncoder().encodeToString(BytePicture);
		
		}else{
		picture=request.getParameter("picture");
		}
		
		String key_id = request.getParameter("key_id");
		String pass_code=request.getParameter("pass_code");
		
		long nowD = new java.util.Date().getTime();
		Date key_date = new Date(nowD);

		EmpVO empVO = new EmpVO();
		
		empVO.setEmp_id(emp_id);
		empVO.setEmp_pwd(emp_pwd);
		empVO.setEmp_name(emp_name);
		empVO.setEmp_sex(emp_sex);
		empVO.setEmp_idnum(emp_idnum);
		empVO.setEmp_addr(emp_addr);
		empVO.setEmp_mail(emp_mail);
		empVO.setEmp_phone(emp_phone);
		empVO.setEmp_bday(emp_bday);
		empVO.setEmp_reg(emp_reg);
		empVO.setEmp_due(emp_due);
		empVO.setPicture(picture);
		empVO.setKey_id(key_id);
		empVO.setKey_date(key_date);
		empVO.setPass_code(pass_code);
		
		/*************************** 2.永續層存取 ***************************************/

//		EmpService empSrv = new EmpService();
		empSrv.update(empVO);
		List list = empSrv.getAll();
		request.getSession().setAttribute("list", list);

		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/

		return "redirect:/EMPLOYEE/AllEmp.jsp";
	
	}
	
	@RequestMapping(method = RequestMethod.POST, value = {"/EMPLOYEE/setPassCode.do","/setPassCode.do"})
	public String setPassCode(ModelMap model,HttpServletRequest request) {
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
	
		
		String emp_id=request.getParameter("emp_id") ;
		String[] pass_codes = request.getParameterValues("pass_code");
		
		String pass_code="";
		for(int i=0;i<pass_codes.length;i++){
			if(i==pass_codes.length-1)
				pass_code+=pass_codes[i];
			else
			pass_code=pass_code+pass_codes[i]+",";
			
		}
		
		System.out.println(pass_code);
		/*************************** 2.永續層存取 ***************************************/
//		EmpService empSrv = new EmpService();
		empSrv.setPassCode(pass_code, emp_id);
		
		List list=null;
		try {
			list = empSrv.getAll();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("list", list);

		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/
			
		return "redirect:/EMPLOYEE/AllEmp.jsp";
	}

}


