package net.SecondSth.Service.Impl;

import java.util.List;

import net.SecondSth.DAO.member.MemberDAO;
import net.SecondSth.Service.MemberService;
import net.SecondSth.VO.member.MemberVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private DataSourceTransactionManager txManager;
	private DefaultTransactionDefinition def;
	private TransactionStatus status;

	private void init() {
		def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		status = txManager.getTransaction(def);
	}

	@Override
	public void insertMember(MemberVo member) {
		init();
		// TODO Auto-generated method stub
		try {
			memberDao.insertMember(member);
			txManager.commit(status);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			txManager.rollback(status);
			e.printStackTrace();
		}
	}

	@Override
	public MemberVo selectMemberByEmail(MemberVo member) {
		// TODO Auto-generated method stub
		return memberDao.selectMemberByEmail(member);
	}

	@Override
	public MemberVo selectMemberByNick(MemberVo member) {
		// TODO Auto-generated method stub
		return memberDao.selectMemberByNick(member);
	}

	@Override
	public void deleteMember(MemberVo member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMember(MemberVo member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MemberVo> selectAllMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo login(MemberVo member) {
		// TODO Auto-generated method stub
		String rsPw = memberDao.selectPw(member);
		if(member.getPw().equals(rsPw))
			return memberDao.selectMemberByEmail(member);
		else
			return null;
	}
}
