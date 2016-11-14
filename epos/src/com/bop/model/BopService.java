package com.bop.model;

import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bop_detail.model.Bop_detailVO;



public class BopService {
	
	private Bop_Interface dao;
		
		public BopService() {
			ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
			dao =(Bop_Interface) context.getBean("bopDAO");
		}
		
		public BopVO insert(BopVO bopVO) {
			dao.insert(bopVO);
			return bopVO;
		}
		
		public BopVO update(BopVO bopVO) {
			dao.update(bopVO);
			return bopVO;
		}
		
		public void deletePur(String bop_id) {
			dao.delete(bop_id);
		}
		public void deleteDetail(String bop_id,String prod_id) {
			dao.deleteDetail(bop_id,prod_id);
		}		
		
		public BopVO getOnePur(String bop_id) {
			BopVO bopVO = dao.findByPrimaryKey(bop_id);
			return bopVO;
		}
		
		public void setStatus(String status, String bop_id){

			dao.setStatus(status, bop_id);
		}
		
		public Set<Bop_detailVO> getBopDetail(String bop_id) {
			Set<Bop_detailVO> set = dao.findDetailByPrimaryKey(bop_id);
			return set;
		}
		
		public List<BopVO> getAll() {
			List<BopVO> list = dao.getAll();
			return list;
		}
	
}
