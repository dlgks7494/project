package com.apple.joongoproject.dto;

public class TradeDto {
	private String product;
	private int trade;
	private String id;
	private String title;
	private String price;
	private String content;
	private String complete;
	private String pdate;
	private int num;
	private String address;
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public TradeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TradeDto(String product, int trade, String id, String title, String price, String complete,String pdate, int num, String content,String address) {
		super();
		this.product = product;
		this.trade = trade;
		this.id = id;
		this.title = title;
		this.price = price;
		this.content = content;
		this.complete = complete;
		this.pdate = pdate;
		this.num = num;
		this.address=address;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getTrade() {
		return trade;
	}
	public void setTrade(int trade) {
		this.trade = trade;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
