package com.springMVC.controller;

import java.io.IOException;
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

import com.bop.model.BopService;
import com.bop.model.BopVO;
import com.bop_detail.model.Bop_detailVO;
import com.quotation.model.QuoVO;
import com.quotation_detail.model.QuoDetailVO;
import com.sun.media.sound.MidiDeviceReceiverEnvelope;


@Controller
public class BILL_OF_PURCHASE_Controller{

	private final static BopService bopSvc = new BopService();
	
	@RequestMapping(method = RequestMethod.POST,value = {"/insertBOP.do","/BILL_OF_PURCHASE/insertBOP.do"})
	public String insertBop(ModelMap model,HttpServletRequest request)throws Exception{
		/***************************1.接收請求參數 - 輸入格式的錯誤處理******************/

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

				String pur_id = request.getParameter("pur_id");
				if(pur_id == null || pur_id.trim().length()==0){
					errorMsgs.add("採購單編號請勿空白");
				}
				
				Date bop_date = null;
				try {
					bop_date = Date.valueOf(request.getParameter("bop_date"));
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					bop_date = new Date(System.currentTimeMillis());
					errorMsgs.add("請輸入進貨日期");
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
				
				BopVO bopVO = new BopVO();
				Set<Bop_detailVO> set = new LinkedHashSet<Bop_detailVO>();
				
				Integer i=1;
				
				while(true){
					String x=i.toString();
					try{
						System.out.println("===================");
					String prod_id = request.getParameter("prod_id"+x);
					String prod_name = request.getParameter("prod_name"+x);
					int prod_quantity = Integer.valueOf(request.getParameter("prod_quantity"+x));
					int prod_price = Integer.valueOf(request.getParameter("prod_price"+x));
					
					Bop_detailVO bop_detailVO = new Bop_detailVO();
					bop_detailVO.setProd_id(prod_id);
					bop_detailVO.setProd_name(prod_name);
					bop_detailVO.setProd_quantity(prod_quantity);
					bop_detailVO.setProd_price(prod_price);
					bop_detailVO.setBopVO(bopVO);
					
					set.add(bop_detailVO);		
					i++;
					
					}catch(Exception e){
						if(i<100){
							i++;
							continue;
							}else
							break;
					}
				}
				
				bopVO.setPur_id(pur_id);
				bopVO.setBop_date(bop_date);
				bopVO.setCom_id(com_id);
				bopVO.setKey_id(key_id);
				bopVO.setKey_date(key_date);
				bopVO.setRemark(remark);
				bopVO.setStatus(status);
				bopVO.setBops(set);
				
				/***************************2.開始新增資料***************************************/
				bopSvc.insert(bopVO);
				List<BopVO> listAll = bopSvc.getAll();
				request.getSession().setAttribute("list", listAll);
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				return "redirect:/BILL_OF_PURCHASE/AllBOP.jsp"; // 新增成功後轉交output_page.jsp
		}
	@RequestMapping(method = RequestMethod.POST,value = {"/updateBOP.do","/BILL_OF_PURCHASE/updateBOP.do"})	
	public String updateBOP(ModelMap model,HttpServletRequest request)throws Exception{
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
				String bop_id = request.getParameter("bop_id");
				
				String pur_id = request.getParameter("pur_id");
				if(pur_id == null || pur_id.trim().length()==0){
					errorMsgs.add("採購單編號請勿空白");
				}
				
				Date bop_date = null;
				try {
					bop_date = Date.valueOf(request.getParameter("bop_date"));
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					bop_date = new Date(System.currentTimeMillis());
					errorMsgs.add("請輸入進貨日期");
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
				BopVO bopVO = new BopVO();

				try {
					bopSvc.setStatus(status, bop_id);
					
					List listAll = bopSvc.getAll();
					
					request.getSession().setAttribute("list", listAll);
					
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				return "/BILL_OF_PURCHASE/AllBOP";
	}

	@RequestMapping(method = RequestMethod.POST,value = {"/getOneBopforDisplay.do","/BILL_OF_PURCHASE/getOneBopforDisplay.do"})
	public String getOneBopforDisplay(@RequestParam("bop_id") String bop_id,ModelMap model){
		
		BopVO bopVO = bopSvc.getOnePur(bop_id);
		List list = new LinkedList<BopVO>();
		list.add(bopVO);
		
		model.addAttribute("list", list);
		
		return"/BILL_OF_PURCHASE/AllBOP";
	}	

	@RequestMapping(method = RequestMethod.POST, value = "/BILL_OF_PURCHASE/getAllBop.do")
	public String getAllBop(ModelMap model){
		List<BopVO> list = bopSvc.getAll();
		model.addAttribute("list", list);
		return"/BILL_OF_PURCHASE/AllBOP";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = {"/BILL_OF_PURCHASE/deleteDetailBOP.do","/deleteDetailBOP.do"})
	public String deleteDetail(ModelMap model,HttpServletRequest request,
		/***************************1.接收請求參數 - 輸入格式的錯誤處理*******************/
			@RequestParam("prod_id")String prod_id,
			@RequestParam("bop_id") String bop_id	
			){
		/***************************2.開始查詢資料***************************************/		
		bopSvc.deleteDetail(bop_id, prod_id);
		Set<Bop_detailVO> detailList = bopSvc.getBopDetail(bop_id);
		BopVO bopVO = bopSvc.getOnePur(bop_id);
		List<BopVO> list =new LinkedList<BopVO>();
		list.add(bopVO);
		/***************************3.查詢完成,準備轉交(Send the Success view)***********/
		request.getSession().setAttribute("detailList", detailList);
		request.getSession().setAttribute("list", list);
		return "BILL_OF_PURCHASE/AllBOP"; // 查詢完成後轉交AllQuo.jsp
	}	

	@RequestMapping(method = RequestMethod.POST, value = "/BILL_OF_PURCHASE/DetailUpdateDeleteBOP.do")
	public String DetailUpdateDeleteBOP(ModelMap model,HttpServletRequest request,
			@RequestParam("bop_id")String bop_id,
			@RequestParam("action")String action
		){	
		
		if("Detail".equals(action)){
			Set<Bop_detailVO> detailList = bopSvc.getBopDetail(bop_id);
			BopVO bopVO = bopSvc.getOnePur(bop_id);
			LinkedList<BopVO> list = new LinkedList<BopVO>();
			list.add(bopVO);
			request.getSession().setAttribute("detailList", detailList);
			request.getSession().setAttribute("list", list);
		    return "redirect:/BILL_OF_PURCHASE/AllBOPdetail.jsp";	
		}
		
		if("delete".equals(action)){
			bopSvc.deletePur(bop_id);
			List<BopVO> list = bopSvc.getAll();
			request.getSession().setAttribute("list", list);
			return"redirect:/BILL_OF_PURCHASE/AllBOP.jsp";
		}
		
		if("update".equals(action)){
			BopVO bopVO = bopSvc.getOnePur(bop_id);	
			model.addAttribute("bopVO", bopVO);
			return "/BILL_OF_PURCHASE/updateBOP";
		}
		return null;
	}	
}