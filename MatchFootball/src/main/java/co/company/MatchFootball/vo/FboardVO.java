package co.company.MatchFootball.vo;

import lombok.Data;

@Data
public class FboardVO {//자유게시판
	String id;//작성자
	String num;//시퀀스
	String comm;//내용
	String title;//제목
	String img;//이미지
	String b_date;//작성날짜
	String likeit;
	String cnt;//조회수
	String heartstate;
	int first;
	int last;
}
