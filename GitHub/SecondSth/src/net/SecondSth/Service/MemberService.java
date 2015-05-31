package net.SecondSth.Service;

import java.util.List;

import net.SecondSth.VO.member.MemberVo;

public interface MemberService {
	void insertMember(MemberVo member);
	MemberVo selectMemberByEmail(MemberVo member);
	MemberVo selectMemberByNick(MemberVo member);
	MemberVo login(MemberVo member);
	void deleteMember(MemberVo member);
	void updateMember(MemberVo member);
	List<MemberVo> selectAllMember();
}
