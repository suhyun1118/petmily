package com.project.petmily.Service;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project.petmily.DAO.Pet_DAO;
import com.project.petmily.DTO.Pet_DTO;


@Service
public class Pet_Service {
	private ModelAndView mav;
	
	@Autowired
	private Pet_DAO pet_DAO;
	
	@Autowired
	private HttpSession session;
	
	public ModelAndView admin_pet_writ(Pet_DTO pet_DTO) {
		
		mav = new ModelAndView();
		int writResult = pet_DAO.admin_pet_writ(pet_DTO);
		
		if (writResult>0) {
			mav.setViewName("home"); //수정
			
		} else {
			mav.setViewName("admin_pet_WriteJSP"); //수정
		}
		return mav;
	}

	//미분양된 강아지 all리스트 
	public ModelAndView Pet_Dog_allList(int page) {
	
		mav = new ModelAndView();
		
		Pet_DTO paging =new Pet_DTO();
		String pet_kategorie = "강아지";
		paging.setPet_kategorie(pet_kategorie);
	
		
		  if(page==0) {
	        	 page =1; 
	       	}else {
	       		paging.setPage(page);
	       	}
	         int limit =12;
	    	
	    	int Pet_Dog_allList_Count = pet_DAO.Pet_Dog_allList_Count(pet_kategorie);
	    	
	    	System.out.println("Pet_Dog_allList_Count값 : "+Pet_Dog_allList_Count);
	    	//출력할 범위값(db명령할때 숫자값) 계산하기
	    	
	    	int startRow =(page-1)*limit +1;
	    	int endRow =page*limit;
	    	System.out.println("스타트 로우가 뭥미 : "+startRow);
	    	System.out.println("앤드 로우가 뭥미 : "+endRow);
	        paging.setStartRow(startRow);
	        paging.setEndRow(endRow);
	        //내가 보고자 하는 페이지에 글을 가져오려면
	        //List<Pagingdto> boardList = boardDAO.boardListPaging(paging); 에서 
	        //List<Boarddto> boardList = boardDAO.boardListPaging(paging);로 해도된다.
	        
	        
	        List<Pet_DTO> Pet_Dog_allList = pet_DAO.Pet_Dog_allList_Paging(paging);
	    
	    	int maxPage =(int)((double)Pet_Dog_allList_Count/limit +0.9);
	    	int startPage = (((int)((double)page/10+0.9)) - 1 )* 10 + 1;
	    	int endPage = startPage +10 -1;
	    	 
	    	
	    	if(endPage>maxPage) {endPage=maxPage;}
	    	
	    	
	    	
	    	paging.setStartPage(startPage);
	    	paging.setEndPage(endPage);
	    	paging.setMaxPage(maxPage);
	    	paging.setBoardCount(Pet_Dog_allList_Count);
	    	
	    	
	        mav.addObject("paging", paging);
	        mav.addObject("Pet_Dog_allList", Pet_Dog_allList);
			mav.setViewName("dog_ListJsp");

			return mav;
	}
	
	
  //세션 아이디가 있을시 강아지 all 상세보기 
	public ModelAndView Pet_Dog_View(int pet_number,int page,String pet_like_id) {
		mav = new ModelAndView();
		//DTO객체 선언 
		Pet_DTO paging = new Pet_DTO();
		
		
		  paging.setPet_like_number(pet_number);
	      System.out.println("pet_like_id??????"+pet_like_id);
	      System.out.println("pet_number????????????"+pet_number);
		  paging.setPet_like_id(pet_like_id);
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		String JudgmentLike = pet_DAO.JudgmentLike(paging);
		if(JudgmentLike==null) {
			JudgmentLike = null;
			mav.addObject("JudgmentLike", JudgmentLike);
			
		}else {
			if(JudgmentLike.equals(sessionId)) {
	    		System.out.println("좋아요 누른유저");
	    		mav.addObject("JudgmentLike", JudgmentLike);
	    		}else {
	    			System.out.println("좋아요 안 누른유저");
	    			mav.addObject("Like_null", JudgmentLike);
	    		}
			
		}
		  if(page==0) {
	        	 page =1; 
	       	}else {
	       		paging.setPage(page);
	       	}
	         int limit =5;
	    	
	    	int commentCount = pet_DAO.commentCount();
	    	
	    	System.out.println("commentCount값 : "+commentCount);
	    	//출력할 범위값(db명령할때 숫자값) 계산하기
	    	
	    	int startRow =(page-1)*limit +1;
	    	int endRow =page*limit;
	    	
	        paging.setStartRow(startRow);
	        paging.setEndRow(endRow);
	        
	        paging.setComment_PET_NUMBER(pet_number);
	       
	      
	        paging.setNot_smail_commentNumber(pet_number);
	        
	        List<Pet_DTO> commentList = pet_DAO.commentList(paging);
	    
	    	int maxPage =(int)((double)commentCount/limit +0.9);
	    	int startPage = (((int)((double)page/10+0.9)) - 1 )* 10 + 1;
	    	int endPage = startPage +10 -1;
	    	 
	    	
	    	if(endPage>maxPage) {endPage=maxPage;}
	    	//일단 좋아요 유무 판단(보이기위해)좋아요 리스트는 ajax로 따로 하자 
			//paging.setPet_number(pet_number);
		   // paging.setPet_like_id(pet_like_id);
		
	    	
	    	Pet_DTO view = pet_DAO.Pet_Dog_View(pet_number);
	    	
	    	paging.setStartPage(startPage);
	    	paging.setEndPage(endPage);
	    	paging.setMaxPage(maxPage);
	    	
	    	paging.setCommentCount(commentCount);
	    
	        
	         mav.addObject("commentList", commentList); //댓글 
	         mav.addObject("view", view);
			mav.addObject("paging", paging);
			
			mav.setViewName("Pet_Dog_ViewJSP");

			return mav;
			
	
	}
	
