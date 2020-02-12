package com.home.web;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.service.BoardService;
import com.service.BoardVO;
import com.service.BookService;
import com.service.BookVO;
import com.service.CommentService;
import com.service.CommentVO;
import com.service.LoginService;
import com.service.MovieService;
import com.service.MovieVO;
import com.service.MvRoomService;
import com.service.MvRoomVO;
import com.service.PagingVO;
import com.service.ReviewService;
import com.service.ReviewVO;
import com.service.TenService;
import com.service.TenVO;
import com.service.UserBookService;
import com.service.UserBookVO;
import com.service.UserVO;
import com.service.impl.LoginMapper;

@Controller
public class HomeController {

	@Resource(name = "loginService")
	protected LoginService loginService;

	@Resource(name = "boardService")
	protected BoardService boardService;

	@Resource(name = "commentService")
	protected CommentService commentService;

	@Resource(name = "movieService")
	protected MovieService movieService;

	@Resource(name = "reviewService")
	protected ReviewService reviewService;

	@Resource(name = "bookService")
	protected BookService bookService;
	
	@Resource(name= "userBookService")
	protected UserBookService userBookService;
	
	@Resource(name= "mvRoomService")
	protected MvRoomService mvRoomService;
	
	@Resource(name= "tenService")
	protected TenService tenService;
	
	
	
	
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(ModelMap model) throws Exception{
		
		List<MovieVO> movieList = movieService.selectMovie();
		System.out.println(movieList.get(0));
		model.put("movieList", movieList);
		
		return "index";
	}

	// 회원가입 페이지 이동
	@RequestMapping(value = "/addUser", method = RequestMethod.GET) // value값은 get방식/post방식으로 나눠지기 때문에 이름이 같아도 실행
	public String addUser(ModelMap model) {
		return "join";
	}

	// 회원가입
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUserDo(@RequestParam(value = "id", required = false) String userId,
			@RequestParam(value = "pw", required = false) String userPw,
			@RequestParam(value = "name", required = false) String userName,
			@RequestParam(value = "sex", required = false) String userSex,
			@RequestParam(value = "phone", required = false) String userPhone, ModelMap model) throws Exception {

		System.out.println("id : " + userId);
		System.out.println("pw : " + userPw); // 내가 확인하는 것 (console)
		System.out.println("name : " + userName);
		System.out.println("sex : " + userSex);
		System.out.println("phone : " + userPhone);

		UserVO userVO = new UserVO();

		userVO.setUserId(userId);
		userVO.setUserPw(userPw);
		userVO.setUserName(userName);
		userVO.setUserSex(userSex);
		userVO.setUserPhone(userPhone);

		loginService.insertUser(userVO);

		return "redirect:/";
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET) // value값은 get방식/post방식으로 나눠지기 때문에 이름이 같아도 실행
	public String login(ModelMap model) {
		return "login";
	}

	// 로그인
	// @RequestParam(value="id" : *jsp의 name값, required=false) String userId * 지금 넣을
	// 변수값
	@RequestMapping(value = "/loginUser", method = RequestMethod.POST)
	public String loginUserDo(@RequestParam(value = "id", required = false) String userId,
			@RequestParam(value = "pw", required = false) String userPw, ModelMap model, HttpServletRequest request)
			throws Exception {

		System.out.println("id : " + userId);
		System.out.println("pw : " + userPw); // 내가 확인하는 것 (console)

		UserVO userVO = new UserVO();
		userVO.setUserId(userId);
		userVO.setUserPw(userPw); // userVO에 입력한값 넣음 (userId, userPw 변수명)

//		UserVO userVO2 = loginService.loginUser(userId); //return 값이 있을 때 

		String dbPw = loginService.loginUser(userId); // 입력된 값 LoginService에 넣어서 db연결 후 db에있는 비밀번호 호출
		UserVO userVO2 = loginService.selectUser(userId); // 해당 아이디의 모든정보를 db에서 가져옴

		if (dbPw.equals(userPw)) { // 입력된 비번과 db비번과 비교
//			model.put("userId", userId);
			HttpSession session = request.getSession();
			session.setAttribute("userId", userId);
			session.setAttribute("userVO", userVO2); // mypage 세션하기 위해 만듦
			session.setAttribute("isAdmin", userVO2.getIsAdmin());
//			session.setAttribute("userName", userVO2.getUserName());
//			session.setAttribute("userName", userVO2.getUserName());
//			session.setAttribute("userName", userVO2.getUserName());
			return "redirect:/";
		} else {
			return "fail";
		}
	}

