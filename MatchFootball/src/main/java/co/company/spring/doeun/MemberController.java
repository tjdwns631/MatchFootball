package co.company.spring.doeun;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@RequestMapping(value="/doeun/dd")
	public String dd() {
		return "doeun/dd";
	}
	
}
