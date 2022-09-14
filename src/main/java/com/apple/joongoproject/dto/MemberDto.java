package com.apple.joongoproject.dto;


public class MemberDto {	
	private String name;
	private String id;
	private String pw;
	private String gender;
	private String jumin;
	private String tel;
	private String address;
	private String bookmark;
	public MemberDto(String name, String id, String pw, String gender, String jumin, String tel, String address,String bookmark) {
		super();
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.jumin = jumin;
		this.tel = tel;
		this.address = address;
		this.bookmark=bookmark;
	}
	public MemberDto() {
		super();
	}
	public String getName() {
		return name;
	}
	public String getBookmark() {
		return bookmark;
	}
	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	} 
	
}