    //세션 아이디가 null일시 강아지 상세보기 
	public ModelAndView Pet_Dog_View2(int pet_number, int page) {
		
		mav = new ModelAndView();
		//DTO객체 선언 
		Pet_DTO paging = new Pet_DTO();
		
	     if(page==0) {
        	 page =1; 
       	}else {
       		paging.setPage(page);
       	}
         int limit =5;
    	
    	int commentCount = pet_DAO.commentCount();
    	
    	System.out.println("commentCount값 : "+commentCount);
    	//출력할 범위값(db명령할때 숫자값) 계산하기
    	
    	int startRow =(page-1)*limit +1;
    	int endRow =page*limit;
    	
        paging.setStartRow(startRow);
        paging.setEndRow(endRow);
        
        paging.setComment_PET_NUMBER(pet_number);
       
      
        paging.setNot_smail_commentNumber(pet_number);
        
        List<Pet_DTO> commentList = pet_DAO.commentList(paging);
    
    	int maxPage =(int)((double)commentCount/limit +0.9);
    	int startPage = (((int)((double)page/10+0.9)) - 1 )* 10 + 1;
    	int endPage = startPage +10 -1;
    	 
    	
    	if(endPage>maxPage) {endPage=maxPage;}
    	//일단 좋아요 유무 판단(보이기위해)좋아요 리스트는 ajax로 따로 하자 
		//paging.setPet_number(pet_number);
	   // paging.setPet_like_id(pet_like_id);
	
    	
    	Pet_DTO view = pet_DAO.Pet_Dog_View(pet_number);
    	
    	paging.setStartPage(startPage);
    	paging.setEndPage(endPage);
    	paging.setMaxPage(maxPage);
    	
    	paging.setCommentCount(commentCount);
    
        
         mav.addObject("commentList", commentList); //댓글 
         mav.addObject("view", view);
		mav.addObject("paging", paging);
		
		mav.setViewName("Pet_Dog_ViewJSP");

		return mav;
		
	}
 
	
  //대,중,소형견 리스트 
	public ModelAndView Pet_Dog(int page,String pet_size) {

		mav = new ModelAndView();
		
		Pet_DTO paging =new Pet_DTO();
		System.out.println("pet_size가 뭐냐?"+pet_size);
		
		//pet_size = paging.getPet_size();
		paging.setPet_size(pet_size);
		
	     if(page==0) {
	        	 page =1; 
	       	}else {
	       		paging.setPage(page);
	       	}
	         int limit =12;
	    	
	    	int Pet_Dog_Count = pet_DAO.Pet_Dog_Count(pet_size);
	    	
	    	System.out.println("Pet_Dog_Count값 : "+Pet_Dog_Count);
	    	//출력할 범위값(db명령할때 숫자값) 계산하기
	    	
	    	int startRow =(page-1)*limit +1;
	    	int endRow =page*limit;
	    	
	        paging.setStartRow(startRow);
	        paging.setEndRow(endRow);
	      
	        List<Pet_DTO> Pet_Dog_List = pet_DAO.Pet_Dog_List(paging); 
	    
	    	int maxPage =(int)((double)Pet_Dog_Count/limit +0.9);
	    	int startPage = (((int)((double)page/10+0.9)) - 1 )* 10 + 1;
	    	int endPage = startPage +10 -1;
	    	 
	    	
	    	if(endPage>maxPage) {endPage=maxPage;}
	    	
	    	
	    	
	    	paging.setStartPage(startPage);
	    	paging.setEndPage(endPage);
	    	paging.setMaxPage(maxPage);
	    	paging.setBoardCount(Pet_Dog_Count);
	    	
	    
	    	
	        mav.addObject("paging", paging);
	        mav.addObject("Pet_Dog_List", Pet_Dog_List);
	        
	        if(pet_size .equals("대형견")) {
	        	mav.setViewName("dog_bigJsp");
	        }
	        
	        if(pet_size .equals("중형견")) {
	        	mav.setViewName("Pet_Dog_MediumJsp");
	        }
	        
	        if(pet_size .equals("소형견")) {
	        	mav.setViewName("Pet_Dog_SmallJsp");
	        }

			return mav;
	}
 
