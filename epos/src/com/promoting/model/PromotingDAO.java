package com.promoting.model;

import java.sql.Date;
import java.util.List;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class PromotingDAO implements PromotingDAO_interface{
	
	//private static final String DELETE = "DELETE FROM PromotingVO where pro_prod_id = ? AND pro_begin=?";
	private static final String GET_ONE_STMT = "FROM PromotingVO p where p.pro_prod_id = ? AND p.pro_begin =?";
	private static final String GET_ALL_STMT = "FROM PromotingVO order by pro_prod_id";
	private static final String GET_DATES_STMT = "FROM PromotingVO where pro_begin >=? and pro_end <=? ";
	private static final String GET_NAMES_STMT = "FROM PromotingVO where pro_prod_id like ?";
	private static final String GET_IDS_STMT = "FROM PromotingVO where pro_prod_id between ? and ? ";

	private HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate){
		this.hibernateTemplate = hibernateTemplate;
	}
	
	
	@Override
	public void insert(PromotingVO promotingVO) {
		hibernateTemplate.saveOrUpdate(promotingVO);
		
	}

	@Override
	public void update(PromotingVO promotingVO) {
		hibernateTemplate.update(promotingVO);
		
	}

	@Override
	public void delete(String pro_prod_id, Date pro_begin) {
		List result = hibernateTemplate.find(GET_ONE_STMT, pro_prod_id,pro_begin);
		hibernateTemplate.delete((PromotingVO) result.get(0));
	}

	@Override
	public PromotingVO findByPrimaryKey(String pro_prod_id, Date pro_begin) {
		List result = hibernateTemplate.find(GET_ONE_STMT, pro_prod_id,pro_begin);
		return (PromotingVO) result.get(0);
	}
	
	@Override
	public List<PromotingVO> getAll() {
		List<PromotingVO> list = null;
		list = hibernateTemplate.find(GET_ALL_STMT);
		return list;
	}

	@Override
	public List<PromotingVO> getIds(String pro_prod_id1, String pro_prod_id2) {
		List<PromotingVO> list = null;
		list = hibernateTemplate.find(GET_IDS_STMT, new String[]{pro_prod_id1, pro_prod_id2});		
		return list;
	}

	@Override
	public List<PromotingVO> getDates(Date pro_begin, Date pro_end) {
		List<PromotingVO> list = null;
		list = hibernateTemplate.find(GET_DATES_STMT, new Date[]{pro_begin, pro_end});		
		return list;	
	}

	@Override
	public List<PromotingVO> getNames(String pro_prod_name) {
		List<PromotingVO> list = null;
		list = hibernateTemplate.find(GET_NAMES_STMT,"%"+pro_prod_name+"%");
		return list;	
	}

}
