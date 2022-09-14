package com.apple.joongoproject.dao;

import java.util.ArrayList;

import com.apple.joongoproject.dto.TradeDto;
import com.apple.joongoproject.dto.ReplyDto;
import com.apple.joongoproject.dto.FileDto;

public interface TradeDao {
	public void fbwriteDao(String product, int trade, String id,String title,String price,String content);//자유게시판 글쓰기
	public ArrayList<TradeDto> fblistbuyDao();//buy=1 삼
	public ArrayList<TradeDto> fblistsellDao();//sell=0 팜
	public TradeDto fbviewDao(String fbnum);//자유게시판 글 내용 보기 
	public ArrayList<TradeDto> fbViewTitleSearchlist(String keyword);
	public ArrayList<TradeDto> fbSellTitleSearchlist(String keyword);
	//자유게시판 제목에서 검색한 결과 리스트 가져오기
	public ArrayList<TradeDto> fbViewNameSearchlist(String keyword);
	public ArrayList<TradeDto> fbSellNameSearchlist(String keyword);
	public ArrayList<TradeDto> fbViewContentSearchlist(String keyword);
	public ArrayList<TradeDto> fbSellContentSearchlist(String keyword);
	public ArrayList<TradeDto> fbNameSearchlist(String keyword);
	public ArrayList<TradeDto> fbcompletelist(String num);
	public void fbMyboardDao(String num);//글수정 메서드
	public void fbMyboardDao2(String num);//글수정 메서드
	//자유게시판 글쓴이로 검색한 결과 리스트 가져오기
	public TradeDto fbselectcomDao(String num);
	//첨부파일용 dao
	public void fbfileInsertDao(int boardnum, String filename, String orifilename, String fileurl, String fileextension);
	//파일 업로드(파일이 첨부된 게시글번호, 변경된 파일이름, 원본 파일이름, 파일저장경로, 파일의 확장자)
	public FileDto fbGetFileInfoDao(String boardnum);//파일이 첨부된 게시글의 번호로 검색하여 첨부된 파일의 정보 불러오기
	
	//댓글 용 dao
	public void rbwriteDao(int boardnum, String rbid, String rbcontent);
	public ArrayList<ReplyDto> rblistDao(int fbnum);//댓글이 달린 원글의 게시판 번호로 검색하여 모든 댓글리스트를 반환
	
}
