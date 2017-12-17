package com.pokey.model;

public class GoodsBean {


	private int bookId;
	private String bookName;
	private float bookPrice;
	private int bookRest;
	private String img;
	private int fans;
	private String publisher;
	private String className;
	private String author;
//test dajun
	private String bookInfo;
	private String birth;
	private String subClass;

	public int getGoodsId() {
		return bookId;
	}
	public void setGoodsId(int bookId) {
		this.bookId = bookId;
	}
	public String getGoodsName() {
		return bookName;
	}
	public void setGoodsName(String goodsName) {
		this.bookName = goodsName;
	}
	public int getGoodsNum() {
		return bookRest;
	}
	public void setGoodsNum(int goodsNum) {
		this.bookRest = goodsNum;
	}
	public float getGoodsPrice() {
		return bookPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.bookPrice = goodsPrice;
	}
	public String getPhoto() {
		return img;
	}
	public void setPhoto(String photo) {
		this.img = photo;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getGoodsIntro() {
		return bookInfo;
	}
	public void setGoodsIntro(String goodsIntro) {
		this.bookInfo = goodsIntro;
	}
	public String getGoodsType() {
		return className;
	}
	public void setGoodsType(String goodsType) {
		this.className = goodsType;
	}
	public String getSubClassType() {
		return subClass;
	}
	public void setSubClassType(String goodsType) {
		this.subClass = goodsType;
	}
	public int getFans() {
		return fans;
	}
	public void setFans(int fans) {
		this.fans = fans;
	}
	public String getAuthor() {
	    //test for git
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
}
