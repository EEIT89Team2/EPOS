package com.bop.model;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.bop_detail.model.Bop_detailVO;

import hibernate.util.HibernateUtil;

public class BopDAO implements Bop_Interface {
	
	private static final String GETALL = "from BopVO order by bop_id";
	
	private HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void insert(BopVO bopVO) {
		// TODO Auto-generated method stub
		hibernateTemplate.saveOrUpdate(bopVO);

	}

	@Override
	public void update(BopVO bopVO) {
		// TODO Auto-generated method stub
		hibernateTemplate.saveOrUpdate(bopVO);

	}

	@Override
	public void delete(String bop_id) {
		// TODO Auto-generated method stub
		BopVO bopVO = (BopVO) hibernateTemplate.get(BopVO.class, bop_id);
		hibernateTemplate.delete(bopVO);

	}

	@Override
	public void deleteDetail(String bop_id,String prod_id) {
		hibernateTemplate.bulkUpdate("DELETE Bop_detailVO WHERE bop_id=? AND prod_id=?",new Object[]{bop_id,prod_id});	
		
	}
	
	@Override
	public BopVO findByPrimaryKey(String bop_id) {
		// TODO Auto-generated method stub
		BopVO bopVO = (BopVO) hibernateTemplate.get(BopVO.class, bop_id);
		return bopVO;
	}

	@Override
	public Set<Bop_detailVO> findDetailByPrimaryKey(String bop_id) {
		// TODO Auto-generated method stub
		Set<Bop_detailVO> set = findByPrimaryKey(bop_id).getBops();
		return set;
	}

	@Override
	public List<BopVO> getAll() {
		// TODO Auto-generated method stub
		List<BopVO> list = null;
		list = hibernateTemplate.find(GETALL);
		return list;
	}
	
	@Override
	public void setStatus(String status, String bop_id){
		hibernateTemplate.bulkUpdate("update BopVO set status=? where bop_id=?",new Object[]{status,bop_id});
	}

}
