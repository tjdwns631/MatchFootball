package co.company.MatchFootball.vo;

import lombok.Data;

@Data
public class TnoticeVO {
	int n_no;//공지번호
	String t_num;//팀번호
	String t_content;//내용
	String t_title;//제목
	String t_id;//작성자
	String t_date;//작성날짜
}
