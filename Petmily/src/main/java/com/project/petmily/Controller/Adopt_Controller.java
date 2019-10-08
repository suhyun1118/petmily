package com.project.petmily.Controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.petmily.DTO.AdoptReview_DTO;
import com.project.petmily.DTO.Adopt_DTO;
import com.project.petmily.DTO.Pet_DTO;
import com.project.petmily.Service.Adopt_Service;

@Controller
public class Adopt_Controller {

	@Autowired
	private Adopt_Service aService;
	private ModelAndView mav;

	/* 분양신청에 정보 가져오기 */
	@RequestMapping(value = "/goadopt")
	public ModelAndView goadopt(@ModelAttribute Adopt_DTO adto) {

		mav = new ModelAndView();

		mav.addObject("petNumber", adto.getA_petnumber());
		mav.addObject("petCategorie", adto.getA_petcategorie());
		mav.addObject("petName", adto.getA_petname());
		mav.addObject("petPrice", adto.getA_petprice());

		mav.setViewName("Adopt_Write");

		return mav;
	}

	/* 분양신청 하기 */
	@RequestMapping(value = "/a_write")
	public ModelAndView a_write(@ModelAttribute Adopt_DTO aDTO) throws IllegalStateException, IOException {

		mav = new ModelAndView();

		mav = aService.a_write(aDTO);

		return mav;
	}

	/* 분양 완료 후 분양성공 유무 */
	@RequestMapping(value = "/a_adoptConfirm", method = RequestMethod.GET)
	public ModelAndView a_adoptConfirm(@RequestParam("a_number") int a_number) {

		mav = new ModelAndView();

		mav = aService.a_adoptConfirm(a_number);

		return mav;
	}

	/* (관리자 창)분양 신청 목록 */
	@RequestMapping(value = "/a_list", method = RequestMethod.GET)
	public ModelAndView a_list(@RequestParam("page") int page) {

		if (page == 0)
			page = 1;

		mav = new ModelAndView();

		mav = aService.a_list(page);

		return mav;
	}

	/* 분양 신청 현황 목록(페이징)으로 이동 */
	@RequestMapping(value = "/admin_adoptList")
	public String admin_adoptList() {

		return "redirect:/a_list?page=1";
	}

	/* 관리자 승인 후 승인 성공유무 */
	@RequestMapping(value = "/admin_AdoptOk", method = RequestMethod.GET)
	public ModelAndView admin_AdoptOk(@RequestParam("a_number") int a_number) {

		mav = new ModelAndView();

		mav = aService.admin_AdoptOk(a_number);

		return mav;
	}

//	/* 마이페이지 - 내 분양신청 현황 내역으로 이동 */
//	@RequestMapping(value = "/mypage_adoptList")
//	public String mypage_adoptList(HttpSession session) {
//		
//		return "redirect:/my_adoptlist?page=1";
//		
//	}

	/* 마이페이지 - 내 분양신청 현황 내역 */
	@RequestMapping(value = "/my_adoptlist", method = RequestMethod.GET)
	public ModelAndView my_adoptlist(HttpSession session) {

		mav = new ModelAndView();

		String id = (String) session.getAttribute("sessionId");

		mav = aService.my_adoptlist(id);

		return mav;
	}

}
