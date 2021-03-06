package co.company.MatchFootball.vo;

import lombok.Data;

@Data
public class TeammatchVO {
	String m_no;//매치시퀀스
	String f_id;//경기장번호
	String title;
	String matchnum;
	String t_num;//팀번호
	String mtype;//경기타입
	String f_name;//경기장이름
	String f_address;//구장주소
	String price;//가격
	String t_name;//매치하는 팀이름
	String t_wn;//승패저장
	String t_cap;//팀장
	String t_level;//팀레벨
	String m_info;//매치정보
	String m_date;//매치날짜
	String m_hour;//경기시간
	String m_type;//매치상태
	String backgroundcolor;
	String id;
	String min;
	String f;
	String t_logo;
	String so_num;
	String so_name;
	String m_id;
	String review;
	int first;
	int last;
}
