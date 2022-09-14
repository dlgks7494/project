package com.apple.joongoproject.dao;

import java.util.ArrayList;

import com.apple.joongoproject.dto.MemberDto;

public interface MemberDao {
	
	//member 관련 dao 메서드
		public void memberJoinDao(String mname, String mid, String mpw, String mgender, String mjumin, String mtel, String maddress);//회원 가입 메서드
		public int checkIdDao(String mid);//회원가입 여부 체크 메서드(아이디가 존재하면 1, 아니면 0이 반환)
		public int checkIdPwDao(String mid, String mpw);//아이디와 비밀번호 일치여부 체크(일치하면 1, 아니면 0) 
		public MemberDto memberInfoDao(String mid);//id로 검색해서 해당 id의 모든 정보를 반환하는 메서드
		public void infoModifyDao( String mid, String mpw,String mtel, String bookmark,String mname,String maddress);//회원정보 수정 메서드
		
}