  //고양이,파충류리스트 
	public ModelAndView Pet_List(int page,String pet_kategorie) {

		mav = new ModelAndView();
		Pet_DTO paging = new Pet_DTO();
		
		//pet_kategorie = paging.getPet_kategorie();
		paging.setPet_kategorie(pet_kategorie);
		
		  if(page==0) {
	        	 page =1; 
	       	}else {
	       		paging.setPage(page);
	       	}
	         int limit =12;
	    	
	    	int Pet_List_Count = pet_DAO.Pet_List_Count(pet_kategorie);
	    	
	    	System.out.println("Pet_Dog_Big_Count값 : "+Pet_List_Count);
	    	//출력할 범위값(db명령할때 숫자값) 계산하기
	    	
	    	int startRow =(page-1)*limit +1;
	    	int endRow =page*limit;
	    	
	        paging.setStartRow(startRow);
	        paging.setEndRow(endRow);
	        //내가 보고자 하는 페이지에 글을 가져오려면
	        //List<Pagingdto> boardList = boardDAO.boardListPaging(paging); 에서 
	        //List<Boarddto> boardList = boardDAO.boardListPaging(paging);로 해도된다.
	        
	        
	        List<Pet_DTO> Pet_List = pet_DAO.Pet_List(paging);
	    
	    	int maxPage =(int)((double)Pet_List_Count/limit +0.9);
	    	int startPage = (((int)((double)page/10+0.9)) - 1 )* 10 + 1;
	    	int endPage = startPage +10 -1;
	    	 
	    	
	    	if(endPage>maxPage) {endPage=maxPage;}
	    	
	    	
	    	
	    	paging.setStartPage(startPage);
	    	paging.setEndPage(endPage);
	    	paging.setMaxPage(maxPage);
	    	paging.setBoardCount(Pet_List_Count);
	    	
	    	
	        mav.addObject("paging", paging);
	        mav.addObject("Pet_List", Pet_List);
	        if(pet_kategorie .equals("고양이")) {
	        	mav.setViewName("Pet_Cat_ListJsp");
	        }
	        
	        if(pet_kategorie .equals("파충류")) {
	        	mav.setViewName("Pet_Reptile_ListJsp");
	        }
			

			return mav;
	}
  
	
	//댓글 작성 메소드 
		public int commentWriter(Pet_DTO commentDTO) {
		
			return pet_DAO.commentWrite(commentDTO);
		}
		
		
		
		//db에서 댓글 가져오는 메소드 (페이징 처리 해버리장 )
		public List<Pet_DTO> commentList(Pet_DTO paging, int page) {
			
			if(page==0) {
	       	 page =1; 
	      	}else {
	      		paging.setPage(page);
	      	}
	        int limit =5;
	       
	
	   	int commentCount = pet_DAO.commentCount();
	   	
	   	int startRow =(page-1)*limit +1;
		int endRow =page*limit;
		
	    paging.setStartRow(startRow);
	    paging.setEndRow(endRow);
	    
	   // paging.setComment_PET_NUMBER(paging.getComment_PET_NUMBER());??
			
	    int maxPage =(int)((double)commentCount/limit +0.9);
		int startPage = (((int)((double)page/10+0.9)) - 1 )* 10 + 1;
		int endPage = startPage +10 -1;
		 
		
		if(endPage>maxPage) {endPage=maxPage;}
		
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		paging.setCommentCount(commentCount);
		
	     paging.setSmail_comment_PET_NUMBER(paging.getCommentNumber());
		
		 List<Pet_DTO> Smail_commentList = pet_DAO.Smail_commentList(paging);
		 
	
	    
			return pet_DAO.commentList(paging);
		}

