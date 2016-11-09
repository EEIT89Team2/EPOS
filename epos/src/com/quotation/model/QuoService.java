package com.quotation.model;

import java.sql.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.quotation_detail.model.QuoDetailVO;

public class QuoService {
	
	private Quo_Interface dao;
	
	public QuoService(){
//		dao = new QuoDAO();
//		dao = new QuoJNDI();
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
		dao =(Quo_Interface) context.getBean("QuoDAO");
	}
	
	public void addQuo(QuoVO quoVO,List<QuoDetailVO> list){
		dao.insert(quoVO,list);
	}
	
	public void updateQuo(QuoVO quoVO){
		
		dao.update(quoVO);
	}
	
	public void delete(String quo_id){
		dao.delete(quo_id);
	}
	
	public QuoVO getByQuoId(String quo_id){
		return dao.findByPrimaryKey(quo_id);
	}
	
//	public Set<QuoDetailVO> getQuoDetail(String quo_id) {
//		Set<QuoDetailVO> set = dao.findDetailByPrimaryKey(quo_id);
//		return set;
//	}
	
	public void setStatus(String status, String quo_id) throws Exception {

		dao.setStatus(status, quo_id);
	}
	
	public List<QuoVO> getByReqId(String req_id){
		return dao.findByReqid(req_id);
	}
	
	public List<QuoVO> getAll(){
		System.out.println("1");
		return dao.getAll();
	}

}
