package com.project.petmily.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project.petmily.DAO.Member_DAO;
import com.project.petmily.DAO.PetShop_DAO;
import com.project.petmily.DTO.Delivery_DTO;
import com.project.petmily.DTO.Images_DTO;
import com.project.petmily.DTO.Member_DTO;
import com.project.petmily.DTO.Purchase_DTO;
import com.project.petmily.DTO.PetShop_DTO;

@Service
public class PetShop_Service {
	@Autowired
	private PetShop_DAO sdao;
	private ModelAndView mav;
	@Autowired
	private Member_DAO mdao;

	/* 용품 등록 */
	public ModelAndView Shop_Input(Images_DTO idto, PetShop_DTO sdto, HttpServletResponse response) throws IOException {

		mav = new ModelAndView();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		int result = sdao.Shop_Input(sdto);

		// 다중파일 DataBase 저장

		for (int i = 0; i < idto.getImg().size(); i++) {

			idto.setMultiImg(null);
			idto.setMultiImg(idto.getImg().get(i));

			sdao.shop_imges(idto);

		}
		//

		if (result > 0) {
			/*
			 * out.print("<script>alert('등록 성공 !!')");
			 * out.print("location.href='Shop_List?page=0'</script>");
			 */
			mav.setViewName("redirect:/Shop_List?page=0");
		} else {
			out.print("<script>alert('등록 실패 !!')");
			out.print("history.go(-1)</script>");
		}

		return mav;
	}

	/* 용품 목록 */
	public ModelAndView Shop_List() {
		mav = new ModelAndView();

		List<PetShop_DTO> itemList = sdao.Shop_List();
		mav.setViewName("PetShop_List");
		mav.addObject("ItemList", itemList);
		// mav.addObject("paging",pageDTO);

		return mav;
	}

	/* 용품 상세보기 */
	public ModelAndView Shop_View(int item_number) {
		mav = new ModelAndView();

		PetShop_DTO result = sdao.Shop_View(item_number);
		List<String> multyImg = sdao.MultyImg(item_number);

		// 리뷰 가져오기
		List<Purchase_DTO> Review = sdao.getReview(item_number);
		// 리뷰 첨부파일 가져오기
		List<String> reviewImg = new ArrayList<String>();
		for (int i = 0; i < Review.size(); i++) {
			reviewImg = sdao.getReviewImg(Review.get(i).getReview_number());
		}

		if (!Review.isEmpty()) {
			mav.addObject("Review", Review);
			mav.addObject("reviewImg", reviewImg);
		}

		mav.addObject("multyImg", multyImg);
		mav.addObject("Item", result);
		mav.setViewName("PetShopItem_View");
		return mav;
	}

	/* 강아지 용품목록 보기 */
	public ModelAndView pet_Item(String item_kind) {
		mav = new ModelAndView();

		List<PetShop_DTO> result = sdao.pet_Item(item_kind);

		// System.out.println("★ puffyItem:" + result.get(0).getItem_name());

		mav.addObject("ItemList", result);
		mav.setViewName("PetShop_List");
		return mav;
	}

	/* 강아지 용품 카테고리 검색 */
	public ModelAndView pet_Items(PetShop_DTO sdto) {

		mav = new ModelAndView();

		List<PetShop_DTO> result = sdao.pet_Items(sdto);

		mav.addObject("ItemList", result);
		mav.setViewName("PetShop_List");
		return mav;
	}

	/* 용품 구매 */
	public ModelAndView ItemBuy(int item_number, String id) {
		mav = new ModelAndView();

		int delivery = 20000; // 배송비

		Member_DTO member = mdao.memberView(id);
		PetShop_DTO item = sdao.Shop_View(item_number);
		int totalPrice = delivery + item.getItem_price();

		String address = member.getAddress_a() + member.getAddress_b() + member.getAddress_c();

		member.setAddress(address);

		mav.addObject("member", member);
		mav.addObject("item", item);

		mav.addObject("totalPrice", totalPrice); // 배송비 + 용품금액

		mav.setViewName("PetShopItem_Buy");

		return mav;
	}

	/* 배송 신청 */
	public ModelAndView Item_Delivery(Delivery_DTO ddto) {

		mav = new ModelAndView();

		int result = sdao.Item_Delivery(ddto);

		int totalPrice = ddto.getItem_price() + 20000;

		if (result > 0) {
			sdao.soldCount(ddto.getItem_number());
			mav.addObject("totalPrice", totalPrice);
			mav.addObject("buy", ddto);

			mav.setViewName("redirect:/purchase");
		}

		return mav;
	}

	// 2019 - 09 - 24

	/* 구매 내역 */
	public ModelAndView purchase(String id) {
		mav = new ModelAndView();

		List<Delivery_DTO> result = sdao.purchase(id);

		mav.addObject("purchase", result);
		mav.setViewName("Mypage_Purchase");

		return mav;
	}

	/* 구매후기 작성(전) 구매 정보 */
	public ModelAndView purchase_select(int delivery_number) {
		mav = new ModelAndView();

		Delivery_DTO selectResult = sdao.purchase_select(delivery_number);

		mav.addObject("purchase", selectResult);
		mav.setViewName("PurchaseReview_Write");

		return mav;
	}

	/* 구매 후기 작성 */
	public ModelAndView write_review(Purchase_DTO pdto, HttpServletResponse response) throws IOException {

		mav = new ModelAndView();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		int inputResult = sdao.write_review(pdto);

		for (int i = 0; i < pdto.getReview_file().size(); i++) {

			pdto.setMultiImg(null);
			pdto.setMultiImg(pdto.getReview_file().get(i));

			System.out.println("♥♥♥♥♥review_number : " + pdto.getReview_number());

			sdao.review_file(pdto);
		}

		// 데이터 저장 성공시
		if (inputResult > 0) {
			// 리뷰 갯수 +1
			sdao.review_count(pdto.getItem_number());

			mav.setViewName("redirect:/Shop_View?item_number=" + pdto.getItem_number());
		}
		// 데이터 저장 실패시
		else {
			out.print("<script>");
			out.print("alert('리뷰작성 실패 !!')");
			out.print("history.go(-1)");
			out.print("</script>");
		}

		return mav;
	}

}