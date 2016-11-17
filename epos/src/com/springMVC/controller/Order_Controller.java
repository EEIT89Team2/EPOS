package com.springMVC.controller;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coupon.model.CouponService;
import com.coupon.model.CouponVO;
import com.discount.model.DiscountService;
import com.discount.model.DiscountVO;
import com.employee.model.EmpService;
import com.employee.model.EmpVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.order.model.OrderService;
import com.order.model.OrderVO;
import com.order_detail.model.Order_DetailVO;
import com.product.model.ProdVO;

@Controller
public class Order_Controller extends HttpServlet {

	private final static OrderService ordSvc = new OrderService();
	private final static MemberService memSvc = new MemberService();
	private final static DiscountService disSvc = new DiscountService();
	private final static CouponService cponSvc = new CouponService();
	private final static EmpService empSvc = new EmpService();

	@RequestMapping(method = RequestMethod.POST, value = { "/addOrder.do", "/ORDER/addOrder.do" })
	public String addOrder(ModelMap model, HttpServletRequest request) throws Exception {

		List<String> errorMsgs = new LinkedList<String>();
		model.addAttribute("errorMsgs", errorMsgs);

		try {
			/************************
			 * 1.接收請求參數 - 輸入格式的錯誤處理
			 *************************/
			// getOrd主檔參數
			// String ord_id = request.getParameter("ord_id");
			String vlt_id = request.getParameter("vlt_id");
			if("".equals(vlt_id)){
				vlt_id = null;
			}
			// if (vlt_id == null || vlt_id.trim().length() == 0) {
			// errorMsgs.add("報價單編號請勿空白");
			// }

			String mem_id = request.getParameter("mem_id");
			if("".equals(mem_id)){
				mem_id = null;
			}
			
			String emp_id = request.getParameter("emp_id");
			// if (mem_id == null || mem_id.trim().length() == 0) {
			// errorMsgs.add("會員編號請勿空白");
			// }
			// String memidCK = "^[M][0-9]{5}$";
			// if(!mem_id.trim().matches(memidCK) ) {
			// errorMsgs.add("會員編號格式EX:M00001");
			// }
			// String ord_date = request.getParameter("ord_date");
			String discount = request.getParameter("discount");
				
			if(mem_id!=null){
				discount="會員";
//				System.out.print(discount);
			}else if(emp_id!=""){
				discount="員工";
//				System.out.print(discount);
			}else if(mem_id==null || emp_id==""){
				discount="一般";
//				System.out.print(discount);
			}
			
			
			String total_price = request.getParameter("total_price_temp");
			String cash = request.getParameter("cash"); 
			if (cash == null || cash.trim().length() == 0) {
				errorMsgs.add("現金請勿空白");
			}

			// String status = request.getParameter("status");
			// if (status == null || status.trim().length() == 0) {
			// errorMsgs.add("狀態請勿空白");
			// }
			// String statusCK = "^[N,Y]{1}$";
			// if(!status.trim().matches(statusCK) ) {
			// errorMsgs.add("狀態格式:N or Y");
			// }

			// String invoice_id = request.getParameter("invoice_id");
			
			int maxInvoNum = ordSvc.getMaxInvoiceId();
			int Invo = maxInvoNum+1;
			String str= String.valueOf(Invo);
			String rx= "RX";
			String invoice_id = rx+str;
			
			if (invoice_id == null || invoice_id.trim().length() == 0) {
				errorMsgs.add("發票號碼請勿空白");
			}

			String ord_um = request.getParameter("ord_um");
			String ord_umCK = "^[0-9]{8}$";
			if (!ord_um.trim().matches(ord_umCK)) {
				errorMsgs.add("統一編號格式EX:04121001");
			}
			
			String cpon_id = request.getParameter("cpon_id");
			if("".equals(cpon_id)){
				cpon_id = null;
			}
			String cpon_dollar = request.getParameter("cpon_dollar");
			if("".equals(cpon_dollar)){
				cpon_dollar="0";
			}
			
			String remark = request.getParameter("remark");
			String shift = request.getParameter("shift");
			
			String key_id = request.getParameter("key_id");
//			String key_id = "E00005";//先寫死
			
			if (key_id == null || key_id.trim().length() == 0) {
				errorMsgs.add("修改人員請勿空白");
			}
			String keyidCK = "^[E][0-9]{5}$";
			if (!key_id.trim().matches(keyidCK)) {
				errorMsgs.add("修改人員格式EX:E00001");
			}

//			String key_date = request.getParameter("key_date");
//			if (key_date == null || key_date.trim().length() == 0) {
//				errorMsgs.add("修改日期請勿空白");
//			}

			java.util.Date utilDate = new java.util.Date();
			java.sql.Date key_date = new java.sql.Date(utilDate.getTime());
			
			// setOrd主檔參數
			OrderVO ordVO = new OrderVO();

			// ordVO.setOrd_id(ord_id);
			ordVO.setVlt_id(vlt_id);
			ordVO.setMem_id(mem_id);
			ordVO.setOrd_date(new java.util.Date(utilDate.getTime()));
			ordVO.setDiscount(discount);
			ordVO.setTotal_price(Double.valueOf(total_price));
			ordVO.setCash(Double.valueOf(cash));
			ordVO.setStatus("N");
			ordVO.setInvoice_id(invoice_id);
			ordVO.setOrd_um(ord_um);
			ordVO.setCpon_id(cpon_id);
			ordVO.setCpon_dollar(Integer.parseInt(cpon_dollar));
			ordVO.setRemark(remark);
			ordVO.setShift(shift);
			ordVO.setKey_id(key_id);
			ordVO.setKey_date(key_date);

			// setOrd明細檔參數
			List<Order_DetailVO> list = new LinkedList<Order_DetailVO>();

			Order_DetailVO ordDetailVO = null;
			ProdVO prodVO = null;

			// 明細檔set集合(多方)
			Set<Order_DetailVO> set = new LinkedHashSet<Order_DetailVO>();

			int i = 1;
			while (true) {
				try {

					ordDetailVO = new Order_DetailVO();

					// 明細檔VO的兩個主key都是對應到另外兩個主檔VO的欄位,所以自己是無權set這兩個key,
					// 需先請主檔VO去set好主key之後,明細檔VO再把主檔VO給set進來,
					// Hibernate再取這兩個主key的值時自己會從被set進去明細檔VO的兩個主檔VO中取出
					ordDetailVO.setOrderVO(ordVO);

					prodVO = new ProdVO();
					prodVO.setProd_id(request.getParameter("prod_id" + String.valueOf(i)));
					ordDetailVO.setProdVO(prodVO);

					// ordDetailVO.setProd_id(request.getParameter("prod_id" +
					// String.valueOf(i)));
					ordDetailVO.setProd_name(request.getParameter("prod_name" + String.valueOf(i)));
					ordDetailVO.setProd_quantity(
							Integer.parseInt(request.getParameter("prod_quantity" + String.valueOf(i))));
					ordDetailVO
							.setProd_price(Double.parseDouble(request.getParameter("prod_price" + String.valueOf(i))));
					// list.add(ordDetailVO);
					set.add(ordDetailVO);
					i++;
				} catch (Exception e) {
					if (i < 100) {
						i++;
						continue;
					} else
						break;
				}
			}

			/*************************** 2.開始新增資料 ***************************************/
			// 將明細檔set進主檔,合併成一個VO
			ordVO.setOrderdetails(set);
			// OrderService ordSvc = new OrderService();
			ordVO = ordSvc.addOrder(ordVO, list);
			List<OrderVO> listAll = ordSvc.getAll();

			request.getSession().setAttribute("list", listAll);

			/****************************
			 * 3.完成,準備轉交(Send the Success view)
			 ***********/
			return "redirect:/ORDER/SelectOrd.jsp";

			/*************************** 其他可能的錯誤處理 **********************************/
		} catch (Exception e) {
			errorMsgs.add(e.getMessage());
			return "/ORDER/order";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/getOrderDate.do", "/ORDER/getOrderDate.do" })
	public String getOrderDate(ModelMap model, HttpServletRequest request) throws Exception {

		List<String> errorMsgs = new LinkedList<String>();
		model.addAttribute("errorMsgs", errorMsgs);

		/************************
		 * 1.接收請求參數 - 輸入格式的錯誤處理
		 *************************/
		Date dateBegin = Date.valueOf(request.getParameter("dateBegin"));
		Date dateEnd = Date.valueOf(request.getParameter("dateEnd"));

		// OrderService ordSvc = new OrderService();

		/*************************** 2.開始查詢資料 *****************************************/
		try {
			List<OrderVO> list = ordSvc.getOneOrderDate(dateBegin, dateEnd);
			request.setAttribute("list", list);

			/*************************** 其他可能的錯誤處理 **********************************/
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "/ORDER/SelectOrd";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/Querydetail_DeleteOrd.do",
			"/ORDER/Querydetail_DeleteOrd.do" })
	public String Querydetail_DeleteOrd(ModelMap model, HttpServletRequest request,
			/***************************
			 * * 1.接收請求參數 - 輸入格式的錯誤處理
			 *************************/
			@RequestParam("action") String action, @RequestParam("ord_id") String ord_id) throws Exception {
		/*************************** 2.開始查詢明細資料 *****************************************/
		if ("Detail".equals(action)) {

			// OrderService ordSvc = new OrderService();
			try {
				List<Order_DetailVO> detailList = ordSvc.Select_order_detailALL(ord_id);
				request.setAttribute("detailList", detailList);

				OrderVO ordVO = ordSvc.Select_order_id(ord_id);
				LinkedList<OrderVO> list = new LinkedList<OrderVO>();
				list.add(ordVO);
				request.setAttribute("list", list);

			} catch (Exception e) {

				e.printStackTrace();
			}
			/***************************
			 * * 3.完成,準備轉交(Send the Success view)
			 ***********/
			return "/ORDER/AllOrdDetail";
		}

		/*************************** 2.開始刪除資料 *****************************************/
		if ("Delete".equals(action)) {
			// OrderService ordSvc = new OrderService();
			try {
				ordSvc.delete(ord_id);

				List<OrderVO> list = ordSvc.getAll();

				model.addAttribute("list", list);

			} catch (Exception e) {

				e.printStackTrace();
			}
			/***************************
			 * * 3.完成,準備轉交(Send the Success view)
			 ***********/
			return "/ORDER/SelectOrd";
		}
		return null;
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/getAllOrd.do", "/ORDER/getAllOrd.do" })
	public String getAllOrd(ModelMap model, HttpServletRequest request) throws Exception {

		/*************************** 2.開始查詢資料 *****************************************/
		// OrderService ordSvc = new OrderService();
		List<OrderVO> list;
		try {
			list = ordSvc.getAll();
			model.addAttribute("list", list);

		} catch (Exception e) {

			e.printStackTrace();
		}
		/***************************
		 * * 3.完成,準備轉交(Send the Success view)
		 ***********/
		return "/ORDER/SelectOrd";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/DeleteOrdDetail.do", "/ORDER/DeleteOrdDetail.do" })
	public String DeleteOrdDetail(ModelMap model, HttpServletRequest request) throws Exception {

		/************************ 1.接收請求參數 *************************/
		String ord_id = request.getParameter("ord_id");
		String prod_id = request.getParameter("prod_id");

		// OrderService ordSvc = new OrderService();
		/*************************** 2.開始刪除資料 *****************************************/
		try {
			ordSvc.deleteDetail(ord_id, prod_id);

			List<OrderVO> detailList = ordSvc.Select_order_detailALL(ord_id);
			model.addAttribute("detailList", detailList);

			/*************************** 2.開始查詢資料 *****************************************/
			// ValuationService shipSrv =new ValuationService();
			OrderVO ordVO = ordSvc.Select_order_id(ord_id);
			List<OrderVO> list = new LinkedList<OrderVO>();
			list.add(ordVO);
			model.addAttribute("list", list);

		} catch (Exception e) {

			e.printStackTrace();
		}
		/***************************
		 * * 3.完成,準備轉交(Send the Success view)
		 ***********/
		return "/ORDER/AllOrdDetail";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/getByOrd_id.do", "/ORDER/getByOrd_id.do" })
	public String getByOrd_id(ModelMap model, HttpServletRequest request) throws Exception {

		List<String> errorMsgs = new LinkedList<String>();
		model.addAttribute("errorMsgs", errorMsgs);

		/************************
		 * 1.接收請求參數 - 輸入格式的錯誤處理
		 *************************/
		String ord_id = request.getParameter("ord_id");
		if (ord_id == null || (ord_id.trim()).length() == 0) {
			errorMsgs.add("請輸入訂單編號");
		}
		if (!errorMsgs.isEmpty()) {
			return "/ORDER/SelectOrder";
		}
		/*************************** 2.開始查詢資料 *****************************************/
		// OrderService ordSvc = new OrderService();
		OrderVO ordVO;
		try {
			ordVO = ordSvc.Select_order_id(ord_id);
			List<OrderVO> list = new LinkedList<OrderVO>();
			list.add(ordVO);
			model.addAttribute("list", list);

		} catch (Exception e) {
			e.printStackTrace();
		}
		/***************************
		 * * 3.完成,準備轉交(Send the Success view)
		 ***********/
		return "/ORDER/SelectOrd";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = { "/getProdNameCount.do", "/ORDER/getProdNameCount.do" })
	public String getProdNameCount(ModelMap model, HttpServletRequest request) throws Exception {

		List<String> errorMsgs = new LinkedList<String>();
		model.addAttribute("errorMsgs", errorMsgs);

		/************************
		 * 1.接收請求參數 - 輸入格式的錯誤處理
		 *************************/
		String prod_id = request.getParameter("prod_id");
		if (prod_id == null || (prod_id.trim()).length() == 0) {
			errorMsgs.add("請輸入商品編號");
		}
		if (!errorMsgs.isEmpty()) {
			return "/ORDER/SelectOrder";
		}
		/*************************** 2.開始查詢資料 *****************************************/
		// OrderService ordSvc = new OrderService();
		List list;
		try {
			list = ordSvc.GetProdNameCount(prod_id);
//			List<OrderVO> list = new LinkedList<OrderVO>();
//			list.add(ordVO);
			model.addAttribute("result", list);

		} catch (Exception e) {
			e.printStackTrace();
		}
		/***************************
		 * * 3.完成,準備轉交(Send the Success view)
		 ***********/
		return "/ORDER/SelectProdQuantity";
	}
	
	

	@RequestMapping(method = RequestMethod.POST, value = { "/setOrdStatus.do", "/ORDER/setOrdStatus.do" })
	public String setOrdStatus(ModelMap model, HttpServletRequest request) throws Exception {

		List<String> errorMsgs = new LinkedList<String>();
		model.addAttribute("errorMsgs", errorMsgs);

		/************************
		 * 1.接收請求參數 - 輸入格式的錯誤處理
		 *************************/
		String ord_id = request.getParameter("ord_id");
		if (ord_id == null || ord_id.trim().length() == 0) {
			errorMsgs.add("訂單編號請勿空白");
		}

		String status = request.getParameter("status");
		if (status == null || status.trim().length() == 0) {
			errorMsgs.add("狀態欄請勿空白");
		}
		String statusCK = "^[N,Y]{1}$";
		if (!status.trim().matches(statusCK)) {
			errorMsgs.add("狀態格式:N or Y");
		}
		if (!errorMsgs.isEmpty()) {
			return "/ORDER/SelectOrder";
		}

		/*************************** 2.開始修改資料 *****************************************/
		// OrderService ordSvc = new OrderService();
		try {
			ordSvc.setStatus(status, ord_id);

			/*************************** 2.開始查詢資料 *****************************************/
			List list = ordSvc.getAll();

			request.getSession().setAttribute("list", list);
			// request.setAttribute("list", list);

		} catch (Exception e) {

			e.printStackTrace();
		}
		/***************************
		 * * 3.完成,準備轉交(Send the Success view)
		 ***********/
		return "/ORDER/SelectOrd";
	}

	@RequestMapping(method = RequestMethod.GET, value = { "/getByProd_id.do", "/ORDER/getByProd_id.do" })
	public void getByProd_id(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF8");
		PrintWriter out = response.getWriter();
		/************************
		 * 1.接收請求參數 - 輸入格式的錯誤處理
		 *************************/
		String prod_id = request.getParameter("prod_id");
		/*************************** 2.開始查詢資料 *****************************************/
		// OrderService ordSvc = new OrderService();
		ProdVO proidVO;
		try {
			proidVO = ordSvc.getOneProdid(prod_id);
			Map map = new HashMap();
			map.put("prod_name", proidVO.getProd_name());
			map.put("prod_price", proidVO.getProd_mkprice());
			String jsonString = JSONValue.toJSONString(map);
			out.println(jsonString);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = { "/getByMem_id.do", "/ORDER/getByMem_id.do" })
	public void getByMem_id(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF8");
		PrintWriter out = response.getWriter();
		/************************
		 * 1.接收請求參數 - 輸入格式的錯誤處理
		 *************************/
		String mem_id = request.getParameter("mem_id");
		/*************************** 2.開始查詢資料 *****************************************/
		// OrderService ordSvc = new OrderService();
		MemberVO memVO;
		try {
			memVO = memSvc.getOneMem(mem_id);
			Map<String, String> map = new HashMap<String, String>();

			if (memVO == null) {
				map.put("error", "查無此帳號");
			} else {

				map.put("mem_id", memVO.getMem_id());
				map.put("mem_name", memVO.getMem_name());
			}
			String jsonString = JSONValue.toJSONString(map);
			out.println(jsonString);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = { "/getByEmp_id.do", "/ORDER/getByEmp_id.do" })
	public void getByEmp_id(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF8");
		PrintWriter out = response.getWriter();
		/************************
		 * 1.接收請求參數 - 輸入格式的錯誤處理
		 *************************/
		String emp_id = request.getParameter("emp_id");
		/*************************** 2.開始查詢資料 *****************************************/
		// OrderService ordSvc = new OrderService();
		EmpVO empVO;
		try {
			empVO = empSvc.getOne(emp_id);
			Map<String, String> map = new HashMap<String, String>();

			if (empVO == null) {
				map.put("error", "查無此員工");
			} else {

				map.put("emp_id", empVO.getEmp_id());
				map.put("emp_name", empVO.getEmp_name());
			}
			String jsonString = JSONValue.toJSONString(map);
			out.println(jsonString);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = { "/getByDis_id.do", "/ORDER/getByDis_id.do" })
	public void getByDis_id(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF8");
		PrintWriter out = response.getWriter();
		/************************
		 * 1.接收請求參數 - 輸入格式的錯誤處理
		 *************************/
		String dis_id = request.getParameter("dis_id");
		/*************************** 2.開始查詢資料 *****************************************/
		// OrderService ordSvc = new OrderService();
		DiscountVO discountVO;
		try {
			discountVO = disSvc.getOneDisc(dis_id);
			Map map = new HashMap();

			map.put("dis_price", discountVO.getDis_price());

			String jsonString = JSONValue.toJSONString(map);
			out.println(jsonString);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = { "/getByCpon_id.do", "/ORDER/getByCpon_id.do" })
	public void getByCpon_id(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF8");
		PrintWriter out = response.getWriter();
		/************************
		 * 1.接收請求參數 - 輸入格式的錯誤處理
		 *************************/
		String cpon_id = request.getParameter("cpon_id");
		/*************************** 2.開始查詢資料 *****************************************/
		// OrderService ordSvc = new OrderService();
		CouponVO couponVO;
		try {
			couponVO = cponSvc.getOneCpon(cpon_id);
			Map map = new HashMap();

			if (couponVO == null) {
				map.put("error", "查無此禮券");
			} else {

				map.put("cpon_dollar", couponVO.getCpon_dollar());
			}

			String jsonString = JSONValue.toJSONString(map);
			out.println(jsonString);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