	// 로그아웃
	@RequestMapping(value = "/logoutUser", method = RequestMethod.GET)
	public String logoutUserDo(ModelMap model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";

	}
	

	// mypage
	@RequestMapping(value = "/mypageUser", method = RequestMethod.GET)
	public String mypageUser(ModelMap model) {
		return "mypage";
	}
	
	// myReservation 내 예약정보 확인
	@RequestMapping(value = "/myReservation", method = RequestMethod.GET)
	public String myReservation(HttpServletRequest request, ModelMap model) throws Exception {
		
		HttpSession session = request.getSession();
		String userId =(String) session.getAttribute("userId");
		
		
		List<UserBookVO> userBookList= userBookService.selectBook(userId);
		List<UserBookVO> allBookList = userBookService.selectAllBook();
		ArrayList<BookVO> mvList = new ArrayList<BookVO>();
		ArrayList<BookVO> mvList2 = new ArrayList<BookVO>(); 
		System.out.println(allBookList.get(0).getSeats());
		for (int i = 0; i < userBookList.size(); i++) {
			int bId= userBookList.get(i).getbId();
			BookVO mv = bookService.selectOneBook(bId);
			mvList.add(mv);
		}
		
		for (int i = 0; i < allBookList.size(); i++) {
			int bId2= allBookList.get(i).getbId();
			BookVO mv2 = bookService.selectOneBook(bId2);
			mvList2.add(mv2);
		}
		
		
		model.put("userBookList", userBookList);
		model.put("mvList", mvList);
		model.put("allBookList", allBookList);
		model.put("mvList2", mvList2);
		
		return "myreservation";
	}
	// 영화 예약 취소
	@RequestMapping(value = "/delUserMv", method = RequestMethod.GET)
	public String delUserMv(@RequestParam(value = "ubId", required = false) int ubId,
							ModelMap model) throws Exception {
		
		userBookService.delUserBook(ubId);
		mvRoomService.delMvUserRoom(ubId);
		
		return "redirect:/myReservation.do";
	}

	// 회원정보수정 페이지 이동
	@RequestMapping(value = "/updateUser", method = RequestMethod.GET)
	public String updateUser(ModelMap model) {
		return "update";
	}

	// 회원정보수정
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUserDo(@RequestParam(value = "pw", required = false) String userPw,
			@RequestParam(value = "name", required = false) String userName,
			@RequestParam(value = "sex", required = false) String userSex,
			@RequestParam(value = "phone", required = false) String userPhone, HttpServletRequest request,
			ModelMap model) throws Exception {
		UserVO userVO3 = new UserVO();

		userVO3.setUserPw(userPw);
		userVO3.setUserName(userName);
		userVO3.setUserSex(userSex);
		userVO3.setUserPhone(userPhone);

		loginService.updateUser(userVO3); // db에 저장
		HttpSession session = request.getSession(true);
		session.setAttribute("userVO", userVO3);

		return "redirect:/";
	}

	// 회원삭제 페이지 이동
//	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET) 
//	public String deleteUser(ModelMap model){
//		return "delete";
//	}

	// 회원삭제
	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	public String deleteUser(@RequestParam(value = "id", required = false) String userId,
			@RequestParam(value = "pw", required = false) String userPw, ModelMap model, HttpServletRequest request)
			throws Exception {
		UserVO uservo4 = new UserVO();
		uservo4.setUserId(userId);
		uservo4.setUserPw(userPw);

		loginService.deleteUser(uservo4);

		HttpSession session = request.getSession();
//		session.setAttribute("userId", userId);
//		session.setAttribute("userVO", null); // userVO안에 있는 세션만 삭제

		session.invalidate(); // 세션 전체 삭제

		return "redirect:/";
	}

