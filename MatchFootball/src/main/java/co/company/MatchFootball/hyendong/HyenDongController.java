package co.company.MatchFootball.hyendong;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.company.MatchFootball.mapper.HyendongMapper;
import co.company.MatchFootball.vo.MembersVO;
import co.company.MatchFootball.vo.Paging;
import co.company.MatchFootball.vo.TeamVO;
import co.company.MatchFootball.vo.TeamlistVO;
import co.company.MatchFootball.vo.TgalleryVO;
import co.company.MatchFootball.vo.TinviteVO;
import co.company.MatchFootball.vo.TnoticeVO;
import co.company.MatchFootball.vo.TournamentTeamVO;
import co.company.MatchFootball.vo.TournamentVO;

@Controller
public class HyenDongController {
	@Autowired
	HyendongMapper hyendongMapper;

	// 팀생성
	@RequestMapping("/teamMake")
	public String teamMake(HttpServletRequest request, TeamVO teamVO, MembersVO membersVO, HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		membersVO.setId(id);
		model.addAttribute("member", hyendongMapper.memberSelect(membersVO));
		return "hyendong/teamMake";
	}

	// 팀생성처리
	@RequestMapping("/teamMakeInsert")
	public String insert(HttpServletRequest request, TeamVO teamVO, MembersVO membersVO, HttpSession session, Model model, TeamlistVO teamlistVO) {
		// request miltipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 이미지파일
		MultipartFile multipartFile = multipartRequest.getFile("file"); // input타입의 name값
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			try {
				String path = request.getSession().getServletContext().getRealPath("/images"); // /images폴더 위치 mvc에 추가
				System.out.println("pp" + path);
				multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			teamVO.setT_logo(multipartFile.getOriginalFilename());
		}
		String id = (String) session.getAttribute("id"); //세션 id 들고와서
		membersVO.setId(id); //아이디 vo에 담고
		model.addAttribute("member", hyendongMapper.memberSelect(membersVO)); //전체멤버 조회하는거 member 객체 생성
			hyendongMapper.teamInsert(teamVO); //팀 생성 처리하면 팀vo에 팀 정보 담음
			membersVO.setT_num(teamVO.getT_num()); //팀 번호를 멤버vo의 팀 num에 넣음
			hyendongMapper.tNumUpdate(membersVO); //팀 번호 변경 처리하고 멤버vo에 담음
			teamlistVO.setId(id);
			teamlistVO.setT_num(teamVO.getT_num());
			teamlistVO.setT_author("팀장");
			hyendongMapper.teamListInsert(teamlistVO); //팀 만든 사람 정보 팀 리스트에 추가	
		return "redirect:/teamInfo?t_num=" + teamVO.getT_num(); 
	}

	// 팀정보
	@RequestMapping("/teamInfo")
	public String teamInfo(Model model, TeamVO teamVO, MembersVO membersVO, HttpSession session, TeamlistVO teamlistVO) {
		String id = (String)session.getAttribute("id");
		membersVO.setId(id);
		model.addAttribute("members", hyendongMapper.memberSelect(membersVO)); //멤버 단건 조회
		model.addAttribute("teamInfo", hyendongMapper.getTeam(teamVO));
		model.addAttribute("teamMembers", hyendongMapper.getTeamMembers(teamVO));
		teamlistVO.setId(id);
		model.addAttribute("updateButton", hyendongMapper.getTeamMemberss(teamlistVO));
		return "hyendong/teamInfo";
	}
	
	// 팀원 추방
	@RequestMapping("/memberOut")
	public String memberOut(Model model, TeamVO teamVO, MembersVO membersVO, HttpSession session, TeamlistVO teamlistVO) {
		hyendongMapper.teamMemberOut(teamlistVO);
		membersVO.setId(teamlistVO.getId());
		hyendongMapper.tNumNullUpdate(membersVO);
		return "redirect:/teamInfo?t_num=" + teamVO.getT_num();
	}
	
	// 팀 가입하기
		@RequestMapping("/teamlistInsert")
		public String teamlistInsert(Model model, TeamVO teamVO, MembersVO membersVO, HttpSession session, TeamlistVO teamlistVO) {
			String id = (String)session.getAttribute("id");
			membersVO.setId(id);
			model.addAttribute("members", hyendongMapper.memberSelect(membersVO)); //멤버 단건 조회
			model.addAttribute("teamInfo", hyendongMapper.getTeam(teamVO));
			model.addAttribute("teamMembers", hyendongMapper.getTeamMembers(teamVO));
			teamlistVO.setId(id);
			teamlistVO.setT_num(teamVO.getT_num());
			teamlistVO.setT_author("팀원");
			hyendongMapper.teamListInsert(teamlistVO);
			hyendongMapper.tNumUpdate(membersVO);
			return "redirect:/teamInfo?t_num=" + teamVO.getT_num(); 
		}
	
	// 팀수정
	@RequestMapping("/teamUpdate")
	public String teamUpdate(Model model, TeamVO teamVO) {
		model.addAttribute("teamUpdate", hyendongMapper.getTeam(teamVO));
		return "hyendong/teamUpdate";
	}

