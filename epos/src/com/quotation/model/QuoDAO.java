package com.quotation.model;

import java.sql.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.quotation.model.QuoVO;
import com.quotation_detail.model.QuoDetailVO;
import com.shipments.model.ShipVO;

import hibernate.util.HibernateUtil;


public class QuoDAO implements Quo_Interface{

	private static final String GET_ALL_STMT = "from QuoVO order by quo_id";

	private static final String GET_ONE_STMT_ByDate = "from QuoVO where ship_date between ? and ?";
	
	private static final String GET_ONE_STMT_ByReqId = "from QuoVO where req_id = ?";

	private HibernateTemplate hibernateTemplate;
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void insert(QuoVO quoVO,List<QuoDetailVO> list) {
		hibernateTemplate.save(quoVO);
	}			

	@Override
	public void update(QuoVO quoVO) {

		hibernateTemplate.update(quoVO);
	}

	@Override
	public void delete(String quo_id) {
		QuoVO quoVO = (QuoVO) hibernateTemplate.get(QuoVO.class, quo_id);
		hibernateTemplate.delete(quoVO);
	}
	
	@Override
	public QuoVO findByPrimaryKey(String quo_id) {
		QuoVO quoVO =null;
		
			quoVO =(QuoVO) hibernateTemplate.get(QuoVO.class, quo_id);
		return quoVO;
	}
	
	@Override
	public List<QuoVO> findByReqid(String req_id) {
		List<QuoVO> list = null;
			list = hibernateTemplate.find(GET_ONE_STMT_ByReqId,req_id);
		return list;
	}

	@Override
	public List<QuoVO> getAll() {

		List<QuoVO> list = null;
			list = hibernateTemplate.find(GET_ALL_STMT);
		
		return list;
	}
	
	@Override
	public List<QuoVO> findByDate(Date dateBegin, Date dateEnd) {
		List<QuoVO> list = null;
		list= hibernateTemplate.find(GET_ONE_STMT_ByDate,new Object[]{dateBegin,dateEnd});
			
		return list;
	}
	
	@Override
	public void setStatus(String status, String quo_id) throws Exception {
		hibernateTemplate.bulkUpdate("update QuoVO set status=? where quo_id=?",new Object[]{status,quo_id});
	}

}
