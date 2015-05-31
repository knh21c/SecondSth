package net.SecondSth.Service.Impl;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import net.SecondSth.DAO.board.BoardDAO;
import net.SecondSth.DAO.member.MemberDAO;
import net.SecondSth.Service.BoardService;
import net.SecondSth.VO.board.NoticeBoard;
import net.SecondSth.VO.board.NoticeBoardComment;
import net.SecondSth.VO.member.MemberVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDao;
	@Autowired
	MemberDAO memberDao;
	@Autowired
	private DataSourceTransactionManager txManager;
	private DefaultTransactionDefinition def;
	private TransactionStatus status;

	private void init(){
		def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		status = txManager.getTransaction(def);
	}
	
	@Override
	public void insertNoticeArticle(NoticeBoard noticeBoard) {
		// TODO Auto-generated method stub
		init();
		try{
			MemberVo member = new MemberVo();
			member.setEmail(noticeBoard.getEmail());
			String pw = memberDao.selectPw(member);
			noticeBoard.setPw(pw);
			noticeBoard.setHit(0);
			String content = noticeBoard.getContent();
			content = content.replace("\r\n", "<br>");
			noticeBoard.setContent(content);
			boardDao.insertNoticeArticle(noticeBoard);
			txManager.commit(status);
		}catch(Exception e){
			txManager.rollback(status);
			e.printStackTrace();
		}
	}

	@Override
	public List<NoticeBoard> selectAllNoticeArticle() {
		// TODO Auto-generated method stub
		List<NoticeBoard> list = boardDao.selectAllNoticeArticle(); 
		Collections.reverse(list);
		return list;
	}

	@Override
	public HashMap<String, Object> toNoticeInnerView(NoticeBoard noticeBoard) {
		// TODO Auto-generated method stub
		init();
		try{
			HashMap<String, Object> map = new HashMap<String, Object>();
			List<NoticeBoardComment> selectedComments = boardDao.selectNoticeComment(noticeBoard);
			NoticeBoard selectedBoard = boardDao.selectNoticeArticle(noticeBoard);
			map.put("selectedComments", selectedComments);
			map.put("selectedBoard", selectedBoard);
			selectedBoard.setHit(selectedBoard.getHit()+1);
			boardDao.updateNoticeHit(selectedBoard);
			txManager.commit(status);
			return map;
		}catch(Exception e){
			e.printStackTrace();
			txManager.rollback(status);
			return null;
		}
	}

	@Override
	public void deleteNoticeArticle(NoticeBoard noticeBoard) {
		// TODO Auto-generated method stub
		init();
		try {
			boardDao.deleteNoticeArticle(noticeBoard);
			txManager.commit(status);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			txManager.rollback(status);
		}
	}

	@Override
	public void updateNoticeArticle(NoticeBoard noticeBoard) {
		// TODO Auto-generated method stub
		init();
		try{
			String content = noticeBoard.getContent();
			content = content.replace("\n", "<br>");
			noticeBoard.setContent(content);
			boardDao.updateNoticeArticle(noticeBoard);
			txManager.commit(status);
		}catch(Exception e){
			e.printStackTrace();
			txManager.rollback(status);
		}
	}

	@Override
	public void insertNoticeComment(NoticeBoardComment comment) {
		// TODO Auto-generated method stub
		init();
		try{
			boardDao.insertNoticeComment(comment);
			txManager.commit(status);
		}catch(Exception e){
			txManager.rollback(status);
		}
	}

	@Override
	public List<NoticeBoardComment> selectNoticeComment(NoticeBoard noticeBoard) {
		// TODO Auto-generated method stub
		return boardDao.selectNoticeComment(noticeBoard);
	}
}
