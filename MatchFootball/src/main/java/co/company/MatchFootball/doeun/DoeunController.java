package co.company.MatchFootball.doeun;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import co.company.MatchFootball.mapper.DoeunMapper;
import co.company.MatchFootball.vo.MembersVO;
import co.company.MatchFootball.vo.MessageVO;

@Controller
public class DoeunController {

	@Autowired
	DoeunMapper dao;
	
//	@ModelAttribute("point")
//	public MembersVO myPoint(MembersVO po, HttpSession session) {
//	
//	}
	@RequestMapping("mypage/profile") // 프로필(메인마이페이지)
	public String profile(MembersVO mb, Model model, HttpSession session, HttpServletResponse response) {
		mb.setId((String)session.getAttribute("id"));
		model.addAttribute("mb", dao.getUser(mb));
		return "doeun/userprofile";
	}

	@RequestMapping(value = "mypage/userupdate") // 정보수정폼
	public String upuserinfo(MembersVO mb, Model model, HttpServletResponse response, HttpServletRequest request,HttpSession session) throws IOException {
		mb.setId((String)session.getAttribute("id"));
		model.addAttribute("mb", dao.getUser(mb));
		return "doeun/pfUpdate";
	}
	
	@PostMapping(value="mypage/updateMem")
	public String upMem(MembersVO vo, HttpServletRequest request, HttpSession session) {
		vo.setId((String)session.getAttribute("id"));
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request ;
		// 이미지파일
		MultipartFile multipartFile = multipartRequest.getFile("file"); // input타입의 name값 : uploadFile
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			try {
				String path = request.getSession().getServletContext().getRealPath("/images"); // /images폴더 위치 mvc에 추가
				System.out.println("pp" + path); // 저장 경로 위치 확인
				multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setImg(multipartFile.getOriginalFilename());
		}
		dao.upMem(vo);
		return "redirect:/mypage/profile";
	}
	@ResponseBody
	@RequestMapping(value="/user/mypage/pointcharge",method=RequestMethod.POST)// 포인트 충전 url...
	public void chargePo(MembersVO mem, HttpSession session, HttpRequest request ) {
	 
	
	}
	
	@RequestMapping("mypage/Mybar") // 총 포인트 조회 
	public String myPoint(MembersVO po, Model model, HttpServletResponse response, HttpServletRequest request, HttpSession session) {
		po.setId((String)session.getAttribute("id"));
		model.addAttribute("point", dao.myPoint(po));
		return "doeun";
	}
	@RequestMapping(value = "mypage/pay") // 결제
	public ModelAndView payment(HttpServletResponse response, HttpSession session, HttpServletRequest request, MembersVO mvo) throws IOException {
		mvo.setId((String)session.getAttribute("id"));
		request.setAttribute("point", dao.getUser(mvo));
		return new ModelAndView("doeun/Pay");
	}

	@RequestMapping(value = "mypage/msg") // 메인메세지함(default 받은 메시지함)
	public ModelAndView MyMsg(MembersVO mem, MessageVO msg, Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mem.setId((String)session.getAttribute("id"));
		msg.setTo_id(mem.getId());
		model.addAttribute("msg", dao.tomsgList(msg));
		mav.setViewName("doeun/Message");// jsp 경로 지정
		return mav;
	}

	@RequestMapping(value = "mypage/outmsg") // 보낸 메세지함
	public String OpMsg() {
		return "doeun/OutMessage";
	}
	@RequestMapping(value ="message") // 발송메세지 폼
	public String msg(MembersVO mem, MessageVO msg, Model model, HttpSession session) {
		return "doeun/msg";
	}
	@PostMapping(value = "sendmsg") // 메세지 발송 처리
	public String inputmsg(MembersVO mem, MessageVO msg, Model model, HttpSession session) {
		mem.setId((String)session.getAttribute("id"));		
		msg.setSend_id(mem.getId());
		dao.sendMsg(msg);
		return "doeun/Message";
	}

	@RequestMapping(value = "mypage/invitemsg") // 초대 메세지함
	public String ivMsg() {
		return "doeun/InviteMsg";
	}

	@RequestMapping(value = "mypage/matched") // 경기참가내역
	public ModelAndView review() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("doeun/review");// jsp 경로 지정
		return mav;
	}

	@RequestMapping(value = "mypage/usedPoint") // 포인트 사용내역
	public ModelAndView point() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("doeun/point");// jsp 경로 지정
		return mav;
	}

	@RequestMapping(value = "mypage/cupon") // 쿠폰함
	public ModelAndView userCp() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("doeun/Mycpon");// jsp 경로 지정
		return mav;
	}

	@RequestMapping(value = "/doeun/cupon") // 쿠폰 생성
	public String cupon() {
		return "";
	}

	@RequestMapping(value = "/doeun/write") // 내가 쓴 게시글
	public String Mywrite() {
		return "";
	}

	@RequestMapping("/admin/pointm") // 쿠폰&포인트 관리페이지(김도은)
	public String pointMgm() {
		return "doeun/pointMgm";
	}

	@RequestMapping("/admin/coupon") // 쿠폰&포인트 관리페이지(김도은)
	public String cpmgm() {
		return "doeun/cpmgm";
	}
}
