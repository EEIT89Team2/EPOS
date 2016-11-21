package com.order.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import com.employee.model.EmpVO;
import com.order_detail.model.Order_DetailVO;
import com.product.model.ProdVO;
import hibernate.util.HibernateUtil;

public class OrderSpringDAO implements Order_Interface {

	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {

		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public OrderVO Select_order_id(String ord_id) throws Exception {

		OrderVO orderVO = null;
		orderVO = (OrderVO) hibernateTemplate.get(OrderVO.class, ord_id);
		return orderVO;
	}

	private static final String GET_ONE_STMT_ORDERDATE = "from OrderVO where ord_date between ? and ?";

	@Override
	public List Select_ord_date(Date s_ord_date, Date e_ord_date) throws Exception {

		List<OrderVO> list = null;
		list = hibernateTemplate.find(GET_ONE_STMT_ORDERDATE, new Object[] { s_ord_date, e_ord_date });

		return list;
	}

	@Override
	public OrderVO addOrder(OrderVO orderVO, List<Order_DetailVO> order_detailVO_list) throws Exception {

		hibernateTemplate.save(orderVO);

		return orderVO;
	}

	@Override
	public void update(OrderVO orderVO, Order_DetailVO order_detailVO) throws Exception {

	}

	@Override
	public void delete(String order_id) throws Exception {

		OrderVO orderVO = (OrderVO) hibernateTemplate.get(OrderVO.class, order_id);
		hibernateTemplate.delete(orderVO);
	}

	private static final String GET_ALL_STMT = "from OrderVO order by ord_id";

	@Override
	public List<OrderVO> getAll() throws Exception {

		List<OrderVO> list = null;
		list = hibernateTemplate.find(GET_ALL_STMT);

		return list;
	}

	private static final String GET_PROD_NAME_COUNT = "select prod_id,prod_name,sum(prod_quantity) as quantity from Order_DetailVO where prod_id= ? group by prod_id,prod_name";

	@Override
	public List GetProdNameCount(String prod_id) throws Exception {

		List list = null;

		list = hibernateTemplate.find(GET_PROD_NAME_COUNT);

		return list;

	}

	private static final String GET_DAY_TOTAL_PRICE = "select sum(total_price) as total_price_day from OrderVO where key_date = ?";

	@Override
	public double GetDayTotalPrice() throws Exception {

		List list = null;

		java.util.Date now = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(now.getTime());
		// SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		double i = 0;

		list = hibernateTemplate.find(GET_DAY_TOTAL_PRICE, new Object[] { sqlDate });

		if (list.get(0) != null)
			i = (double) list.get(0);

		return i;
	}

	private static final String GET_DAY_TOTAL_PEOPLE = "select count(ord_id) as total_people from OrderVO where key_date = ?";

	@Override
	public long GetDayTotalPeople() throws Exception {

		List list = null;

		java.util.Date now = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(now.getTime());
		// SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		long i = 0;

		list = hibernateTemplate.find(GET_DAY_TOTAL_PEOPLE, new Object[] { sqlDate });

		if (list.get(0) != null)
			i = (long) list.get(0);

		return i;
	}

	@Override
	public void setStatus(String status, String ord_id) {
		// hibernateTemplate.bulkUpdate("update OrderVO set
		// status='"+status+"'where ord_id='"+ord_id+"'");
		hibernateTemplate.bulkUpdate("update OrderVO set status=? where ord_id=?", new Object[] { status, ord_id });
	}

	@Override
	public ProdVO getOneProdid(String prod_id) throws Exception {

		ProdVO prodVO = null;
		prodVO = (ProdVO) hibernateTemplate.get(ProdVO.class, prod_id);
		return prodVO;

	}

	@Override
	public EmpVO getOneMemid(String mem_id) throws Exception {

		EmpVO empVO = null;
		empVO = (EmpVO) hibernateTemplate.get(EmpVO.class, mem_id);
		return empVO;
	}

	private static final String GET_MAX_INVOICE_ID_STMT = "select max(substring(invoice_id,3,8)) from OrderVO";

	public int getMaxInvoiceId() throws Exception {

		List list = null;
		int i = 0;

		list = hibernateTemplate.find(GET_MAX_INVOICE_ID_STMT);

		if (list.get(0) != null)
			i = Integer.parseInt((String) list.get(0));
		return i;
	}

	private static final String GET_ONE_TOP_ORDID = "select ord_id from OrderVO order by ord_id desc";

	@Override
	public String getOneTopOrdId() throws Exception {

		List list = null;
		String str = null; 
		list = hibernateTemplate.find(GET_ONE_TOP_ORDID);
		
		if (list.get(0) != null)
			str = String.valueOf((String) list.get(0));
		
		return str;

	}
	
	private static final String GET_ONE_STMT_ORDERDATEANDSHIFT = "from OrderVO where ord_date = ? and shift = ?";

	@Override
	public List Select_ord_date_shift(Date s_ord_date, String shift) throws Exception {

		List<OrderVO> list = null;
		list = hibernateTemplate.find(GET_ONE_STMT_ORDERDATEANDSHIFT,s_ord_date, shift);

		return list;
	}

}
