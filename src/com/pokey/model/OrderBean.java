//¶©µ¥bean
package com.pokey.model;
import java.util.*;
public class OrderBean {

	private int ordersId;
	private int userId ;
	private java.util.Date orderDate;
	private byte isPayed;
	private float totalPrice;
	public byte getIsPayed() {
		return isPayed;
	}
	public void setIsPayed(byte isPayed) {
		this.isPayed = isPayed;
	}
	public java.util.Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(java.util.Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(int ordersId) {
		this.ordersId = ordersId;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
