package com.project.petmily.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.servlet.ModelAndView;

import com.project.petmily.DAO.Notice_DAO;
import com.project.petmily.DTO.Notice_DTO;
import com.project.petmily.DTO.Pet_DTO;



@Service
public class Notice_Service {
	
	private ModelAndView mav;
	
	@Autowired
	private Notice_DAO notice_dao;
	
	//공지사항 게시판리스트 (첫페이지 )
	public ModelAndView NoticeList(int page) {
		
		mav = new ModelAndView();
		Notice_DTO paging =new Notice_DTO();
	
		
	     if(page==0) {
	        	 page =1; 
	       	}else {
	       		paging.setPage(page);
	       	}
	         int limit =8;
	    	
	    	int Notice_Count = notice_dao.Notice_Count();
	    	
	    	System.out.println("Notice값 : "+Notice_Count);
	    	//출력할 범위값(db명령할때 숫자값) 계산하기
	    	
	    	int startRow =(page-1)*limit +1;
	    	int endRow =page*limit;
	    	
	        paging.setStartRow(startRow);
	        paging.setEndRow(endRow);
		
		  List<Notice_DTO> noticeList = notice_dao.NoticeList(paging);
		  
		  int maxPage =(int)((double)Notice_Count/limit +0.9);
	    	int startPage = (((int)((double)page/10+0.9)) - 1 )* 10 + 1;
	    	int endPage = startPage +10 -1;
	    	 
	    	
	    	if(endPage>maxPage) {endPage=maxPage;}
	    	
	    	
	    	
	    	paging.setStartPage(startPage);
	    	paging.setEndPage(endPage);
	    	paging.setMaxPage(maxPage);
	    	paging.setBoardCount(Notice_Count);
	    	
	    
	    	
	        mav.addObject("paging", paging);
		  
		  mav.addObject("noticeList", noticeList);
		  mav.setViewName("Notice_ListJsp");
		  return mav;
	}
	//공지사항 글쓰기 
   public ModelAndView NoticeWrit(Notice_DTO notice_dto) {
	   
		mav = new ModelAndView();
		int writResult = notice_dao.NoticeWrit(notice_dto);
		
		if (writResult>0) {
			mav.setViewName("home"); 
			
		} else {
			mav.setViewName("Notice_WritJSP"); 
		}
		return mav;
	}
   //공지사항 글 상세 보기 
    public ModelAndView NoticeView(int notice_number) {
    	
    	Notice_DTO noticeView = notice_dao.NoticeView(notice_number); 
    	
    	//이전글 
    	 Notice_DTO notice_Previous_View = notice_dao.notice_Previous_View(notice_number); 
    	 mav.addObject("notice_Previous_View", notice_Previous_View);
    	 //다음글 
    	 Notice_DTO notice_next_View = notice_dao.notice_next_View(notice_number); 
    	  mav.addObject("notice_next_View", notice_next_View); 
    	 
    	  
 	      mav.addObject("noticeView", noticeView);
	    
		mav.setViewName("NoticeViewJSP");
	
	return mav;
}
    //공지사항 제목 검색 
	public ModelAndView notice_search(int page, String search_notice) {
		  mav = new ModelAndView();
			
		  Notice_DTO paging =new Notice_DTO();
			
			 paging.setNotice_title(search_notice);//검색내용
			 paging.setNotice_contents(search_notice); //내용 검색 
		
				 int notice_search_Count = notice_dao.notice_search_Count(search_notice);
				 System.out.println("notice_search_Count값 : "+ notice_search_Count);
				 
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
			     
			        List<Pet_DTO> notice_search_List = notice_dao.notice_search_List(paging);
			    
			       
			    	int maxPage =(int)((double)notice_search_Count/limit +0.9);
			    	int startPage = (((int)((double)page/10+0.9)) - 1 )* 10 + 1;
			    	int endPage = startPage +10 -1;
			    	 
			    	
			    	if(endPage>maxPage) {endPage=maxPage;}
			    	
			    	
			    	
			    	paging.setStartPage(startPage);
			    	paging.setEndPage(endPage);
			    	paging.setMaxPage(maxPage);
			    	paging.setBoardCount(notice_search_Count);
			    	 System.out.println("notice_search_List??????????"+notice_search_List);
			    	
			        mav.addObject("paging", paging);
//			        mav.addObject("notice_search_List", notice_search_List);
//					mav.setViewName("Notice_List_searchJsp");
				 
					  
					  mav.addObject("noticeList", notice_search_List);
					  mav.setViewName("Notice_ListJsp");
			 
				return mav;
	}




}
