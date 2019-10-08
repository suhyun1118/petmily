package com.project.petmily.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project.petmily.DAO.Adopt_DAO;
import com.project.petmily.DTO.AdoptReview_DTO;
import com.project.petmily.DTO.Adopt_DTO;
import com.project.petmily.DTO.Page_DTO;

@Service
public class Adopt_Service {

	@Autowired
	private Adopt_DAO a_DAO;
	private ModelAndView mav;

	/* 분양 신청글 쓰기 */
	public ModelAndView a_write(Adopt_DTO aDTO) {

		mav = new ModelAndView();

		int writeResult = a_DAO.a_write(aDTO);
		
		if (writeResult > 0) {
			
			mav.addObject("aDTO", aDTO);
			mav.setViewName("KakaoApi");
		} else {
			mav.setViewName("Adopt_Write");
		}
		return mav;
	}

	/* 분양 완료 후 분양성공 유무 */
	public ModelAndView a_adoptConfirm(int a_number) {
		mav = new ModelAndView();
		
		int adoptSuccess = a_DAO.a_adoptConfirm(a_number);
		
		if(adoptSuccess > 0) {
			mav.setViewName("AdoptSuccess");
		} else {
		}
		return mav;
	}

	/* (관리자)분양 신청 현황 목록(페이징)*/
	public ModelAndView a_list(int page) {

		mav = new ModelAndView();

		Page_DTO pageDTO = new Page_DTO();
		int limit = 10;
		pageDTO.setPage(page);
		pageDTO.setLimit(limit);

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		// 현재 페이지에 보여줘야 하는 글만 DB에서 가져오기
		List<Adopt_DTO> aList = a_DAO.a_list(pageDTO);

		// 전체 글 갯수 DB에서 가져오기
		int listCount = a_DAO.listCount();

		// 페이지 계산
		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;// 뒷자리 수가 무조건 1이 나오게끔하는 식
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setMaxPage(maxPage);
		
		mav.addObject("aList", aList);
		mav.addObject("paging", pageDTO);
		mav.setViewName("Admin_AdoptList");
		
		return mav;
	}
	
	/* 관리자 승인 후 승인 성공유무 */
	public ModelAndView admin_AdoptOk(int a_number) {
		mav = new ModelAndView();
		
		int admin_adoptSuccess = a_DAO.admin_AdoptOk(a_number);
		
		if(admin_adoptSuccess > 0) {
			mav.setViewName("redirect:/a_list?page=1");
		} else {
		}
		return mav;
	}
	
	/* 마이페이지 - 내 분양신청 현황 내역 */
	public ModelAndView my_adoptlist(String id) {
		
		mav = new ModelAndView();
		
		List<Adopt_DTO> listResult = a_DAO.my_adoptlist(id);
		
		mav.addObject("My_aList", listResult);
		mav.setViewName("Mypage_MyAdoptList");
			
			return mav;
	}
	
	

}
