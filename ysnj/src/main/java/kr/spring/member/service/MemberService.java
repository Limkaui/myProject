package kr.spring.member.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;

@Service("memberService")
public class MemberService {
	//@Resource
	//private MemberVO memberMapper;
	
	//회원가입
	public void insertMember(MemberVO member) {
		//회원번호를 생성해서 자바빈에 저장
		//member.setMem_num(memberMapper.selectMem_num());
		//회원정보 저장
		//memberMapper.insertMember(member);
		//memberMapper.insertMember_detail(member);
	}
	
	//아이디 중복 체크 및 로그인 체크
	/*public MemberVO selectCheckMember(String id) {
		return memberMapper.selectCheckMember(id);
	}*/
	//회원상세정보
	/*public MemberVO selectMember(Integer mem_num) {
		return memberMapper.selectMember(mem_num);
	}*/
	//회원정보 수정
	/*public void updateMember(MemberVO member) {
		memberMapper.updateMember(member);
	}*/
	//비밀번호 수정
	/*public void updatePassword(MemberVO member) {
		memberMapper.updatePassword(member);
	}*/
	//회원탈퇴
	/*public void deleteMmeber(Integer mem_num) {
		memberMapper.deleteMember(mem_num);
		memberMapper.deleteMemeber_detail(mem_num);
	}*/
}
