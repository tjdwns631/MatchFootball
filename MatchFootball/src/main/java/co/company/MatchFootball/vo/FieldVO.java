package co.company.MatchFootball.vo;

import lombok.Data;

@Data
public class FieldVO {
	String f_id;//구장아이디
	String name;//구장이름
	String ttype;//매치분류
	String location1;//지역대분류
	String location2;//지역소분류
	String state;//상태
	String price;//필드가격
	String img;//구장이미지
	String comm;
}
