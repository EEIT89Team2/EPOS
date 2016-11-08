package com.quotation.model;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import com.quotation_detail.model.QuoDetailVO;
import com.shipments.model.ShipVO;;

public interface Quo_Interface {
	public void insert(QuoVO quoVO,List<QuoDetailVO> list);
    public void update(QuoVO quoVO);
    public void delete(String quo_id);
    public QuoVO findByPrimaryKey(String quo_id);
//    public Set<QuoDetailVO> findDetailByPrimaryKey(String quo_id);    
    public List<QuoVO> findByReqid(String req_id);
    public List<QuoVO> getAll();
    public List<QuoVO> findByDate(Date dateBegin,Date dateEnd );
	public void setStatus(String status,String quo_id) throws Exception;
}
