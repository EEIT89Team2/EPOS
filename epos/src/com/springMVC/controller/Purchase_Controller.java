package com.springMVC.controller;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bop.model.BopVO;
import com.bop_detail.model.Bop_detailVO;
import com.product.model.ProdVO;
import com.pur.model.PurService;
import com.pur.model.PurVO;
import com.pur_detail.model.Pur_detailVO;
import com.sun.media.sound.MidiDeviceReceiverEnvelope;

@Controller
public class Purchase_Controller {
	
	private final static PurService purSvc = new PurService();
	
	@RequestMapping(method = RequestMethod.POST,value = {"/insertPur.do","/PURCHASE/insertPur.do"})
	public String insertPur(ModelMap model,HttpServletRequest request)throws Exception{
		/***************************1.接收請求參數 - 輸入格式的錯誤處理******************/
		List<String> errorMsgs = new LinkedList<String>();
		request.setAttribute("errorMsgs", errorMsgs);
		String quo_id = request.getParameter("quo_id");
		if(quo_id == null || quo_id.trim().length()==0){
			errorMsgs.add("詢價單編號請勿空白");
		}
		
		Date pur_date = null;
		try {
			pur_date = Date.valueOf(request.getParameter("pur_date"));
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			pur_date = new Date(System.currentTimeMillis());
			errorMsgs.add("請輸入採購日期");
		}
		
		Date delivery_date = null;
		try {
			delivery_date = Date.valueOf(request.getParameter("delivery_date"));
		} catch (IllegalArgumentException e) {
			delivery_date = new Date(System.currentTimeMillis());
			errorMsgs.add("請輸入送貨日期");
		}
		
		String com_id = request.getParameter("com_id");
		if(com_id == null || com_id.trim().length()==0){
			errorMsgs.add("請輸入廠商編號");
		}
		
		String key_id = request.getParameter("key_id");
		if(key_id == null || key_id.trim().length()==0){
			errorMsgs.add("請輸入建檔人員編號");
		}
		
		Date key_date = null;
		try {
			key_date = Date.valueOf(request.getParameter("key_date"));
		} catch (IllegalArgumentException e) {
			key_date = new Date(System.currentTimeMillis());
			errorMsgs.add("請輸入建檔日期");
		}
		
		String remark = request.getParameter("remark");
		
		String status = request.getParameter("status");
		
		PurVO purVO = new PurVO();
		Set<Pur_detailVO> set = new LinkedHashSet<Pur_detailVO>();
		
		Integer i=1;
		
		while(true){
			String x=i.toString();
			try{
			String prod_id = request.getParameter("prod_id"+x);
			String prod_name = request.getParameter("prod_name"+x);
			int prod_quantity = Integer.valueOf(request.getParameter("prod_quantity"+x));
			int prod_price = Integer.valueOf(request.getParameter("prod_price"+x));
			
			Pur_detailVO pur_detailVO = new Pur_detailVO();
//			pur_detailVO.setProd_id(prod_id);
			pur_detailVO.setProd_name(prod_name);
			pur_detailVO.setProd_quantity(prod_quantity);
			pur_detailVO.setProd_price(prod_price);
			pur_detailVO.setPurVO(purVO);
			ProdVO prodVO = new ProdVO();
			prodVO.setProd_id(prod_id);
//			prodVO.setProd_name(prod_name);						//!!!????
			pur_detailVO.setProdVO(prodVO);
			
			set.add(pur_detailVO);		
			i++;
			
			}catch(Exception e){
				if(i<100){
					i++;
					continue;
					}else
					break;
			}
		}
		
		purVO.setQuo_id(quo_id);
		purVO.setPur_date(pur_date);
		purVO.setDelivery_date(delivery_date);
		purVO.setCom_id(com_id);
		purVO.setKey_id(key_id);
		purVO.setKey_date(key_date);
		purVO.setRemark(remark);
		purVO.setStatus(status);
		purVO.setPurs(set);
		
		/***************************2.開始新增資料***************************************/
		purSvc.insert(purVO);
		List<PurVO> listAll = purSvc.getAll();
		request.getSession().setAttribute("list", listAll);
		/***************************3.新增完成,準備轉交(Send the Success view)***********/
		return "redirect:/PURCHASE/AllPur.jsp"; // 新增成功後轉交output_page.jsp
	}
	
