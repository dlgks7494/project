package com.apple.joongoproject;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.apple.joongoproject.dao.MemberDao;
import com.apple.joongoproject.dao.TradeDao;
import com.apple.joongoproject.dto.FileDto;
import com.apple.joongoproject.dto.MemberDto;
import com.apple.joongoproject.dto.TradeDto;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/")
	public String login() {

		return "login";

	}

	@RequestMapping(value = "/board_write")
	public String board_write(HttpServletRequest request, Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		HttpSession session = request.getSession();

		String sid = (String) session.getAttribute("sid");
		
		MemberDto memberDto = dao.memberInfoDao(sid);// 로그인한 아이디의 모든 정보를 dto로 반환

		model.addAttribute("MemberDto", memberDto);

		return "board_write";
	}

	@RequestMapping(value = "board_views")
	public String board_views(HttpServletRequest request, Model model) {

		String num = request.getParameter("fbnum");
		int fbnumint = Integer.parseInt(num);

		TradeDao boardDao = sqlSession.getMapper(TradeDao.class);

		TradeDto fboardDto = boardDao.fbviewDao(num);
		FileDto fileDto = boardDao.fbGetFileInfoDao(num);

		model.addAttribute("fbView", fboardDto);
		model.addAttribute("fileDto", fileDto);
		model.addAttribute("rblist", boardDao.rblistDao(fbnumint));// 댓글리스트 가져와서 반환하기
		model.addAttribute("boardId", fboardDto.getId());// 게시판 아이디 불러오기

		return "board_views";
	}

	@RequestMapping(value = "replyOk")
	public String replyOk(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {

		String boardnum = request.getParameter("boardnum");// 덧글이 달릴 원 게시글의 고유번호
		String rbcontent = request.getParameter("rbcontent");// 덧글의 내용
		int fbnum = Integer.parseInt(boardnum);

		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		String rbid = sid;

		TradeDao boardDao = sqlSession.getMapper(TradeDao.class);

		boardDao.rbwriteDao(fbnum, rbid, rbcontent);

		redirectAttributes.addAttribute("fbnum", fbnum);

		return "redirect:board_views";
	}

	@RequestMapping(value = "board_writeOk", method = RequestMethod.POST)
	public String board_writeOk(HttpServletRequest request, @RequestPart MultipartFile uploadFiles, Model model) throws Exception {
		int titleCheck = 0;
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String product = request.getParameter("product");
		String strade = request.getParameter("trade");
		String id = request.getParameter("id");
		String price = request.getParameter("price");
		if (price.equals("")) {
			price = "합의";
		}
		if(title.equals("")) {
			titleCheck = 1;
			model.addAttribute("titleCheck", titleCheck);
			return "searchResult";
		}
		TradeDao TradeDao = sqlSession.getMapper(TradeDao.class);
		int trade = Integer.parseInt(strade);
		
		HttpSession session = request.getSession();
		
		if (uploadFiles.isEmpty()) { // 파일 첨부 여부를 판단(true or false)
			TradeDao.fbwriteDao(product, trade, id, title, price, content);
			// 첨부된 파일이 없는 경우 제목과 내용만 db에 업로드
		} else {
			TradeDao.fbwriteDao(product, trade, id, title, price, content);
			ArrayList<TradeDto> fbDtobuy = TradeDao.fblistbuyDao();

			String orifilename = uploadFiles.getOriginalFilename();// 원래 파일의 이름 가져오기
			String fileextension = FilenameUtils.getExtension(orifilename).toLowerCase();// 확장자 가져오기(소문자로 변환)
			String fileurl = "D:\\springboot_workspace\\joonggo\\src\\main\\resources\\static\\uploadfiles\\";
			String filename;// 변경된 파일의 이름(서버에 저장되는 파일의 이름)
			File desinationFile;// java.io의 파일관련 클래스

			do {
				filename = RandomStringUtils.randomAlphanumeric(32) + "." + fileextension;
				// 영문대소문자와 숫자가 혼합된 랜덤 32자의 파일이름을 생성한 후 확장자 연결하여 서버에 저장될 파일의 이름 생성
				desinationFile = new File(fileurl + filename);
			} while (desinationFile.exists());// 같은 이름의 파일이 저장소에 존재하면 true 출력

			desinationFile.getParentFile().mkdir();
			uploadFiles.transferTo(desinationFile);

			int boardnumbuy = fbDtobuy.get(0).getNum();
			TradeDao.fbfileInsertDao(boardnumbuy, filename, orifilename, fileurl, fileextension);

			// 가져온 게시글 목록 중에서 가장 최근에 만들어진 글(TradeDto)을 불러와 게시글번호(fbnum)만 추출

		}
		if (trade == 1) {
			return "redirect:board_view";
		} else

			return "redirect:board_sell";
	}

	@RequestMapping(value = "/login")
	public String login2() {

		return "login";

	}

	@RequestMapping(value = "/join")
	public String join() {

		return "join";

	}

	@RequestMapping(value = "/mainpage")
	public String mainpage(HttpServletRequest request, Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		HttpSession session = request.getSession();

		String sid = (String) session.getAttribute("sid");

		MemberDto memberDto = dao.memberInfoDao(sid);// 로그인한 아이디의 모든 정보를 dto로 반환

		model.addAttribute("MemberDto", memberDto);
		return "mainpage";

	}

	@RequestMapping(value = "/infoModify")
	public String infoModify(HttpServletRequest request, Model model) {

		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		HttpSession session = request.getSession();

		String sid = (String) session.getAttribute("sid");

		MemberDto memberDto = dao.memberInfoDao(sid);// 로그인한 아이디의 모든 정보를 dto로 반환

		model.addAttribute("MemberDto", memberDto);

		return "infoModify";
	}

	@RequestMapping(value = "/infoModifyOk")
	public String infoModifyOk(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String spw = (String) session.getAttribute("spw");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pwCheck = request.getParameter("pw_check");
		String tel = request.getParameter("tel");
		String bookmark = request.getParameter("bookmark");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		int checkPwPw = 1;
		if (pw.equals(spw)) {
			checkPwPw = 0;
		}
		int checkPw = 1;
		if (pw.equals(pwCheck)) {
			checkPw = 0;
		}
		model.addAttribute("checkPw", checkPw);
		model.addAttribute("checkPwPw", checkPwPw);
		if(checkPw == 0) {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);

			dao.infoModifyDao(pw, tel, bookmark, name, address, id);

			MemberDto memberDto = dao.memberInfoDao(id);// 정보를 수정한 아이디의 모든 정보를 dto로 반환
			session.setAttribute("spw", pw);
			model.addAttribute("MemberDto", memberDto);
			
		}
		return "infoModifyOk";
	}

	@RequestMapping(value = "/MyboardOk", method = RequestMethod.POST)
	public String MyboardOk(HttpServletRequest request, Model model) {

		TradeDao dao = sqlSession.getMapper(TradeDao.class);
		String num = request.getParameter("fbnum");
		String com = request.getParameter("fbcom");
		System.out.println(num);
		if (com.equals("0")) {
			dao.fbMyboardDao(num);
			ArrayList<TradeDto> fbDto = dao.fbcompletelist(num);

			model.addAttribute("fbdto", fbDto);
		} else if (com.equals("1")) {
			dao.fbMyboardDao2(num);
			ArrayList<TradeDto> fbDto = dao.fbcompletelist(num);

			model.addAttribute("fbdto", fbDto);
		}
		return "MyboardOk";
	}

	@RequestMapping(value = "/board_view") // 상품구매
	public String board_view(HttpServletRequest request, Model model) {

		String searchKeyword = request.getParameter("searchKeyword");
		String searchOption = request.getParameter("searchOption");
		int checkWriter = 0;
		int checkTitle = 0;
		int checkContent = 0;
		TradeDao TradeDao = sqlSession.getMapper(TradeDao.class);

		ArrayList<TradeDto> fbDtos = null;

		if (searchKeyword == null) {
			fbDtos = TradeDao.fblistbuyDao();
		} else if (searchOption.equals("title")) {
			fbDtos = TradeDao.fbViewTitleSearchlist(searchKeyword);
			if (fbDtos.isEmpty()) {
				checkTitle = 1;
				model.addAttribute("searchKeyword",searchKeyword);
				model.addAttribute("checkTitle", checkTitle);
				return "searchResult";
			}
		} else if (searchOption.equals("content")) {
			fbDtos = TradeDao.fbViewContentSearchlist(searchKeyword);
			if (fbDtos.isEmpty()) {
				checkContent = 1;
				model.addAttribute("searchKeyword",searchKeyword);
				model.addAttribute("checkContent", checkContent);
				return "searchResult";
			}
		} else if (searchOption.equals("writer")) {
			fbDtos = TradeDao.fbViewNameSearchlist(searchKeyword);
			if (fbDtos.isEmpty()) {
				checkWriter = 1;
				model.addAttribute("searchKeyword",searchKeyword);
				model.addAttribute("checkWriter", checkWriter);
				return "searchResult";
			}
		}

		int listCount = fbDtos.size();// 게시판 글목록의 글 개수

		model.addAttribute("fblist", fbDtos);
		model.addAttribute("listCount", listCount);

		return "board_view";
	}

	@RequestMapping(value = "/board_sell") // 상품판매
	public String board_sell(HttpServletRequest request, Model model) {
		ArrayList<TradeDto> fbDtos = null;

		String searchKeyword = request.getParameter("searchKeyword");
		String searchOption = request.getParameter("searchOption");
		int checkWriter = 0;
		int checkTitle = 0;
		int checkContent = 0;
		TradeDao TradeDao = sqlSession.getMapper(TradeDao.class);
		if (searchKeyword == null) {
			fbDtos = TradeDao.fblistsellDao();
		} else if (searchOption.equals("title")) {
			fbDtos = TradeDao.fbSellTitleSearchlist(searchKeyword);
			if (fbDtos.isEmpty()) {
				checkTitle = 1;
				model.addAttribute("searchKeyword",searchKeyword);
				model.addAttribute("checkTitle", checkTitle);
				return "searchResult";
			}
		} else if (searchOption.equals("content")) {
			fbDtos = TradeDao.fbSellContentSearchlist(searchKeyword);
			if (fbDtos.isEmpty()) {
				checkContent = 1;
				model.addAttribute("searchKeyword",searchKeyword);
				model.addAttribute("checkContent", checkContent);
				return "searchResult";
			}
		} else if (searchOption.equals("writer")) {
			fbDtos = TradeDao.fbSellNameSearchlist(searchKeyword);
			if (fbDtos.isEmpty()) {
				checkWriter = 1;
				model.addAttribute("searchKeyword",searchKeyword);
				model.addAttribute("checkWriter", checkWriter);
				return "searchResult";
			}
		}

		int listCount = fbDtos.size();// 게시판 글목록의 글 개수

		model.addAttribute("fblist", fbDtos);
		model.addAttribute("listCount", listCount);

		return "board_sell";
	}

	@RequestMapping(value = "/Myboard") // 상품구매
	public String Myboard(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String searchKeyword = (String) session.getAttribute("sid");
		String searchOption = request.getParameter("searchOption");

		TradeDao TradeDao = sqlSession.getMapper(TradeDao.class);

		ArrayList<TradeDto> fbDtos = null;

		if (searchKeyword != null) {
			fbDtos = TradeDao.fbNameSearchlist(searchKeyword);
		}
		int listCount = fbDtos.size();
		model.addAttribute("listCount", listCount);
		model.addAttribute("fblist", fbDtos);

		return "Myboard";
	}

	@RequestMapping(value = "/joinOk", method = RequestMethod.POST) // 회원가입완료
	public String joinOk(HttpServletRequest request, Model model) {

		String mname = request.getParameter("mname");
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mpwCheck = request.getParameter("mpw_check");
		String mgender = request.getParameter("mgender");
		String mjumin = request.getParameter("mjumin");
		String mtel = request.getParameter("mtel");
		String maddress = request.getParameter("maddress");

		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		int checkId = dao.checkIdDao(mid);// 아이디 존재 여부체크(1이면 이미 존재, 0이면 존재 안함)
		int checkPw = 1;
		if (mpw.equals(mpwCheck)) {
			checkPw = 0;
		}
		if (checkId == 0 && checkPw == 0) {
			dao.memberJoinDao(mname, mid, mpw, mgender, mjumin, mtel, maddress);

			HttpSession session = request.getSession();

			session.setAttribute("sid", mid);
			session.setAttribute("sname", mname);

			model.addAttribute("mname", mname);
			model.addAttribute("mid", mid);
		}

		model.addAttribute("checkId", checkId);// checkId값이 1(아이디존재함) 또는 0(존재안함)이 전송
		model.addAttribute("checkPw", checkPw);

		return "joinOk";
	}

	@RequestMapping(value = "/loginOk", method = RequestMethod.POST) // 로그인완료
	public String loginOk(HttpServletRequest request, Model model) {

		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");

		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		int checkId = dao.checkIdDao(mid);// 1이 반환되면 아이디가 존재

		int checkIdPw = dao.checkIdPwDao(mid, mpw);// 아이디와 비밀번호가 모두 일치하면 1이 반환

		model.addAttribute("checkId", checkId);
		model.addAttribute("checkIdPw", checkIdPw);

		if (checkIdPw == 1) {

			MemberDto memberDto = dao.memberInfoDao(mid);
			// 로그인한 아이디의 모든 정보를 dto로 반환

			// 비밀번호체크
			HttpSession session = request.getSession();

			session.setAttribute("sid", memberDto.getId());
			session.setAttribute("spw", memberDto.getPw());
			session.setAttribute("stel", memberDto.getTel());
			session.setAttribute("sbookmark", memberDto.getBookmark());
			session.setAttribute("sname", memberDto.getName());
			model.addAttribute("mid", memberDto.getId());
			model.addAttribute("mname", memberDto.getName());
			model.addAttribute("mtel", memberDto.getTel());
			model.addAttribute("mbookmark", memberDto.getBookmark());

		}

		return "loginOk";

	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {

		session.invalidate();// 세션 삭제->로그아웃
		return "logout";
	}

}
