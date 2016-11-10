package com.product.model;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;


public class ProdSpringDAO implements ProdDAO_interface {

	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	
	private static final String GET_ALL_STMT = "from ProdVO order by prod_id";
	

	@Override
	public void insert(ProdVO prodVO) {
			hibernateTemplate.saveOrUpdate(prodVO);
	}

	@Override
	public void update(ProdVO prodVO) {
		
		hibernateTemplate.saveOrUpdate(prodVO);
		}

	@Override
	public void delete(String prod_id) {
		ProdVO prodVO = (ProdVO) hibernateTemplate.get(ProdVO.class, prod_id);
		hibernateTemplate.delete(prodVO);
	}
	@Override
	public ProdVO findByPrimaryKey(String prod_id) {
		ProdVO prodVO = null;
		prodVO = (ProdVO) hibernateTemplate.get(ProdVO.class, prod_id);
		return prodVO;	
		}
	@Override
	public List<ProdVO> getAll() {
		List<ProdVO> list = null;
			list= hibernateTemplate.find(GET_ALL_STMT);
			
		return list;	
		}


	@Override
	public List<ProdVO> findByName(String prod_name) {
		
		List<ProdVO> list = null;
		list= hibernateTemplate.find("from ProdVO where prod_name like '%"+prod_name+"%'");
		return list;
		}
	
	@Override
	public List<ProdVO> findByGroup(String prod_group) {
		
		List<ProdVO> list = null;
			list= hibernateTemplate.find("from ProdVO where prod_group like '%"+prod_group+"%'");
			
		return list;
		}
}

