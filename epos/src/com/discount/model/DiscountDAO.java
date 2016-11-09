package com.discount.model;

import org.springframework.orm.hibernate3.HibernateTemplate;
import java.util.List;

public class DiscountDAO implements DiscountDAO_interface{

	private static final String GET_ALL_STMT = "FROM DiscountVO order by dis_price";
	
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	
	@Override
	public void insert(DiscountVO discountVO) {
		hibernateTemplate.saveOrUpdate(discountVO);		
	}

	@Override
	public void update(DiscountVO discountVO) {
		hibernateTemplate.update(discountVO);		
	}

	@Override
	public void delete(String dis_id) {
		DiscountVO discountVO = (DiscountVO) hibernateTemplate.get(DiscountVO.class, dis_id);
		hibernateTemplate.delete(discountVO);		
	}

	@Override
	public DiscountVO findByPrimaryKey(String dis_id) {
		DiscountVO discountVO = (DiscountVO) hibernateTemplate.get(DiscountVO.class, dis_id);
		return discountVO;
	}

	@Override
	public List<DiscountVO> getAll() {
		List<DiscountVO> list = null;
		list = hibernateTemplate.find(GET_ALL_STMT);
		return list;
	}

}
