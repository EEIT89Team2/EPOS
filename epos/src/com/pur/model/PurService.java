package com.pur.model;

import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bop.model.Bop_Interface;
import com.pur_detail.model.Pur_detailVO;

public class PurService {
	
	private Pur_Interface dao;
	
	public PurService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
		dao =(Pur_Interface) context.getBean("purDAO");
	}
	
	public PurVO insert(PurVO purVO) {
		dao.insert(purVO);
		return purVO;
	}
	
	public PurVO update(PurVO purVO) {
		dao.update(purVO);
		return purVO;
	}
	
	public void deletePur(String pur_id) {
		dao.delete(pur_id);
	}
	
	public void deleteDetail(String pur_id,String prod_id) {
		dao.deleteDetail(pur_id,prod_id);
	}	
	
	public PurVO getOnePur(String pur_id) {
		PurVO purVO = dao.findByPrimaryKey(pur_id);
		return purVO;
	}
	
	public void setStatus(String status, String pur_id){

		dao.setStatus(status, pur_id);
	}
	
	public Set<Pur_detailVO> getPurDetail(String pur_id) {
		Set<Pur_detailVO> set = dao.findDetailByPrimaryKey(pur_id);
		return set;
	}
	
	public List<PurVO> getAll() {
		List<PurVO> list = dao.getAll();
		return list;
	}

}