	@RequestMapping(method = RequestMethod.POST,value = {"/updatePur.do","/PURCHASE/updatePur.do"})	
	public String updatePur(ModelMap model,HttpServletRequest request)throws Exception{
		List<String> errorMsgs = new LinkedList<String>();
		request.setAttribute("errorMsgs", errorMsgs);
			String pur_id = request.getParameter("pur_id");
			
			String quo_id = request.getParameter("quo_id");
			if(quo_id == null || quo_id.trim().length()==0){
				errorMsgs.add("詢價單編號請勿空白");
			}
			
			Date pur_date = null;
			try {
				pur_date = Date.valueOf(request.getParameter("pur_date"));
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				pur_date = new Date(System.currentTimeMillis());
				errorMsgs.add("請輸入採購日期");
			}
			
			Date delivery_date = null;
			try {
				delivery_date = Date.valueOf(request.getParameter("delivery_date"));
			} catch (IllegalArgumentException e) {
				delivery_date = new Date(System.currentTimeMillis());
				errorMsgs.add("請輸入送貨日期");
			}
			
			String com_id = request.getParameter("com_id");
			if(com_id == null || com_id.trim().length()==0){
				errorMsgs.add("請輸入廠商編號");
			}
			
			String key_id = request.getParameter("key_id");
			if(key_id == null || key_id.trim().length()==0){
				errorMsgs.add("請輸入建檔人員編號");
			}
			
			Date key_date = null;
			try {
				key_date = Date.valueOf(request.getParameter("key_date"));
			} catch (IllegalArgumentException e) {
				key_date = new Date(System.currentTimeMillis());
				errorMsgs.add("請輸入建檔日期");
			}
			
			String remark = request.getParameter("remark");
			
			String status = request.getParameter("status");
			if (status == null || status.trim().length() == 0) {
				errorMsgs.add("狀態請勿空白");
			}
			String statusCK = "^[N,Y]{1}$";
			if(!status.trim().matches(statusCK) ) { 
				errorMsgs.add("狀態格式:N or Y");
	        }
			PurVO purVO = new PurVO();
			try {
				purSvc.setStatus(status, pur_id);
				
				List listAll = purSvc.getAll();
				
				request.getSession().setAttribute("list", listAll);
				
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			return "/PURCHASE/AllPur";
		}
	
	@RequestMapping(method = RequestMethod.POST,value = {"/getOnePurforDisplay.do","/PURCHASE/getOnePurforDisplay.do"})
	public String getOnePurforDisplay(@RequestParam("pur_id") String pur_id,ModelMap model){
			
			PurVO purVO = purSvc.getOnePur(pur_id);
			List list = new LinkedList<PurVO>();
			list.add(purVO);
			model.addAttribute("list",list);
			
			return"/PURCHASE/AllPur";
			
	}
	@RequestMapping(method = RequestMethod.POST, value = "/PURCHASE/getAllPur.do")
	public String getAllPur(ModelMap model){
		List<PurVO> list = purSvc.getAll();
		model.addAttribute("list", list);
		return"/PURCHASE/AllPur";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = {"/PURCHASE/deleteDetailPur.do","/deleteDetailPur.do"})
	public String deleteDetail(ModelMap model,HttpServletRequest request,
		/***************************1.接收請求參數 - 輸入格式的錯誤處理*******************/
			@RequestParam("prod_id")String prod_id,
			@RequestParam("pur_id") String pur_id	
			){
		/***************************2.開始查詢資料***************************************/		
		purSvc.deleteDetail(pur_id, prod_id);
		Set<Pur_detailVO> detailList = purSvc.getPurDetail(pur_id);
		PurVO purVO = purSvc.getOnePur(pur_id);
		List<PurVO> list =new LinkedList<PurVO>();
		list.add(purVO);
		/***************************3.查詢完成,準備轉交(Send the Success view)***********/
		request.getSession().setAttribute("detailList", detailList);
		request.getSession().setAttribute("list", list);
		return "PURCHASE/AllPur"; // 查詢完成後轉交AllQuo.jsp
	}	

	@RequestMapping(method = RequestMethod.POST, value = "/PURCHASE/DetailUpdateDeletePur.do")
	public String DetailUpdateDeletePur(ModelMap model,HttpServletRequest request,
			@RequestParam("pur_id")String pur_id,
			@RequestParam("action")String action
		){	
		
		if("Detail".equals(action)){
			Set<Pur_detailVO> detailList = purSvc.getPurDetail(pur_id);
			PurVO purVO = purSvc.getOnePur(pur_id);
			LinkedList<PurVO> list = new LinkedList<PurVO>();
			list.add(purVO);
			request.getSession().setAttribute("detailList", detailList);
			request.getSession().setAttribute("list", list);
		    return "redirect:/PURCHASE/AllPurdetail.jsp";	
		}
		
		if("delete".equals(action)){
			purSvc.deletePur(pur_id);
			List<PurVO> list = purSvc.getAll();
			request.getSession().setAttribute("list", list);
			return"redirect:/PURCHASE/AllPur.jsp";
		}
		
		if("update".equals(action)){
			PurVO purVO = purSvc.getOnePur(pur_id);	
			model.addAttribute("purVO", purVO);
			return "/PURCHASE/updatePur";
		}
		return null;
	}	
}






























