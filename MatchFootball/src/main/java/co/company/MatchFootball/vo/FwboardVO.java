package co.company.MatchFootball.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class FwboardVO {
	String num;//번호
	String w_id;//댓글작성자
	String w_comm;//댓글작성내용
	Date w_date;
}
