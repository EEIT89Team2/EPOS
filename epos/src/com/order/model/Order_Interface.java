package com.order.model;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.order_detail.model.Order_DetailVO;

public interface Order_Interface {

	//public LinkedList Select_order_id(String ord_id) throws Exception;
	public OrderVO Select_order_id(String ord_id) throws Exception;
	public List Select_ord_date(Date s_ord_date,Date e_ord_date) throws Exception;
	//public OrderVO insert(OrderVO orderVO,Order_DetailVO order_detailVO) throws Exception;//新增一筆訂單&一筆商品
	public OrderVO addOrder(OrderVO orderVO, List<Order_DetailVO> order_detailVO_list) throws Exception;//新增一筆訂單&多筆商品
	public void update(OrderVO orderVO,Order_DetailVO order_detailVO) throws Exception;
	public void delete(String order_id) throws Exception;
	public List<OrderVO> getAll() throws Exception;
	public Map Select_prod_id(String prod_id) throws Exception;
	public void setStatus(String status,String ord_id) throws Exception;
	
}