	// 팀수정처리
	@RequestMapping(value = "/teamUpdateUpdate")
	public String teamUpdateUpdate(HttpServletRequest request, Model model, TeamVO teamVO) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 이미지파일
		MultipartFile multipartFile = multipartRequest.getFile("file"); // input타입의 name값 : uploadFile
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			try {
				String path = request.getSession().getServletContext().getRealPath("/images"); // /images폴더 위치 mvc에 추가
				System.out.println("pp" + path);
				multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			teamVO.setT_logo(multipartFile.getOriginalFilename());
		}
		hyendongMapper.teamUpdate(teamVO);
		return "redirect:/teamInfo?t_num=" + teamVO.getT_num();
	}
	
	//팀갤러리
	@RequestMapping("/teamGallery")
	public String teamGallery(Model model, TgalleryVO tgalleryVO, MembersVO membersVO, HttpSession session, TeamVO teamVO) {
		String id = (String)session.getAttribute("id");
		membersVO.setId(id);
		model.addAttribute("member", hyendongMapper.memberSelect(membersVO));
		model.addAttribute("teamInfo", hyendongMapper.getTeam(teamVO));
		model.addAttribute("teamGallery",hyendongMapper.picSelect(tgalleryVO));
		return "hyendong/teamGallery";
	}
	
	//팀갤러리 등록 처리
	@RequestMapping("/teamGalleryInsert")
	public String teamGallery(HttpServletRequest request, Model model, TgalleryVO tgalleryVO, MembersVO membersVO, HttpSession session, TeamVO teamVO) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 이미지파일
		MultipartFile multipartFile = multipartRequest.getFile("file"); // input타입의 name값 : uploadFile
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			try {
				String path = request.getSession().getServletContext().getRealPath("/images"); // /images폴더 위치 mvc에 추가
				System.out.println("pp" + path);
				multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			tgalleryVO.setImg(multipartFile.getOriginalFilename());
		}
		String id = (String)session.getAttribute("id");
		membersVO.setId(id);
		model.addAttribute("member", hyendongMapper.memberSelect(membersVO));
		model.addAttribute("teamInfo", hyendongMapper.getTeam(teamVO));
		
		hyendongMapper.picInsert(tgalleryVO);
		return "redirect:/teamGallery?t_num=" + teamVO.getT_num();
	}
	// 팀공지
	@RequestMapping("/teamNotice")
	public String teamNotice(Model model, TnoticeVO tNoticeVO, HttpSession session, TeamlistVO teamlistVO, TeamVO teamVO) {
		model.addAttribute("teamNotice", hyendongMapper.NoticeSelect(tNoticeVO));
		String id = (String)session.getAttribute("id");
		teamlistVO.setId(id);
		model.addAttribute("teamInfo", hyendongMapper.getTeam(teamVO));
		model.addAttribute("updateButton", hyendongMapper.getTeamMemberss(teamlistVO));
		return "hyendong/teamNotice";
	}

	// 팀 공지 확인
	@RequestMapping("/teamNoticeInfo")
	public String teamNoticeInfo(Model model, TnoticeVO tNoticeVO, HttpSession session, TeamlistVO teamlistVO, TeamVO teamVO) {
		model.addAttribute("teamNoticeInfo", hyendongMapper.NoticeSelectInfo(tNoticeVO));
		String id = (String)session.getAttribute("id");
		teamlistVO.setId(id);
		model.addAttribute("teamInfo", hyendongMapper.getTeam(teamVO));
		model.addAttribute("updateButton", hyendongMapper.getTeamMemberss(teamlistVO));
		return "hyendong/teamNoticeInfo";
	}

	// 팀 공지 등록
	@RequestMapping("/teamNoticeInsert")
	public String teamNoticeInsert(HttpSession session, TeamVO teamVO, Model model) {
		model.addAttribute("teamInfo", hyendongMapper.getTeam(teamVO));
		return "hyendong/teamNoticeInsert";
	}
	
	// 팀 공지 등록 처리
	@RequestMapping("/teamNoticeInsertt")
	public String tNoticeInsert(TnoticeVO tNoticeVO) {
		hyendongMapper.NoticeInsert(tNoticeVO);
		return "redirect:/teamNoticeInfo?t_num=" + tNoticeVO.getT_num() + "&n_no=" + tNoticeVO.getN_no();
	}

	// 팀 공지 수정
	@RequestMapping("/teamNoticeUpdate")
	public String tNoticeUpdate(Model model, TnoticeVO tNoticeVO, HttpSession session, TeamlistVO teamlistVO, TeamVO teamVO) {
		model.addAttribute("teamNoticeInfo", hyendongMapper.NoticeSelectInfo(tNoticeVO));
		String id = (String)session.getAttribute("id");
		teamlistVO.setId(id);
		model.addAttribute("teamInfo", hyendongMapper.getTeam(teamVO));
		model.addAttribute("updateButton", hyendongMapper.getTeamMemberss(teamlistVO));
		return "hyendong/teamNoticeUpdate";
	}
	
	// 팀 공지 수정 처리
		@RequestMapping("/teamNoticeUpdatee")
		public String tNoticeUpdatee(TnoticeVO tNoticeVO) {
			hyendongMapper.NoticeUpdate(tNoticeVO);
			return "redirect:/teamNoticeInfo?t_num=" + tNoticeVO.getT_num() + "&n_no=" + tNoticeVO.getN_no();
		}
	
	// 팀 공지 삭제 처리
	@RequestMapping("/teamNoticeDelete")
	public String tNoticeDelete(TnoticeVO tNoticeVO) {
		hyendongMapper.NoticeDelete(tNoticeVO);
		return "redirect:/teamNotice?t_num=" + tNoticeVO.getT_num();
	}
	
	// 팀 초대
	@RequestMapping("/teamInvite")
	public String teamInvite(Model model, HttpSession session, TinviteVO tinviteVO, TeamlistVO teamlistVO) {
		String id = (String)session.getAttribute("id");
		tinviteVO.setId(id);
		model.addAttribute("tinvite", hyendongMapper.teamInviteSelect(tinviteVO));
		teamlistVO.setId(id);
		model.addAttribute("updateButton", hyendongMapper.getTeamMemberss(teamlistVO));
		return "hyendong/teamInvite";
	}
	
	// 팀 초대 처리 인바이트로
		@RequestMapping("/teamInviteInsert")
		public String teamInviteInsert(Model model, TeamVO teamVO, MembersVO membersVO, HttpSession session, TinviteVO tinviteVO) {
			String id = (String)session.getAttribute("id");
			membersVO.setId(id);
			model.addAttribute("members", hyendongMapper.memberSelect(membersVO)); //멤버 단건 조회
			hyendongMapper.teamInvite(tinviteVO);
			return "redirect:/teamInfo?t_num=" + teamVO.getT_num(); 
		}
		
	// 팀 초대 승락
	@RequestMapping("/teamListInsert")
	public String teamListInsert(TeamlistVO teamlistVO, TeamVO teamVO, Model model, MembersVO membersVO, HttpSession session, TinviteVO tinviteVO) {
		model.addAttribute("member", hyendongMapper.memberSelect(membersVO)); //전체멤버 조회하는거 member 객체 생성
		hyendongMapper.teamListInsert(teamlistVO);
		membersVO.setId(teamlistVO.getId());
		hyendongMapper.tNumUpdate(membersVO);
		hyendongMapper.teamInviteDelete(tinviteVO);
		return "redirect:/teamInvite?t_num=" + teamVO.getT_num();
	}
	
	// 팀 초대 거절
	@RequestMapping("/teamInviteDelete")
	public String teamInviteDelete(TinviteVO tinviteVO, TeamVO teamVO) {
		hyendongMapper.teamInviteDelete(tinviteVO);
		return "redirect:/teamInvite?t_num=" + teamVO.getT_num();
	}
	
	@ResponseBody
	@RequestMapping(value = "/teamInvite/ajax")
	public List<MembersVO> ajaxMembers(Model model) {
		return hyendongMapper.getMembers();
	}

	// 전체 팀 보기
	@RequestMapping(value = "/teamList")
	public String teamList(Model model, Paging paging, TeamVO teamVO, HttpServletResponse response,
			HttpServletRequest request, HttpSession session, MembersVO membersVO, TeamlistVO teamlistVO) {
		paging.setPageUnit(5);
		paging.setPageSize(10);
		teamVO.setFirst(paging.getFirst());
		teamVO.setLast(paging.getLast());
		paging.setTotalRecord(hyendongMapper.getCount1(teamVO));
		model.addAttribute("teamList", hyendongMapper.teamListSelect(teamVO)); // 페이징할때 VO 받아와야함
		model.addAttribute("paging", paging);
		String id = (String) session.getAttribute("id");
		membersVO.setId(id);
		model.addAttribute("member", hyendongMapper.memberSelect(membersVO));
		return "hyendong/teamList";
	}

	// 토너먼트 리스트
	@RequestMapping("/tournamentList")
	public String tournamentList(Model model) {
		model.addAttribute("tournamentList", hyendongMapper.tournamentListSelect());
		return "hyendong/tournamentList";
	}

	// 토너먼트 상세
	@RequestMapping("/tournamentInfo")
	public String tournamentInfo(Model model, TournamentVO tournamentVO) {
		model.addAttribute("tournamentTeam", hyendongMapper.getTournament(tournamentVO));
		return "hyendong/tournamentInfo";
	}

	// 토너먼트 대진표
	@RequestMapping("/tournamentPVP")
	public String tournamentPVP(Model model, TournamentTeamVO tournamentTeamVO) {
		model.addAttribute("tournamentPVP", hyendongMapper.tournamentPVP(tournamentTeamVO));
		return "hyendong/tournamentPVP";
	}
}
