package co.company.MatchFootball.doeun;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping(value="/doeun/dd")
	public String dd() {
		return "doeun/Pay";
	}

	@RequestMapping(value="/doeun/index")//남의 정보보기
	public String mypage() {
		return "doeun/userprofile";
	}
	@RequestMapping(value="/doeun/aa")//마이페이지 메인
	public String mypag() {
		return "doeun/aa";
	}
	@RequestMapping(value="/doeun/msg")//메세지함
	public String my() {
		return "doeun/Message";
	}
	@RequestMapping(value="/doeun/test") // 정보수정
	public String test() {
		return "doeun/pfUpdate";
	}
	@RequestMapping(value="/doeun/review")//게시글
	public String review() {
		return "doeun/review";
	}
}