		//댓글 수정하기 
		public String commentModifyUpdate(Pet_DTO commentDTO) {
			int updateResult = pet_DAO.commentModifyUpdate(commentDTO);
			String update = null;  
			if(updateResult>0){
				update ="OK";
				System.out.println("update값이뭔데:"+update);
			}else {
				update ="NO";
			}
			return update;
		}
		//댓글 삭제하기 
		public String commentDelete(int commentNumber) {
		
			int result = pet_DAO.commentDelete(commentNumber);
			String deleteResult = null;
			if(result>0) {
				deleteResult ="OK";
			}else {
				deleteResult ="NO";
			}
			return deleteResult;
		}
         //분양글 삭제 
		public String pet_delete(int pet_number) {
			
			int result = pet_DAO.pet_Delete(pet_number);
			String deleteResult = null;
			if(result>0) {
				deleteResult ="OK";
			}else {
				deleteResult ="NO";
			}
			return deleteResult;
		}
       //분양글 수정전 게시글 불러오기 
		public ModelAndView ModifyView(int pet_number) {
			mav = new ModelAndView();
			Pet_DTO modifyView = pet_DAO.modifyView(pet_number);
			mav.addObject("Pet_modifyView", modifyView);
			mav.setViewName("Pet_modifyViewJSP");

			return mav;
		}
       
          //분양글 수정 
		public ModelAndView pet_Modify(Pet_DTO pet_DTO ,int pet_number) {
			mav = new ModelAndView();
			int updateResult = pet_DAO.pet_Modify(pet_DTO);
			Pet_DTO update =null;
			if (updateResult > 0) {
				//mav.setViewName("redirect:/Pet_Dog_ViewJSP?pet_number="+pet_DTO.getPet_number());
				//mav.addObject("update",update);
				update = pet_DAO.Pet_Dog_View(pet_number);
				mav.setViewName("dog_ListJsp");
			} else {
				mav.setViewName("Pet_modifyViewJSP");
			}
			return mav;
		}
       //대댓글 쓰기 
		public int Smail_commentWrite(Pet_DTO commentDTO) {
			
			return pet_DAO.Smail_commentWrite(commentDTO);
		}
          
		//대댓글 리스트 
		public List<Pet_DTO> SmailcommentList(Pet_DTO pet_DTO,int smail_comment_PET_NUMBER) {
			
			pet_DTO.setSmail_comment_PET_NUMBER(smail_comment_PET_NUMBER);
			
			return pet_DAO.Smail_commentList(pet_DTO);
		}
		
		//펫 네임 (종류)별로 검색?
		
		public ModelAndView Pet_nameList(String pet_name) {
			
			mav = new ModelAndView();
			
			Pet_DTO petdto =new Pet_DTO();
		
			petdto.setPet_name(pet_name);
			
			 List<Pet_DTO> Pet_nameList = pet_DAO.Pet_NameList(pet_name);
		
			
		  mav.addObject("Pet_nameList", Pet_nameList);
		
	 	mav.setViewName("Pet_nameListJSP");

				return mav;
		}
		
