package com.order.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.order_detail.model.Order_DetailVO;

import hibernate.util.HibernateUtil;

public class OrderSpringDAO implements Order_Interface {

	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 

        this.hibernateTemplate = hibernateTemplate;
    }
    
	@Override
	public OrderVO Select_order_id(String ord_id) throws Exception {
		
		OrderVO orderVO = null;
		orderVO = (OrderVO) hibernateTemplate.get(OrderVO.class,ord_id);
		return orderVO;	
	}

	private static final String GET_ONE_STMT_ORDERDATE = "from OrderVO where ord_date between ? and ?";

	@Override
	public List Select_ord_date(Date s_ord_date, Date e_ord_date) throws Exception {
		
		List<OrderVO> list = null;
		list= hibernateTemplate.find(GET_ONE_STMT_ORDERDATE,new Object[]{s_ord_date,e_ord_date});
			
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
		list= hibernateTemplate.find(GET_ALL_STMT);
			
		return list;
	}

	private static final String GET_ONE_STMT_PRODID = "select prod_id,prod_name,sum(prod_quantity) as quantity from Order_DetailVO where prod_id= ? group by prod_id,prod_name";

	@Override
	public Map Select_prod_id(String prod_id) throws Exception {
		Map map = new HashMap();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<Map> list = null;
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ONE_STMT_PRODID);
			query.setParameter(0, prod_id);
			list = query.list();
			
			map = list.get(0);
			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
		return map;
	}

	@Override
	public void setStatus(String status, String ord_id) {
//		hibernateTemplate.bulkUpdate("update OrderVO set status='"+status+"'where ord_id='"+ord_id+"'");
		hibernateTemplate.bulkUpdate("update OrderVO set status=? where ord_id=?",new Object[]{status,ord_id});
	}

}
