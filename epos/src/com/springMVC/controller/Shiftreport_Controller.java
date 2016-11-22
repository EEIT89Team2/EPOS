package com.springMVC.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
import com.company.model.ComService;
import com.company.model.ComVO;
import com.discount.model.DiscountService;
import com.discount.model.DiscountVO;
import com.employee.model.EmpService;
import com.employee.model.EmpVO;
import com.order.model.OrderService;
import com.order.model.OrderVO;
import com.product.model.ProdService;
import com.product.model.ProdVO;
import com.shiftreport.model.ShiftreService;
import com.shiftreport.model.ShiftreVO;


/**
 * Servlet implementation class Shiftreport_Servlet
 */

@Controller
public class Shiftreport_Controller {
	
	private final static ShiftreService shiftreSrv = new ShiftreService();
	private final static OrderService ordSvc = new OrderService();
	private final static DiscountService disSvc = new DiscountService();

	@RequestMapping(method = RequestMethod.POST, value = "/SHIFTREPORT/getOneShiftre.do")
	public String getOneShiftre(ModelMap model,
			@RequestParam("Date") Date date,
			@RequestParam("shift") String shift
			) {
							
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
		 List<String> errorMsgs = new LinkedList<String>();

		if (shift == null || (shift.trim()).length() == 0) {
			errorMsgs.add("請輸入班別");
		}
		
		if (!errorMsgs.isEmpty()) {
		model.addAttribute("message", errorMsgs);
		return "redirect:Index1.jsp";
		}
		/*************************** 2.永續層存取 ***************************************/
		
		ShiftreVO shiftreVO = shiftreSrv.getOne(date,shift);

			if (shiftreVO == null) {
				model.addAttribute("message", "查無此班別報表");
				return "redirect:Index1.jsp";
			}
		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/
			List list = new LinkedList<ShiftreVO>();
			list.add(shiftreVO);
			
		model.addAttribute("list", list);

		return "/SHIFTREPORT/AllShiftre";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/SHIFTREPORT/getAllShiftre.do")
	public String getAllShiftre(ModelMap model) {
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
		List list = shiftreSrv.getAll();

		/*************************** 2.永續層存取 ***************************************/
		
		model.addAttribute("list", list);

		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/

		return "/SHIFTREPORT/AllShiftre";
	}
	

	@RequestMapping(method = RequestMethod.POST,value = "/SHIFTREPORT/insertShiftre.do")
	public String insertShiftre(ModelMap model,HttpServletRequest request) throws Exception, Exception {
		
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

//		Date date = Date.valueOf(request.getParameter("Date"));
		String shift=request.getParameter("shift");
		String emp_id=request.getParameter("emp_id");
//		int cash=Integer.parseInt(request.getParameter("cash"));
//		int coupon=Integer.parseInt(request.getParameter("coupon"));
//		int discount=Integer.parseInt(request.getParameter("discount"));
//		int coins=Integer.parseInt(request.getParameter("coins"));
//		int deal_sum=Integer.parseInt(request.getParameter("deal_sum"));
//		int deal_cost=Integer.parseInt(request.getParameter("deal_cost"));
//		int deal_profit=Integer.parseInt(request.getParameter("deal_profit"));
//		int deal_num=Integer.parseInt(request.getParameter("deal_num"));
//		int shift_sum=Integer.parseInt(request.getParameter("shift_sum"));
//		ProdService prodSrv = new ProdService();
		//日期
		Long now = new java.util.Date().getTime();
		Date date = new Date(now);
		//現金
		int cash = 0;
		//折價券
		int coupon = 0;
		//交易額
		int deal_sum = 0;
		//班別小計(實收交易額)
		int shift_sum = 0;
		//實收現金
		int real_cash = 0;
		//實收折價券
		int real_coupon = 0;
		//交易成本
		int deal_cost = 0;
		//交易淨利
		int deal_profit = 0;
		//零用金
		int coins = 20000;
		//來客數
		int deal_num = (int)ordSvc.GetDayTotalPeople();
		//折扣身分
//		String dis_id = "";
		//折扣%數
//		Float dis_price = 0f;
		//原價
//		int original_price = 0;
		
		List<OrderVO> listAll = ordSvc.getDateAndShift(date, shift);

		for(OrderVO orderVO: listAll){
			cash += (int)orderVO.getCash();
			coupon += orderVO.getCpon_dollar();
			deal_sum += (int)orderVO.getTotal_price();
			
			//以下都是要算折讓
//			dis_id = orderVO.getDiscount();
//			DiscountVO discountVO;
//			discountVO = disSvc.getOneDisc(dis_id);
//			dis_price = discountVO.getDis_price();
//			original_price = original_price+(int) (((int)orderVO.getTotal_price() + orderVO.getCpon_dollar())/dis_price);
		}
		//折讓
		int discount = deal_sum-cash;
		
		ShiftreVO shiftreVO = new ShiftreVO();
		
		shiftreVO.setDate(date);
		shiftreVO.setShift(shift);
		shiftreVO.setEmp_id(emp_id);
		shiftreVO.setCash(cash);
		shiftreVO.setCoupon(coupon);
		shiftreVO.setDiscount(discount);
		shiftreVO.setCoins(coins);
		shiftreVO.setDeal_sum(deal_sum);
		shiftreVO.setDeal_cost(deal_cost);
		shiftreVO.setDeal_profit(deal_profit);
		shiftreVO.setDeal_num(deal_num);
		shiftreVO.setShift_sum(shift_sum);
		shiftreVO.setReal_cash(real_cash);
		shiftreVO.setReal_coupon(real_coupon);
		/*************************** 2.永續層存取 ***************************************/
		shiftreSrv.insertOne(shiftreVO);
		List list = shiftreSrv.getAll();
		request.getSession().setAttribute("list", list);

		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/

		return "redirect:/SHIFTREPORT/AllShiftre.jsp";
	}



	@RequestMapping(method = RequestMethod.POST, value = "/SHIFTREPORT/getShiftreByDate.do")
	public String getShiftreByDate(ModelMap model,HttpServletRequest request,
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
		
		@RequestParam("Date")Date date) {
		
		List<String> errorMsgs = new LinkedList<String>();

		/*************************** 2.永續層存取 ***************************************/
		List list=shiftreSrv.getByDate(date);
		
		if (list.isEmpty()) {
			errorMsgs.add("查無此班別報表");
		}
		// Send the use back to the form, if there were errors
		if (!errorMsgs.isEmpty()) {
			model.addAttribute("message", errorMsgs);
			return "redirect:Index1.jsp";
			}
		
		model.addAttribute("list", list);

		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/

		return "/SHIFTREPORT/AllShiftre";
	}

	
	@RequestMapping(method = RequestMethod.POST,value ={"/SHIFTREPORT/updateDeleteShiftre.do","/updateDeleteShiftre.do"})
	public String updateDeleteShiftre(ModelMap model,HttpServletRequest request,
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			@RequestParam("action")String action,
			@RequestParam("shift") String shift,
			@RequestParam("Date") Date date
			) throws Exception, Exception {
		/*************************** 2.永續層存取 ***************************************/
			if("update".equals(action)){
				ShiftreVO shiftreVO = shiftreSrv.getOne(date,shift);

				model.addAttribute("shiftreVO", shiftreVO);
				return "/SHIFTREPORT/UpdateShiftre";
			}

			if("delete".equals(action)){
				
				shiftreSrv.delete(date,shift);
				List list = shiftreSrv.getAll();

				request.getSession().setAttribute("list", list);
				return "redirect:/SHIFTREPORT/AllShiftre.jsp";
			}
		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/
			return null;
	}
	
	@RequestMapping(method = RequestMethod.POST,value = {"/SHIFTREPORT/updateShiftre.do","/updateShiftre.do"})
	public String updateShiftre(ModelMap model,HttpServletRequest request) throws Exception, Exception {
		/*************************** * 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
		List<String> errorMsgs = new LinkedList<String>();
		request.setAttribute("errorMsgs", errorMsgs);
		
		Date date = Date.valueOf(request.getParameter("Date"));
		String shift=request.getParameter("shift");
		String emp_id=request.getParameter("emp_id");
		int cash=Integer.parseInt(request.getParameter("cash"));
		int coupon=Integer.parseInt(request.getParameter("coupon"));
		int discount=Integer.parseInt(request.getParameter("discount"));
		int coins=Integer.parseInt(request.getParameter("coins"));
		int deal_sum=Integer.parseInt(request.getParameter("deal_sum"));
		int deal_cost=Integer.parseInt(request.getParameter("deal_cost"));
		int deal_profit=Integer.parseInt(request.getParameter("deal_profit"));
		int deal_num=Integer.parseInt(request.getParameter("deal_num"));
		int shift_sum=Integer.parseInt(request.getParameter("shift_sum"));

		ShiftreVO shiftreVO = new ShiftreVO();
		
		shiftreVO.setDate(date);
		shiftreVO.setShift(shift);
		shiftreVO.setEmp_id(emp_id);
		shiftreVO.setCash(cash);
		shiftreVO.setCoupon(coupon);
		shiftreVO.setDiscount(discount);
		shiftreVO.setCoins(coins);
		shiftreVO.setDeal_sum(deal_sum);
		shiftreVO.setDeal_cost(deal_cost);
		shiftreVO.setDeal_profit(deal_profit);
		shiftreVO.setDeal_num(deal_num);
		shiftreVO.setShift_sum(shift_sum);
		
		/*************************** 2.永續層存取 ***************************************/

		shiftreSrv.update(shiftreVO);
		List list = shiftreSrv.getAll();
		request.getSession().setAttribute("list", list);
		
		/*************************** * 3.完成,準備轉交(Send the Success view) ***********/

		return "redirect:/SHIFTREPORT/AllShiftre.jsp";
	
	}
	

	
}