       //검색새끼야 2019.09.26
		public ModelAndView pet_all_search(int page ,String search_content,
				                           String search_category) {
	        mav = new ModelAndView();
			
			Pet_DTO paging =new Pet_DTO();
			
			 paging.setSearch_content(search_content); //검색내용
			 paging.setSearch_category(search_category); //검색 카테고리 (카운트하기)
		
			 
			 if(search_category .equals("pet_name")) {
				 int pet_all_search_pet_name_Count = pet_DAO.pet_all_search_pet_name_Count(search_content);
				 System.out.println("pet_all_search_pet_name_Count값 : "+ pet_all_search_pet_name_Count);
				 
				  if(page==0) {
			        	 page =1; 
			       	}else {
			       		paging.setPage(page);
			       	}
			         int limit =12;
			    	
			    
			      	int startRow =(page-1)*limit +1;
			    	int endRow =page*limit;
			    	System.out.println("스타트 로우가 뭥미 : "+startRow);
			    	System.out.println("앤드 로우가 뭥미 : "+endRow);
			        paging.setStartRow(startRow);
			        paging.setEndRow(endRow);
			     
			        List<Pet_DTO> pet_all_search_pet_nameList = pet_DAO.pet_all_search_pet_nameList(paging);
			    
			    	int maxPage =(int)((double)pet_all_search_pet_name_Count/limit +0.9);
			    	int startPage = (((int)((double)page/10+0.9)) - 1 )* 10 + 1;
			    	int endPage = startPage +10 -1;
			    	 
			    	
			    	if(endPage>maxPage) {endPage=maxPage;}
			    	
			    	
			    	
			    	paging.setStartPage(startPage);
			    	paging.setEndPage(endPage);
			    	paging.setMaxPage(maxPage);
			    	paging.setBoardCount(pet_all_search_pet_name_Count);
			    	
			    	
			        mav.addObject("paging", paging);
			        mav.addObject("pet_all_searchList", pet_all_search_pet_nameList);
					mav.setViewName("pet_all_searchListJSP");
				 
				 
			 }
//			 성태꺼합치면 밑에 주석 풀고 나머지도 주석풀고 하장 
//			 if(search_category .equals("item_name")) {
//				 int pet_all_search_item_name_Count = pet_DAO.pet_all_search_item_name_Count(search_category);
//					System.out.println("pet_all_search_item_name_Count값 : "+ pet_all_search_item_name_Count);
//			    	//출력할 범위값(db명령할때 숫자값) 계산하기
//					
//					
//					 if(page==0) {
//			        	 page =1; 
//			       	}else {
//			       		paging.setPage(page);
//			       	}
//			         int limit =12;
//			    	
//			    
//			      	int startRow =(page-1)*limit +1;
//			    	int endRow =page*limit;
//			    	System.out.println("스타트 로우가 뭥미 : "+startRow);
//			    	System.out.println("앤드 로우가 뭥미 : "+endRow);
//			        paging.setStartRow(startRow);
//			        paging.setEndRow(endRow);
//			     
//			        List<Pet_DTO> pet_all_searchList = pet_DAO.pet_all_searchList(paging);
//			    
//			    	int maxPage =(int)((double)pet_all_search_item_name_Count/limit +0.9);
//			    	int startPage = (((int)((double)page/10+0.9)) - 1 )* 10 + 1;
//			    	int endPage = startPage +10 -1;
//			    	 
//			    	
//			    	if(endPage>maxPage) {endPage=maxPage;}
//			    	
//			    	
//			    	
//			    	paging.setStartPage(startPage);
//			    	paging.setEndPage(endPage);
//			    	paging.setMaxPage(maxPage);
//			    	paging.setBoardCount(pet_all_search_item_name_Count);
//			    	
//			    	
//			        mav.addObject("paging", paging);
//			        mav.addObject("pet_all_searchList", pet_all_searchList);
//					mav.setViewName("pet_all_searchListJSP");
//			 }
//			
//			 

				return mav;
			
		}
		
     //분양 게시글 좋아요 
		public String PET_Like(int pet_number,String pet_like_id) {
			
			Pet_DTO pet_dto = new Pet_DTO();
			
			pet_dto.setPet_number(pet_number);
			pet_dto.setPet_like_id(pet_like_id);
		
			int PET_Like_Result = pet_DAO.pet_like(pet_dto);
		
			String like = null;  
			
			if(PET_Like_Result>0){
				like ="OK";
				int pet_hit_Result = pet_DAO.pet_like2(pet_number);
				
				}else {
				like ="NO";
			}
			System.out.println("like??????????"+like);
			
			return like;
		}
		
		
		//분양 게시글 좋아요 취소  
      public String PET_Like_Delete(int pet_number,String pet_like_id) {
    	  
    		Pet_DTO pet_dto = new Pet_DTO();
			pet_dto.setPet_number(pet_number);
			pet_dto.setPet_like_id(pet_like_id);
			int PET_Like_Delete = pet_DAO.pet_like_delete(pet_dto);
			String likedelete = null;  
			
			if(PET_Like_Delete>0){
				likedelete ="NO";
				int pet_hit_delete_Result = pet_DAO.pet_like3(pet_number);
			
			}else {
				likedelete ="OK";
			}
			return likedelete;
		}

      
   //분양글 상세정보 누를시 좋아요 유무 판단 
//	public ModelAndView JudgmentLike(int pet_number,int page,String pet_like_id) {
//		
//		mav = new ModelAndView();
//		Pet_DTO pet_dto = new Pet_DTO();
//		
//		pet_dto.setPet_number(pet_number);
//		pet_dto.setPet_like_id(pet_like_id);
//		
//	    int JudgmentLike = pet_DAO.JudgmentLike(pet_dto);
//	    if(JudgmentLike>0) {
//	    	mav.addObject("JudgmentLike", JudgmentLike);
//	    }else {
//	    	mav.setViewName("Pet_Dog_ViewJSP");
//
//   }
//		mav.setViewName("Pet_Dog_ViewJSP");
//
//		return mav;
//	}
	
	

	

}
