package com.project.petmily.Controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.project.petmily.DAO.AdoptReview_DAO;
import com.project.petmily.DTO.AdoptReview_DTO;
import com.project.petmily.DTO.Adopt_DTO;
import com.project.petmily.Service.AdoptReview_Service;

@Controller
public class AdoptReview_Controller {

	@Autowired
	private AdoptReview_Service arService;
	private ModelAndView mav;

	@Autowired
	private AdoptReview_DAO arDAO;

	/* 분양후기에 정보 가져오기  */
	@RequestMapping(value = "/goar_write")
	public ModelAndView goar_write(@ModelAttribute AdoptReview_DTO arDTO) throws IllegalStateException, IOException {

		mav = new ModelAndView();

		mav.addObject("AdoptNumber", arDTO.getA_number());
		mav.addObject("sessionId", arDTO.getAr_id());
		mav.addObject("AdoptPetNumber", arDTO.getPet_number());
		mav.addObject("AdoptPetCategorie", arDTO.getPet_kategorie());
		mav.addObject("AdoptPetName", arDTO.getPet_name());
		mav.addObject("AdoptName", arDTO.getAr_writer());

		mav.setViewName("AdoptReview_Write");

		return mav;
	}
	
	/* 분양후기 글쓰러 가기(파일 포함) */
	@RequestMapping(value = "/ar_write")
	public ModelAndView ar_write(@ModelAttribute AdoptReview_DTO arDTO) throws IllegalStateException, IOException {

		mav = new ModelAndView();
		
		MultipartFile adoptFile = arDTO.getAdoptFile();
		String fileName = adoptFile.getOriginalFilename();
		String savePath = "C:\\Users\\user\\Desktop\\Petmily 10-01_하은\\src\\main\\webapp\\resources\\adopt\\" + fileName;
		
		if (!adoptFile.isEmpty()) {
			adoptFile.transferTo(new File(savePath));
		}
		
		arDTO.setAdoptFileName(fileName);
		
		mav = arService.ar_write(arDTO);

		return mav;
	}
	
	
	/* 분양 후기 작성 후 분양후기 유무 */
	@RequestMapping(value = "/ar_confirm", method = RequestMethod.GET)
	public ModelAndView ar_confirm(@RequestParam("ar_number") int ar_number) {

		mav = new ModelAndView();

		mav = arService.ar_confirm(ar_number);
		

		return mav;
	}
	

	/* 마이페이지 - 내가 쓴 입양후기*/
	@RequestMapping(value = "/my_arlist")
	public ModelAndView my_arlist(HttpSession session) {

		mav = new ModelAndView();

		String id = (String) session.getAttribute("sessionId");
		
		mav = arService.my_arlist(id);
		
		return mav;
	}
	


	/* 후기글 전체목록 */
	@RequestMapping(value = "/ar_list", method = RequestMethod.GET)
	public ModelAndView ar_list(@RequestParam("page") int page) {

		if (page == 0)
			page = 1;

		mav = new ModelAndView();

		mav = arService.ar_list(page);

		return mav;
	}
	
	

	/* 후기글 상세보기 */
	@RequestMapping(value = "ar_view", method = RequestMethod.GET)
	public ModelAndView ar_view(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("ar_number") int ar_number, @RequestParam("page") int page) {

		mav = new ModelAndView();

		AdoptReview_DTO arView = arService.ar_view(ar_number);

		Cookie[] cookies = request.getCookies();

		// 비교하기 위해 새로운 쿠키
		Cookie viewCookie = null;

		// 쿠키가 있을 경우
		if (cookies != null && cookies.length > 0) {

			for (int i = 0; i < cookies.length; i++) {

				// Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌
				if (cookies[i].getName().equals("cookie" + ar_number)) {
					System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = cookies[i];
				}
			}
		}
		if (arView != null) {
			System.out.println("System - 해당 상세 리뷰페이지로 넘어감");
			mav.addObject("arView", arView);
			mav.addObject("page", page);

			// 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
			if (viewCookie == null) {
				System.out.println("cookie 없음");

				// 쿠키 생성(이름, 값)
				Cookie newCookie = new Cookie("cookie" + ar_number, "|" + ar_number + "|");

				// 쿠키 추가
				response.addCookie(newCookie);

				arDAO.ar_hitCount(ar_number);
			}
			// viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
			else {
				System.out.println("cookie 있음");
				// 쿠키 값 받아옴.
				String value = viewCookie.getValue();

				System.out.println("cookie 값 : " + value);
			}

			mav.setViewName("AdoptReview_View");
			return mav;
		} else {
			// 에러 페이지 설정
			mav.setViewName("error/reviewError");
			return mav;
		}

	}

}
