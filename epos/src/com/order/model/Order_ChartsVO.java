package com.order.model;

import java.io.Serializable;

public class Order_ChartsVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String prod_name;
	private int prod_quantity;
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_quantity() {
		return prod_quantity;
	}
	public void setProd_quantity(int prod_quantity) {
		this.prod_quantity = prod_quantity;
	}	

}
