package com.bop.model;

import java.util.List;
import java.util.Set;

import com.bop_detail.model.Bop_detailVO;

public interface Bop_Interface {
	public void insert(BopVO bopVO);
	public void update(BopVO bopVO);
	public void delete(String bop_id);
	public void deleteDetail(String bop_id,String prod_id);
	public BopVO findByPrimaryKey(String bop_id);
	public Set<Bop_detailVO> findDetailByPrimaryKey(String bop_id);
	public List<BopVO> getAll();
	public void  setStatus(String status, String bop_id);
}
