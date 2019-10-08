package com.project.petmily.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.DTO.Notice_DTO;
import com.project.petmily.DTO.Pet_DTO;

@Repository
public class Notice_DAO {
	
	@Autowired
	private SqlSessionTemplate sql;
 
	//공지사항 게시판 
	public List<Notice_DTO> NoticeList(Notice_DTO paging) {
	
		return sql.selectList("Notice.NoticeList",paging); 
	}
   //공지사항 글쓰기 
	public int NoticeWrit(Notice_DTO notice_dto) {
		
		return sql.insert("Notice.NoticeWrit",notice_dto); 
	}
	//공지사항 글 상세보기 
	public Notice_DTO NoticeView(int notice_number) {
		
		return sql.selectOne("Notice.NoticeView",notice_number);
	}
	//공지사항 이전 글 상세보기 
	public Notice_DTO notice_Previous_View(int notice_number) {
		return sql.selectOne("Notice.notice_Previous_View",notice_number);
	}
	//공지사항 다음 글 상세보기 
	public Notice_DTO notice_next_View(int notice_number) {
		return sql.selectOne("Notice.notice_next_View",notice_number);
	}
	//공지사항 리스트 카운트 
	public int Notice_Count() {
	
		return sql.selectOne("Notice.Notice_Count"); 
	}
	//공지사항 검색 페이징 카운트 
	public int notice_search_Count(String notice_title) {
		
		return sql.selectOne("Notice.notice_search_Count",notice_title); 
	}
	//공지사항 검색 페이징 
	public List<Pet_DTO> notice_search_List(Notice_DTO paging) {
	
		return sql.selectList("Notice.notice_search_List",paging); 
	}

}
