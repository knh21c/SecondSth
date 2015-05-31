package net.SecondSth.DAO.member;


import java.util.List;

import net.SecondSth.VO.member.MemberVo;

public interface MemberDAO {
	void insertMember(MemberVo member) throws Exception;
	MemberVo selectMemberByEmail(MemberVo member);
	MemberVo selectMemberByNick(MemberVo member);
	List<MemberVo> selectAllMember();
	String selectPw(MemberVo member);
}
