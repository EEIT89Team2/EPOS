package com.pur.model;

import java.util.List;
import java.util.Set;

import com.pur_detail.model.Pur_detailVO;

public interface Pur_Interface {
	public void insert(PurVO purVO);
	public void update(PurVO purVO);
	public void delete(String pur_id);
	public void deleteDetail(String pur_id,String prod_id);
	public PurVO findByPrimaryKey(String pur_id);
	public Set<Pur_detailVO> findDetailByPrimaryKey(String pur_id);
	public List<PurVO> getAll();
	public void  setStatus(String status, String pur_id);
}
