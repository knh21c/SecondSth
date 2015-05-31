package net.SecondSth.Service;

import java.util.HashMap;
import java.util.List;

import net.SecondSth.VO.board.NoticeBoard;
import net.SecondSth.VO.board.NoticeBoardComment;

public interface BoardService {
	void insertNoticeArticle(NoticeBoard noticeBoard);
	List<NoticeBoard> selectAllNoticeArticle();
	HashMap<String, Object> toNoticeInnerView(NoticeBoard noticeBoard);
	void deleteNoticeArticle(NoticeBoard noticeBoard);
	void updateNoticeArticle(NoticeBoard noticeBoard);
	void insertNoticeComment(NoticeBoardComment comment);
	List<NoticeBoardComment> selectNoticeComment(NoticeBoard noticeBoard);
}
