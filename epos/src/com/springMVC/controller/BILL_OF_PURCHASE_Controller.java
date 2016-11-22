package com.springMVC.controller;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bop.model.BopService;
import com.bop.model.BopVO;
import com.bop_detail.model.Bop_detailVO;
import com.product.model.ProdService;
import com.product.model.ProdVO;
import com.pur.model.PurVO;

import gvjava.org.json.JSONArray;
import gvjava.org.json.JSONObject;

@Controller
public class BILL_OF_PURCHASE_Controller {

	private final static BopService bopSvc = new BopService();
	private final static ProdService prodSvc = new ProdService();

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/selectOfY2.do" })
	public String selectOfY2(ModelMap model) throws Exception {
		List<BopVO> list = null;
		list = bopSvc.selectOfY2();
		model.addAttribute("list", list);
		return "BILL_OF_PURCHASE/AllBOPofY";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/setStatus.do" })
	public String setStatus(ModelMap model, String status, String bop_id) throws Exception {
		bopSvc.setStatus(status, bop_id);
		List<BopVO> list = null;
		list = bopSvc.selectOfN();
		model.addAttribute("list", list);
		return "BILL_OF_PURCHASE/AllBOPofN";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/setStatus2.do" })
	public String setStatus2(ModelMap model, String status, String bop_id) throws Exception {
		bopSvc.setStatus(status, bop_id);
		BopVO bopVO = null;
		bopVO = bopSvc.getOneBop(bop_id);
		model.addAttribute("bopVO", bopVO);
		return "BILL_OF_PURCHASE/SelectBOP";

	}

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/selectOfY.do" })
	public String selectOfY(ModelMap model) throws Exception {
		List<PurVO> list = null;
		list = bopSvc.selectOfY();
		model.addAttribute("list", list);
		return "BILL_OF_PURCHASE/addBOP0";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/selectOfN.do" })
	public String selectOfN(ModelMap model) throws Exception {
		List<BopVO> list = null;
		list = bopSvc.selectOfN();
		model.addAttribute("list", list);
		return "BILL_OF_PURCHASE/AllBOPofN";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/findByDate.do" })
	public String findByDate(ModelMap model, Date begin_date, Date end_date) throws Exception {
		List<BopVO> list = null;
		list = bopSvc.findByDate(begin_date, end_date);
		model.addAttribute("list", list);
		return "BILL_OF_PURCHASE/AllBOPofDate";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/getOneBop.do" })
	public String getOneBop(ModelMap model, String bop_id) throws Exception {
		BopVO bopVO = bopSvc.getOneBop(bop_id);
		model.addAttribute("bopVO", bopVO);
		return "BILL_OF_PURCHASE/SelectBOP";

	}

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/getOneBopOfN.do" })
	public String getOneBopOfN(ModelMap model, String bop_id) throws Exception {
		BopVO bopVO = bopSvc.getOneBop(bop_id);
		model.addAttribute("bopVO", bopVO);
		return "BILL_OF_PURCHASE/selectOfN";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/getOneBopOfY.do" })
	public String getOneBopOfY(ModelMap model, String bop_id) throws Exception {
		BopVO bopVO = bopSvc.getOneBop(bop_id);
		model.addAttribute("bopVO", bopVO);
		return "BILL_OF_PURCHASE/SelectOfY";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/getThePur.do" })
	public String getThePur(ModelMap model, String pur_id) throws Exception {
		PurVO purVO = bopSvc.getThePur(pur_id);
		model.addAttribute("purVO", purVO);
		return "BILL_OF_PURCHASE/addBOP1";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/insertBOP.do", "/BILL_OF_PURCHASE/insertBOP.do" })
	public String insertBop(ModelMap model, HttpServletRequest request) throws Exception {
		/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 ******************/

		List<String> errorMsgs = new LinkedList<String>();
		request.setAttribute("errorMsgs", errorMsgs);

		String pur_id = request.getParameter("pur_id");
		if (pur_id == null || pur_id.trim().length() == 0) {
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
		if (com_id == null || com_id.trim().length() == 0) {
			errorMsgs.add("請輸入廠商編號");
		}

		String key_id = request.getParameter("key_id");
		if (key_id == null || key_id.trim().length() == 0) {
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

		String status = "N";

		BopVO bopVO = new BopVO();

		Set<Bop_detailVO> set = new LinkedHashSet<Bop_detailVO>();

		Integer i = 1;

		while (true) {
			String x = i.toString();
			try {
				String prod_id = request.getParameter("prod_id" + x);
				String prod_name = request.getParameter("prod_name" + x);
				int prod_quantity = Integer.valueOf(request.getParameter("prod_quantity" + x));
				// System.out.println(prod_quantity);
				int prod_price = Integer.valueOf(request.getParameter("prod_cost" + x));
				// System.out.println("wwwwwwwwwwwwwwwww");
				int prod_lsum = Integer.valueOf(request.getParameter("prod_lsum" + x));
				// System.out.println("jjjjjjjjjjjjjjj");

				Bop_detailVO bop_detailVO = new Bop_detailVO();

				bop_detailVO.setProd_id(prod_id);
				bop_detailVO.setProd_name(prod_name);
				bop_detailVO.setProd_quantity(prod_quantity);
				bop_detailVO.setProd_price(prod_price);
				bop_detailVO.setProd_lsum(prod_lsum);
				bop_detailVO.setBopVO(bopVO);
				// System.out.println(bop_detailVO);
				// System.out.println("zzzzzzzzzzzzz");

				set.add(bop_detailVO);
				i++;

			} catch (Exception e) {
				if (i < 100) {
					i++;
					continue;
				} else
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

		String status2 = "S";

		/*************************** 2.開始新增資料 ***************************************/
		bopSvc.insert(bopVO);
		bopSvc.setStatus2(status2, pur_id);
		List<BopVO> listAll = bopSvc.getAll();
		request.getSession().setAttribute("list", listAll);
		/***************************
		 * 3.新增完成,準備轉交(Send the Success view)
		 ***********/
		return "BILL_OF_PURCHASE/AllBOP"; // 新增成功後轉交output_page.jsp
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/insertProd.do" })
	public String insertProd(ModelMap model, HttpServletRequest request) throws Exception {
		String bop_id = request.getParameter("bop_id");
		String status = "S";

		Integer i = 1;

		while (true) {
			String x = i.toString();
			try {
				String prod_id = request.getParameter("prod_id" + x);
				int prod_quantity = Integer.valueOf(request.getParameter("prod_quantity" + x));
				ProdVO prodVO = prodSvc.getOne(prod_id);
				int s1 = prodVO.getProd_stock();
				s1 = s1 + prod_quantity;
				prodSvc.update2(s1, prod_id);

				i++;

			} catch (Exception e) {
				if (i < 100) {
					i++;
					continue;
				} else
					break;
			}
		}
		
		bopSvc.setStatus(status, bop_id);
		List<ProdVO> list = null;
		list = prodSvc.getAll();
		model.addAttribute("list",list);
		return "BILL_OF_PURCHASE/allProd";

	}

	@RequestMapping(method = RequestMethod.POST, value = { "/updateBOP.do", "/BILL_OF_PURCHASE/updateBOP.do" })
	public String updateBOP(ModelMap model, HttpServletRequest request) throws Exception {
		/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 ******************/

		List<String> errorMsgs = new LinkedList<String>();
		request.setAttribute("errorMsgs", errorMsgs);

		String bop_id = request.getParameter("bop_id");

		String pur_id = request.getParameter("pur_id");
		if (pur_id == null || pur_id.trim().length() == 0) {
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
		if (com_id == null || com_id.trim().length() == 0) {
			errorMsgs.add("請輸入廠商編號");
		}

		String key_id = request.getParameter("key_id");
		if (key_id == null || key_id.trim().length() == 0) {
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

		String status = "N";

		BopVO bopVO = new BopVO();

		Set<Bop_detailVO> set = new LinkedHashSet<Bop_detailVO>();

		Integer i = 1;

		while (true) {
			String x = i.toString();
			try {
				String prod_id = request.getParameter("prod_id" + x);
				String prod_name = request.getParameter("prod_name" + x);
				int prod_quantity = Integer.valueOf(request.getParameter("prod_quantity" + x));
				// System.out.println(prod_quantity);
				int prod_price = Integer.valueOf(request.getParameter("prod_cost" + x));
				// System.out.println("wwwwwwwwwwwwwwwww");
				int prod_lsum = Integer.valueOf(request.getParameter("prod_lsum" + x));
				// System.out.println("jjjjjjjjjjjjjjj");

				Bop_detailVO bop_detailVO = new Bop_detailVO();

				bop_detailVO.setProd_id(prod_id);
				bop_detailVO.setProd_name(prod_name);
				bop_detailVO.setProd_quantity(prod_quantity);
				bop_detailVO.setProd_price(prod_price);
				bop_detailVO.setProd_lsum(prod_lsum);
				bop_detailVO.setBopVO(bopVO);
				// System.out.println(bop_detailVO);
				// System.out.println("zzzzzzzzzzzzz");

				set.add(bop_detailVO);
				i++;

			} catch (Exception e) {
				if (i < 100) {
					i++;
					continue;
				} else
					break;
			}
		}

		bopVO.setBop_id(bop_id);
		bopVO.setPur_id(pur_id);
		bopVO.setBop_date(bop_date);
		bopVO.setCom_id(com_id);
		bopVO.setKey_id(key_id);
		bopVO.setKey_date(key_date);
		bopVO.setRemark(remark);
		bopVO.setStatus(status);
		bopVO.setBops(set);

		/*************************** 2.開始新增資料 ***************************************/
		bopSvc.update(bopVO);
		BopVO bopVO2 = null;
		bopVO2 = bopSvc.getOneBop(bop_id);
		model.addAttribute("bopVO", bopVO2);

		/***************************
		 * 3.新增完成,準備轉交(Send the Success view)
		 ***********/
		return "BILL_OF_PURCHASE/SelectBOP"; // 新增成功後轉交output_page.jsp
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/getOneBopforDisplay.do",
			"/BILL_OF_PURCHASE/getOneBopforDisplay.do" })
	public String getOneBopforDisplay(@RequestParam("bop_id") String bop_id, ModelMap model) {

		BopVO bopVO = bopSvc.getOneBop(bop_id);
		List list = new LinkedList<BopVO>();
		list.add(bopVO);

		model.addAttribute("list", list);

		return "/BILL_OF_PURCHASE/AllBOP";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/BILL_OF_PURCHASE/getAllBop.do")
	public String getAllBop(ModelMap model) {
		List<BopVO> list = bopSvc.getAll();
		model.addAttribute("list", list);
		return "/BILL_OF_PURCHASE/AllBOP";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/BILL_OF_PURCHASE/deleteDetailBOP.do",
			"/deleteDetailBOP.do" })
	public String deleteDetail(ModelMap model, HttpServletRequest request,
			/***************************
			 * 1.接收請求參數 - 輸入格式的錯誤處理
			 *******************/
			@RequestParam("prod_id") String prod_id, @RequestParam("bop_id") String bop_id) {
		/*************************** 2.開始查詢資料 ***************************************/
		bopSvc.deleteDetail(bop_id, prod_id);
		Set<Bop_detailVO> detailList = bopSvc.getBopDetail(bop_id);
		BopVO bopVO = bopSvc.getOneBop(bop_id);
		List<BopVO> list = new LinkedList<BopVO>();
		list.add(bopVO);
		/***************************
		 * 3.查詢完成,準備轉交(Send the Success view)
		 ***********/
		request.getSession().setAttribute("detailList", detailList);
		request.getSession().setAttribute("list", list);
		return "BILL_OF_PURCHASE/AllBOP"; // 查詢完成後轉交AllQuo.jsp
	}

	@RequestMapping(method = RequestMethod.POST, value = "/BILL_OF_PURCHASE/DetailUpdateDeleteBOP.do")
	public String DetailUpdateDeleteBOP(ModelMap model, HttpServletRequest request,
			@RequestParam("bop_id") String bop_id, @RequestParam("action") String action) {

		if ("Detail".equals(action)) {
			Set<Bop_detailVO> detailList = bopSvc.getBopDetail(bop_id);
			BopVO bopVO = bopSvc.getOneBop(bop_id);
			LinkedList<BopVO> list = new LinkedList<BopVO>();
			list.add(bopVO);
			request.getSession().setAttribute("detailList", detailList);
			request.getSession().setAttribute("list", list);
			return "redirect:/BILL_OF_PURCHASE/AllBOPdetail.jsp";
		}

		if ("delete".equals(action)) {
			bopSvc.deletePur(bop_id);
			List<BopVO> list = bopSvc.getAll();
			request.getSession().setAttribute("list", list);
			return "redirect:/BILL_OF_PURCHASE/AllBOP.jsp";
		}

		if ("update".equals(action)) {
			BopVO bopVO = bopSvc.getOneBop(bop_id);
			model.addAttribute("bopVO", bopVO);
			return "/BILL_OF_PURCHASE/updateBOP";
		}
		return null;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/ANDROID/getBOP.do")
	public void androidBOP(@RequestParam("bop_id") String bop_id, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception, Exception {
		/***************************
		 * * 1.接收請求參數 - 輸入格式的錯誤處理
		 *************************/

		/*************************** 2.永續層存取 ***************************************/
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Set<Bop_detailVO> set=null;
		
		try{
		 set = bopSvc.getBopDetail(bop_id);
		}catch(Exception e){
			out.print("查無此進貨單");
		}
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jSONObject;

		for (Bop_detailVO bop_detailVO : set) {

			String bop_detailJson = null;
			bop_detailVO.setBop_id(bop_id);
			bop_detailVO.setBopVO(null);
			jSONObject = new JSONObject(bop_detailVO);

			jsonArray.put(jSONObject);

		}
		
		 String bop_detailJsonArray = jsonArray.toString();
		 System.out.println(bop_detailJsonArray);
		 out.print(bop_detailJsonArray);
		
		
		


		/***************************
		 * * 3.完成,準備轉交(Send the Success view)
		 ***********/

	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/ANDROID/getBopOfY2.do")
	public void androidBopOfY2(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception, Exception {
		/***************************
		 * * 1.接收請求參數 - 輸入格式的錯誤處理
		 *************************/

		/*************************** 2.永續層存取 ***************************************/
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		List<BopVO> list=null;
		
		try{
			list = bopSvc.selectOfY2();
		}catch(Exception e){
			out.print("查無此進貨單");
		}
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jSONObject;

		for (BopVO bopVO : list) {

			bopVO.setBops(null);
			jSONObject = new JSONObject(bopVO);

			jsonArray.put(jSONObject);

		}
		
		 String bop_detailJsonArray = jsonArray.toString();
		 System.out.println(bop_detailJsonArray);
		 out.print(bop_detailJsonArray);
		

		/***************************
		 * * 3.完成,準備轉交(Send the Success view)
		 ***********/

	}
	
	@RequestMapping(method = RequestMethod.GET, value = { "/ANDROID/goInsertProd.do" })
	public void androidInsertProd(ModelMap model, HttpServletRequest request) throws Exception {
		String bop_id = request.getParameter("bop_id");
		String status = "S";

		Set<Bop_detailVO> set = bopSvc.getBopDetail(bop_id);
		for(Bop_detailVO bop_detailVO:set){
			String prod_id =bop_detailVO.getProd_id();
			int prod_quantity=bop_detailVO.getProd_quantity();
			ProdVO prodVO = prodSvc.getOne(prod_id);
			int s1 = prodVO.getProd_stock();
			s1 = s1 + prod_quantity;
			prodSvc.update2(s1, prod_id);
		}
		bopSvc.setStatus(status, bop_id);

		
//		Integer i = 1;
//
//		while (true) {
//			String x = i.toString();
//			try {
//				String prod_id = request.getParameter("prod_id" + x);
//				int prod_quantity = Integer.valueOf(request.getParameter("prod_quantity" + x));
//				ProdVO prodVO = prodSvc.getOne(prod_id);
//				int s1 = prodVO.getProd_stock();
//				s1 = s1 + prod_quantity;
//				prodSvc.update2(s1, prod_id);
//
//				i++;
//
//			} catch (Exception e) {
//				if (i < 100) {
//					i++;
//					continue;
//				} else
//					break;
//			}
//		}
		

	}


}