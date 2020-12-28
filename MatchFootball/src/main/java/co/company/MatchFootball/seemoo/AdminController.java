package co.company.MatchFootball.seemoo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import co.company.MatchFootball.mapper.SeemooMapper;
import co.company.MatchFootball.vo.MembersVO;

@Controller
public class AdminController {

	@Autowired
	SeemooMapper seemoomapper;

	@RequestMapping(value = "/admin", method = RequestMethod.GET) // 관리자 메인페이지
	public String admin(Model model) {
		model.addAttribute("members", seemoomapper.memberList());
		return "no/seemoo/index";
	}

	@RequestMapping(value = "/admin/user", method = RequestMethod.GET) // 유저관리 페이지
	public String user(Model model) {
		model.addAttribute("members", seemoomapper.memberList());
		return "seemoo/user";
	}

	@RequestMapping(value = "/admin/userinfo", method = RequestMethod.GET) // 유저관리 페이지 유저조회
	public String user(Model model, MembersVO vo) {
		model.addAttribute("vo", seemoomapper.members(vo));
		System.out.println("vo"+vo);
		return "seemoo/user";
	}

	
	
	
	
	@RequestMapping(value = "/admin/team", method = RequestMethod.GET) // 팀관리 페이지
	public String team(Model model) {
		model.addAttribute("team", seemoomapper.teamList());
		return "seemoo/team";
	}

	@RequestMapping("/admin/blackteam") // 팀관리 페이지 (블랙리스트 된 팀)
	public String blackteam() {
		return "seemoo/blackteam";
	}

	@RequestMapping("/admin/manager") // 매니저관리 페이지
	public String manager() {
		return "seemoo/manager";
	}

	@RequestMapping("/admin/applymanager") // 매니저관리 페이지(매니저 신청|승인대기)
	public String applymanager() {
		return "seemoo/applymanager";
	}

	@RequestMapping("/admin/tournament") // 토너먼트 페이지
	public String tournament() {
		return "seemoo/tournament";
	}

	@RequestMapping("/admin/field") // 경기장관리 페이지
	public String field() {
		return "seemoo/field";
	}

	@RequestMapping("/admin/community") // 커뮤니티 페이지
	public String community() {
		return "seemoo/community";
	}

	@RequestMapping("/admin/notice") // 공지사항 페이지
	public String notice() {
		return "seemoo/notice";
	}

	@RequestMapping("/admin/notice/noticewrite") // 공지사항 글쓰기 페이지
	public String noticewrite() {
		return "seemoo/noticewrite";
	}

	@RequestMapping("/admin/match") // 매치 페이지
	public String match() {
		return "seemoo/match";
	}

}
