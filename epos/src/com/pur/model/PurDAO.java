package com.pur.model;


import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.pur_detail.model.Pur_detailVO;

import hibernate.util.HibernateUtil;

public class PurDAO implements Pur_Interface {
	
	private static final String GETALL = "from PurVO order by pur_id";
	
	private HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public void insert(PurVO purVO) {
		// TODO Auto-generated method stub
		hibernateTemplate.saveOrUpdate(purVO);
			
	}

	@Override
	public void update(PurVO purVO) {
		// TODO Auto-generated method stub
		hibernateTemplate.saveOrUpdate(purVO);

	}

	@Override
	public void delete(String pur_id) {
		PurVO purVO = (PurVO) hibernateTemplate.get(PurVO.class, pur_id);
		hibernateTemplate.clear();
		hibernateTemplate.delete(purVO);
	}

	@Override
	public void deleteDetail(String pur_id,String prod_id) {
		hibernateTemplate.bulkUpdate("DELETE Pur_detailVO WHERE pur_id=? AND prod_id=?",new Object[]{pur_id,prod_id});	
		
	}
	
	@Override
	public PurVO findByPrimaryKey(String pur_id) {
		// TODO Auto-generated method stub
		PurVO purVO = (PurVO) hibernateTemplate.get(PurVO.class, pur_id);
		return purVO;
	}

	@Override
	public Set<Pur_detailVO> findDetailByPrimaryKey(String pur_id) {
		// TODO Auto-generated method stub
		Set<Pur_detailVO> set = findByPrimaryKey(pur_id).getPurs();
		return set;
	}

	@Override
	public List<PurVO> getAll() {
		// TODO Auto-generated method stub
		List<PurVO> list = null;
		list = hibernateTemplate.find(GETALL);
		return list;
	}
	
	@Override
	public void setStatus(String status, String pur_id){
		hibernateTemplate.bulkUpdate("update PurVO set status=? where pur_id=?",new Object[]{status,pur_id});
	}

}
