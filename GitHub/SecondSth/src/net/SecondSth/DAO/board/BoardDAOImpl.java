package net.SecondSth.DAO.board;

import java.util.List;

import net.SecondSth.VO.board.NoticeBoard;
import net.SecondSth.VO.board.NoticeBoardComment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertNoticeArticle(NoticeBoard noticeBoard) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("noticeBoardQuery.insertNoticeArticle", noticeBoard);
	}

	@Override
	public List<NoticeBoard> selectAllNoticeArticle() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeBoardQuery.selectAllNoticeArticle");
	}

	@Override
	public NoticeBoard selectNoticeArticle(NoticeBoard noticeBoard) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeBoardQuery.selectNoticeArticle", noticeBoard);
	}

	@Override
	public void deleteNoticeArticle(NoticeBoard noticeBoard) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("noticeBoardQuery.deleteNoticeArticle", noticeBoard);
	}

	@Override
	public void updateNoticeArticle(NoticeBoard noticeBoard) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("noticeBoardQuery.updateNoticeArticle", noticeBoard);
	}

	@Override
	public void updateNoticeHit(NoticeBoard noticeBoard) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("noticeBoardQuery.updateNoticeHit", noticeBoard);
	}

	@Override
	public void insertNoticeComment(NoticeBoardComment comment)
			throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("noticeBoardQuery.insertNoticeComment", comment);
	}

	@Override
	public List<NoticeBoardComment> selectNoticeComment(NoticeBoard noticeBoard) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeBoardQuery.selectNoticeComment", noticeBoard);
	}
}
