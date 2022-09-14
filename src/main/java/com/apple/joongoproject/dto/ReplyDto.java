package com.apple.joongoproject.dto;


public class ReplyDto {
	
	private int rbnum;//덧글 고유넘버
	private int boardnum;//덧글이 달린 게시글의 고유번호
	private String rbid;//덧글을 쓴 유저의 아이디
	private String rbcontent;//덧글 내용
	private String rbdate;//덧글 쓴 날짜시간
	public ReplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReplyDto(int rbnum, int boardnum, String rbid, String rbcontent, String rbdate) {
		super();
		this.rbnum = rbnum;
		this.boardnum = boardnum;
		this.rbid = rbid;
		this.rbcontent = rbcontent;
		this.rbdate = rbdate;
	}
	public int getRbnum() {
		return rbnum;
	}
	public void setRbnum(int rbnum) {
		this.rbnum = rbnum;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getRbid() {
		return rbid;
	}
	public void setRbid(String rbid) {
		this.rbid = rbid;
	}
	public String getRbcontent() {
		return rbcontent;
	}
	public void setRbcontent(String rbcontent) {
		this.rbcontent = rbcontent;
	}
	public String getRbdate() {
		return rbdate;
	}
	public void setRbdate(String rbdate) {
		this.rbdate = rbdate;
	}
	

}