	// 게시판 페이지로 이동
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, ModelMap model) throws Exception {

		List<BoardVO> boardList = boardService.selectBoard();
		// System.out.println(boardList.get(0).getNumber()); //호출방법
		model.put("boardList", boardList);

		// 페이징 처리
		int total = boardService.countBoard(); // 총 게시물 갯수

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", boardService.selectBoard2(vo));

		return "board";
	}

	// 게시판 글쓰기페이지로 이동
	@RequestMapping(value = "/boardwrite", method = RequestMethod.GET)
	public String boardwrite(ModelMap model) {
		return "boardwrite";
	}

	// 게시판 글쓰기
	@RequestMapping(value = "/boardwrite", method = RequestMethod.POST)
	public String boardwriteDo(@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "memo", required = false) String memo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpServletRequest request,
			ModelMap model) throws Exception {
		BoardVO boardVo = new BoardVO();

		HttpSession session = request.getSession(true);
		String userId2 = (String) session.getAttribute("userId");

		boardVo.setTitle(title);
		boardVo.setUserId(userId2);
		boardVo.setMemo(memo);

		boardService.insertBoard(boardVo);
		// 게시판 페이지로 돌아갔을 때 db소환
		// 페이징 처리
		int total = boardService.countBoard(); // 총 게시물 갯수

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", boardService.selectBoard2(vo));

		return "board";
	}

	// 게시판 내용 페이지로 이동
	@RequestMapping(value = "/boardread", method = RequestMethod.GET)
	public String boardread(@RequestParam(value = "number", required = false) int number, HttpServletRequest request,
			ModelMap model) throws Exception {
		BoardVO boardRead = boardService.boardRead(number);

//		selectTotal //토탈값 가져옴
//		total+1 //토탈 +1
//		setTotal() //
//		update 문으로 db에 넣기
		int total = boardRead.getTotal() + 1;
		boardRead.setTotal(total);
		boardService.updateTotal(boardRead);

		model.put("boardread", boardRead);
		// System.out.println(boardRead.getTitle());

		// 댓글보기
		CommentVO commentVo = new CommentVO();
		commentVo.setNumber(number);
		List<CommentVO> commentList = commentService.selectComment(commentVo);
		// System.out.println(commentList.get(0).getNumber()); //호출방법
		model.put("commentList", commentList);

		/*
		 * // 관리자 판별 HttpSession session = request.getSession(); String
		 * userId=(String)session.getAttribute("userId");
		 * loginService.selectUser(userId);
		 */

		return "boardread";
	}

	// 게시판 삭제
	@RequestMapping(value = "/boarddel", method = RequestMethod.GET)
	public String boarddel(@RequestParam(value = "number", required = false) int number, ModelMap model)
			throws Exception {

		boardService.boarddel(number);
		// 게시판 페이지로 돌아갔을 때 db소환
		List<BoardVO> boardList = boardService.selectBoard();
		model.put("boardList", boardList);

		return "board";
	}

	// 게시판 수정페이지로 이동
	@RequestMapping(value = "/boardup", method = RequestMethod.GET)
	public String boardup(@RequestParam(value = "number", required = false) int number, ModelMap model)
			throws Exception {
		BoardVO boardRead = boardService.boardRead(number);
		model.put("boardread", boardRead);

		return "boardupdate";
	}

	// 게시판 수정
	@RequestMapping(value = "/boardup", method = RequestMethod.POST)
	public String boardupDo(@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "memo", required = false) String memo,
			@RequestParam(value = "number", required = false) int number, ModelMap model) throws Exception {
		BoardVO boardVo = new BoardVO();
		boardVo.setTitle(title);
		boardVo.setMemo(memo);
		boardVo.setNumber(number);
		boardService.updateBoard(boardVo);

		// 게시판 페이지로 돌아갔을 때 db소환
		List<BoardVO> boardList = boardService.selectBoard();
		model.put("boardList", boardList);

		return "board";
	}

	// 게시판 댓글 달기
	@RequestMapping(value = "/boardComment", method = RequestMethod.POST)
	public String boardComment(@RequestParam(value = "comment", required = false) String comment,
			@RequestParam(value = "number", required = false) int number, HttpServletRequest request, ModelMap model)
			throws Exception {
		CommentVO commentVo = new CommentVO();

		// 세션 아이디 갖고오기
		HttpSession session = request.getSession(true);
		String userId = (String) session.getAttribute("userId");

		// commentVo에 넣기

		commentVo.setNumber(number);
		commentVo.setUserId(userId);
		commentVo.setComment(comment);

		commentService.insertComment(commentVo);

		// comment 보여주기

//		List<CommentVO> commentList = commentService.selectComment(commentVo);
//		//System.out.println(commentList.get(0).getNumber()); //호출방법
//		model.put("commentList",commentList);

		return "redirect:/boardread.do?number=" + number;
	}

	// 게시판 댓글삭제
	@RequestMapping(value = "/commentdel", method = RequestMethod.GET)
	public String commentdel(@RequestParam(value = "id", required = false) int id,
			@RequestParam(value = "number", required = false) int number, ModelMap model) throws Exception {

//		System.out.println("id : " + id);

		commentService.commentDel(id);

		return "redirect:/boardread.do?number=" + number;
	}

	// 관리자 영화올리기 페이지 이동
	@RequestMapping(value = "/movieupload", method = RequestMethod.GET)
	public String movieupload(ModelMap model) throws Exception {

		return "movieupload";
	}

	// 관리자 영화 페이지 등록
	@RequestMapping(value = "/movieupload", method = RequestMethod.POST)
	public String movieuploadDo(@RequestParam(value = "mvname", required = false) String mvname,
			@RequestParam(value = "mvstory", required = false) String mvstory,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "mvpic", required = false) MultipartFile file,  ModelMap model, HttpServletRequest request) throws Exception {
		// db에 영화내용 넣기
		String fileName = genSaveFileName(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."), file.getOriginalFilename().length()));
		MovieVO movieVO = new MovieVO();
		movieVO.setMvname(mvname);
		movieVO.setMvstory(mvstory);
		movieVO.setMvpic(fileName);
		movieService.insertMovie(movieVO);
		 
		//파일 저장
		String path = request.getContextPath() + "/movieImg";
		byte[] data = file.getBytes();
//		File mvFile = new File(path, fileName);
		FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
		fos.write(data);
		fos.close();
		
		// 페이징 처리
		int total = movieService.countMovie(); // 총 게시물 갯수

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "3";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "3";
		}

		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", movieService.selectMovie2(vo));
		//System.out.println(movieService.selectMovie2(vo).get(0).getId());
		
		return "simplemv";
	}

	// simplemv로 이동
	@RequestMapping(value = "/simplemv", method = RequestMethod.GET)
	public String portfolio(@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, ModelMap model) throws Exception {

		// db에서 불러오기
		List<MovieVO> movieList = movieService.selectMovie();
		model.put("movieList", movieList);

		// 페이징 처리
		int total = movieService.countMovie(); // 총 게시물 갯수

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "3";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "3";
		}

		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", movieService.selectMovie2(vo));
		//System.out.println(movieService.selectMovie2(vo).get(0).getId());

		return "simplemv";
	}

	// 상세 영화페이지로 이동
	@RequestMapping(value = "/movieread.do", method = RequestMethod.GET)
	public String movieread(@RequestParam(value = "id", required = false) int id,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, ModelMap model) throws Exception {

		MovieVO movieList = movieService.selectOneMovie(id);
		model.put("movieList", movieList);

		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setId(id);
		List<ReviewVO> reviewList = reviewService.selectReview(id);
		model.put("reviewList", reviewList);

		// 리뷰 페이징 처리
		int total = reviewService.countReview(id); // 총 게시물 갯수

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}else {}
		
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setId(id);
		model.addAttribute("paging", vo);
		model.addAttribute("reviewList2", reviewService.selectReview2(vo));

		return "moviepage";
	}

	// 영화 삭제
	@RequestMapping(value = "/moviedel", method = RequestMethod.GET)
	public String moviedel(@RequestParam(value = "id", required = false) int id, ModelMap model) throws Exception {

		/*
		 * boardService.boarddel(number); // 게시판 페이지로 돌아갔을 때 db소환 List<BoardVO>
		 * boardList = boardService.selectBoard(); model.put("boardList",boardList);
		 */

		movieService.moviedel(id);

		// db에서 불러오기
		List<MovieVO> movieList = movieService.selectMovie();
		model.put("movieList", movieList);
		return "simplemv";

	}

	// 영화 리뷰작성
	@RequestMapping(value = "/movieComment", method = RequestMethod.POST)
	public String movieComment(@RequestParam(value = "id", required = false) int id,
			@RequestParam(value = "review", required = false) String review, HttpServletRequest request, ModelMap model)
			throws Exception {

		ReviewVO reviewVO = new ReviewVO();

		// 세션 아이디 갖고오기
		HttpSession session = request.getSession(true);
		String userId = (String) session.getAttribute("userId");

		// db에 리뷰 넣기
		reviewVO.setReview(review);
		reviewVO.setUserId(userId);
		reviewVO.setId(id);
		reviewService.insertReview(reviewVO);

		return "redirect:/movieread.do?id=" + id;
	}

	// 리뷰 삭제
	@RequestMapping(value = "/reviewdel", method = RequestMethod.GET)
	public String reviewdel(@RequestParam(value = "id", required = false) int id,
			@RequestParam(value = "rvId", required = false) int rvId, ModelMap model) throws Exception {

		reviewService.reviewDel(rvId);

		return "redirect:/movieread.do?id=" + id;
	}

	// 영화 검색
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam(value = "mvname", required = false) String mvname, ModelMap model)
			throws Exception {

		model.put("scname", mvname);

		// db에서 불러오기
		List<MovieVO> movieSearchList = movieService.selectSearchMovie(mvname);
		model.put("movieSearchList", movieSearchList);

		return "searchmv";

	}

	// 예매 페이지로 이동
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservation(ModelMap model, HttpServletRequest request) throws Exception {

		
		//시간 지난 영화 삭제
		List<BookVO> bookList= bookService.selectBook(); 
		SimpleDateFormat df= new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
		Date date = new Date();
		String current = df.format(date);
		//System.out.println(current);
		//System.out.println("상영시간"+bookList.get(5).getbDate()+bookList.get(5).getbTime());
		for (int i = 0; i < bookList.size(); i++) {
			int compare = current.compareTo( bookList.get(i).getbDate()+bookList.get(i).getbTime()); // 날짜비교 (앞에가 더크면 1 아니면 -1)
			if (compare > 0) {
				int bId = bookList.get(i).getbId();
				bookService.delPastBook(bId);
				userBookService.delPastUBook(bId);
				mvRoomService.delPastMvRoom(bId);
			}
		}
		// 영화 이름 불러오기
		List<MovieVO> movieList = movieService.selectMovie();
		model.put("movieList", movieList);

		// 상영표 불러오기
		bookList= bookService.selectBook(); 
		model.put("bookList",bookList);
		
		//상영 날짜 불러오기
		List<String> bookDate = bookService.selectDateBook();
		//System.out.println(bookDate.get(0).substring(8, 10));
		model.put("bookDate", bookDate);
		
		// 날짜 선택하기
		String day = request.getParameter("date");
		//System.out.println("day="+day);
		if (day == null) {
			day = bookDate.get(0).substring(8, 10);
			model.put("day", day);
		}else {
			model.put("day", day);
		}
		
		
		
		
		return "reservation";
	}

	// 관리자 상영표 올리기 페이지 이동
	@RequestMapping(value = "/bookupload", method = RequestMethod.GET)
	public String bookupload(ModelMap model) throws Exception {
		// 영화 이름 불러오기
		List<MovieVO> movieList = movieService.selectMovie();
		model.put("movieList", movieList);
		
		return "bookupload";
	}

	// 관리자 상영표 등록
	@RequestMapping(value = "/bookupload", method = RequestMethod.POST)
	public String bookuploadDo(@RequestParam(value = "mvname", required = false) String mvname,
			@RequestParam(value = "bDate", required = false) String bDate,
			@RequestParam(value = "bTime", required = false) String bTime,
			@RequestParam(value = "mvroom", required = false) int mvroom, ModelMap model) throws Exception {
		// 상영표 db넣기
		BookVO bookVO = new BookVO();
		bookVO.setbDate(bDate);
		bookVO.setbTime(bTime);
		bookVO.setMvname(mvname);
		bookVO.setMvroom(mvroom);

		bookService.insertBook(bookVO);

		return "redirect:/";
	}
	
	//좌석선택 페이지
	@RequestMapping(value = "/selectseat", method = RequestMethod.GET)
	public String selectseat(@RequestParam(value = "bId", required = false) int bId,
							 ModelMap model) throws Exception {
		BookVO bookOne = bookService.selectOneBook(bId);
		model.put("bookOne", bookOne);
		
		List<String> selectSeat = mvRoomService.selectSeat(bId);
		model.put("selectSeat", selectSeat);
		
		
		return "selectseat";
	}
	
	//좌석선택 완료
	@RequestMapping(value = "/selectseat", method = RequestMethod.POST)
	public String selectseatDo(@RequestParam(value = "seat", required = false) List<String> seat,
							   @RequestParam(value = "totalmoney", required = false) int totalmoney,
							   @RequestParam(value = "mvroom", required = false) int mvroom,
							   @RequestParam(value = "bId", required = false) int bId,
							   @RequestParam(value = "userId", required = false) String userId,
							 ModelMap model) throws Exception {
		
		//유저 예약 정보 넣기
		 UserBookVO userBookVO = new UserBookVO();
		  
		 String seats = "";
		 for (int i = 0; i < seat.size(); i++) { 
			 seats += seat.get(i)+", ";
		 }
		 
		 userBookVO.setbId(bId);
		 userBookVO.setMvroom(mvroom); 
		 userBookVO.setUserId(userId); 
		 userBookVO.setSeats(seats.substring(0, seats.length()-2));
		 userBookVO.setTotalmoney(totalmoney);
		 
		 userBookService.insertUserBook(userBookVO);
		
		 String seat2 =seats.substring(0, seats.length()-2);// 좌석 검색을위한 처리
		 userBookVO.setSeat2(seat2); //좌석 검색을 위한 seat2 넣기
		 //System.out.println(seat2);
		 //상영관 좌석 정보 넣기
		 MvRoomVO mvRoomVO = new MvRoomVO();
		 
		 int ubId = userBookService.selectBookNow(userBookVO);
		 
		 for (int i = 0; i < seat.size(); i++) { mvRoomVO.setUbId(ubId);
			  mvRoomVO.setbId(bId); mvRoomVO.setMvroom(mvroom);
			  mvRoomVO.setSeat(seat.get(i));
			  
			  mvRoomService.insertMvRoom(mvRoomVO); 
			}
			 
		
		
		return "success";
	}
	
	
	// 1000만영화 페이지
	@RequestMapping(value = "/tenmv", method = RequestMethod.GET) // value값은 get방식/post방식으로 나눠지기 때문에 이름이 같아도 실행
	public String tenmv(ModelMap model) {
		return "tenmv";
	}
	
	// 워드클라우드
	@RequestMapping(value = "/wdcloud", method = RequestMethod.GET) // value값은 get방식/post방식으로 나눠지기 때문에 이름이 같아도 실행
	public String wdcloud(@RequestParam(value = "chart", required = false) int chart,
							ModelMap model) throws Exception{
		TenVO ten= tenService.selectTen(chart);
		List<TenVO> selectTens = tenService.selectTens();
		model.put("ten", ten);
		model.put("selectTens", selectTens);
		
		return "wdcloud";
	}
	
	
	
	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	
	
}
