package net.SecondSth.DAO.board;

import java.util.List;

import net.SecondSth.VO.board.NoticeBoard;
import net.SecondSth.VO.board.NoticeBoardComment;

public interface BoardDAO {
	void insertNoticeArticle(NoticeBoard noticeBoard) throws Exception;
	List<NoticeBoard> selectAllNoticeArticle();
	NoticeBoard selectNoticeArticle(NoticeBoard noticeBoard);
	void deleteNoticeArticle(NoticeBoard noticeBoard) throws Exception;
	void updateNoticeArticle(NoticeBoard noticeBoard) throws Exception;
	void updateNoticeHit(NoticeBoard noticeBoard) throws Exception;
	void insertNoticeComment(NoticeBoardComment comment) throws Exception;
	List<NoticeBoardComment> selectNoticeComment(NoticeBoard noticeBoard);
}
