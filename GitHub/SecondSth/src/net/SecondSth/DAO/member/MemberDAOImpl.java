package net.SecondSth.DAO.member;

import java.util.List;

import net.SecondSth.VO.member.MemberVo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertMember(MemberVo member) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("query.insertMember", member);
	}

	@Override
	public MemberVo selectMemberByEmail(MemberVo member) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("query.selectMemberByEmail", member);
	}

	@Override
	public List<MemberVo> selectAllMember() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("query.selectAllMember");
	}

	@Override
	public MemberVo selectMemberByNick(MemberVo member) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("query.selectMemberByNick", member);
	}

	@Override
	public String selectPw(MemberVo member) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("query.selectPw", member);
	}
}
