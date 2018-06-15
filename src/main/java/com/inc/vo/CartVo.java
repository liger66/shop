package com.inc.vo;

public class CartVo {
	private int id;
	private int p_id;
	private String u_id;
	private int count;
	private ProductVo pvo;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public ProductVo getPvo() {
		return pvo;
	}
	public void setPvo(ProductVo pvo) {
		this.pvo = pvo;
	}
	
	
}
