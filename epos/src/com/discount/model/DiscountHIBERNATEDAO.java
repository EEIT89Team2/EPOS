package com.discount.model;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import hibernate.util.HibernateUtil;

public class DiscountHIBERNATEDAO implements DiscountDAO_interface{
	private static final String GET_ALL_STMT = "FROM DiscountVO order by dis_price";

	@Override
	public void insert(DiscountVO discountVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.save(discountVO);
			session.getTransaction().commit();
		}catch(RuntimeException e){
			session.getTransaction().rollback();
			throw e;
		}			
	}

	@Override
	public void update(DiscountVO discountVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			session.saveOrUpdate(discountVO);
			session.getTransaction().commit();
		}catch(RuntimeException e){
			session.getTransaction().rollback();
			throw e;
		}		
	}

	@Override
	public void delete(String dis_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			DiscountVO discVO = (DiscountVO)session.get(DiscountVO.class, dis_id);
			session.delete(discVO);
			session.getTransaction().commit();
		}catch(RuntimeException e){
			session.getTransaction().rollback();
			throw e;
		}		
	}

	@Override
	public DiscountVO findByPrimaryKey(String dis_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		DiscountVO discVO = null;
		try{
			session.beginTransaction();
			discVO = (DiscountVO)session.get(DiscountVO.class, dis_id);
			session.getTransaction().commit();
		}catch(RuntimeException e){
			session.getTransaction().rollback();
			throw e;
		}
		return discVO;
	}

	@Override
	public List<DiscountVO> getAll() {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<DiscountVO> list = null;
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		}catch(RuntimeException e){
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

}
