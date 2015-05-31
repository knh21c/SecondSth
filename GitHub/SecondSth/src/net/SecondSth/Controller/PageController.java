package net.SecondSth.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.SecondSth.Service.BoardService;
import net.SecondSth.Service.MemberService;
import net.SecondSth.VO.board.NoticeBoard;
import net.SecondSth.VO.board.NoticeBoardComment;
import net.SecondSth.VO.member.MemberVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class PageController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private BoardService boardService;
	@Autowired
	MappingJacksonJsonView jsonView;
	private ModelAndView mav;
	HashMap<String, Object> map;

	@RequestMapping(value = "/home", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView home() {
		return new ModelAndView("home");
	}

	@RequestMapping(value = "/notice", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView notice() {
		mav = new ModelAndView("notice");
		mav.addObject("message", boardService.selectAllNoticeArticle());
		mav.addObject("pageNum", 0);
		return mav;
	}

	public ModelAndView notice(String popup) {
		mav = new ModelAndView("notice");
		mav.addObject("message", boardService.selectAllNoticeArticle());
		mav.addObject("popup", popup);
		mav.addObject("pageNum", 0);
		return mav;
	}

	@RequestMapping(value = "/noticePageswitch", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView noticePageSwitch(int pageNum) {
		mav = new ModelAndView("notice");
		mav.addObject("message", boardService.selectAllNoticeArticle());
		mav.addObject("pageNum", pageNum);
		return mav;
	}

	@RequestMapping(value = "/exchange", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView exchange() {
		mav = new ModelAndView("notice");
		return mav;
	}

	@RequestMapping(value = "/review", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView review() {
		mav = new ModelAndView("notice");
		return mav;
	}

	@RequestMapping(value = "/freeBoard", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView freeBoard() {
		mav = new ModelAndView("notice");
		return mav;
	}

	@RequestMapping(value = "/signUp", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView singUp() {
		mav = new ModelAndView("signup");
		return mav;
	}

	@RequestMapping(value = "/signUpExe", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView signUpExe(MemberVo member) {
		memberService.insertMember(member);
		return home();
	}

	@RequestMapping(value = "/emailCheck", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void emailCheck(MemberVo member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<MemberVo> list = new ArrayList<MemberVo>();
		MemberVo rs = memberService.selectMemberByEmail(member);
		if (rs != null)
			list.add(rs);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);

		jsonView.render(map, request, response);
	}

	@RequestMapping(value = "/nickCheck", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void nickCheck(MemberVo member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<MemberVo> list = new ArrayList<MemberVo>();
		MemberVo rs = memberService.selectMemberByNick(member);
		if (rs != null)
			list.add(rs);
		map = new HashMap<String, Object>();
		map.put("list", list);

		jsonView.render(map, request, response);
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void login(MemberVo member, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		map = new HashMap<String, Object>();
		MemberVo rs = memberService.login(member);

		if (rs != null) {
			map.put("success", true);
			map.put("user", rs);
			session.setAttribute("userInfo", rs);
		} else {
			map.put("success", false);
			map.put("message", "존재하지 않는 아이디이거나\n비밀번호가 일치하지 않습니다.");
		}

		jsonView.render(map, request, response);
	}

	@RequestMapping(value = "/logout", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void logout(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		session.invalidate();
		
		jsonView.render(map, request, response);
	}

	@RequestMapping(value = "/noticeWrite", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView noticeWrite() {
		return mav = new ModelAndView("noticeWrite");
	}

	@RequestMapping(value = "/noticeWriteExe", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView noticeWriteExe(NoticeBoard noticeBoard) {
		boardService.insertNoticeArticle(noticeBoard);
		return notice();
	}

	@RequestMapping(value = "/toNoticeInnerView", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView toNoticeInnerView(NoticeBoard noticeBoard) {
		mav = new ModelAndView("noticeInnerView");
		HashMap<String, Object> rs = boardService.toNoticeInnerView(noticeBoard);
		mav.addObject("message", rs.get("selectedBoard"));
		mav.addObject("comments", rs.get("selectedComments"));
		return mav;
	}

	@RequestMapping(value = "/delNoticeArticle", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView delNoticeArticle(NoticeBoard noticeBoard) {
		boardService.deleteNoticeArticle(noticeBoard);
		return notice("글이 삭제되었습니다.");
	}

	@RequestMapping(value = "/editNoticeArticle", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void editNoticeArticle(NoticeBoard noticeBoard,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		boardService.updateNoticeArticle(noticeBoard);
		map = new HashMap<String, Object>();
		HashMap<String, Object> rs;
		rs = boardService.toNoticeInnerView(noticeBoard);
		map.put("noticeBoard", rs.get("selectedBoard"));

		jsonView.render(map, request, response);
	}

	@RequestMapping(value = "/addNoticeComment", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void addNoticeComment(NoticeBoardComment comment,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setId(comment.getId());
		boardService.insertNoticeComment(comment);
		List<NoticeBoardComment> rs = boardService.selectNoticeComment(noticeBoard);
		map.put("comment", rs.get(rs.size()-1));
		jsonView.render(map, request, response);
	}
	
	@RequestMapping(value = "/memberInfo", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView toMemberInfo(){
		return mav = new ModelAndView("memberInfo");
	}
}