package com.project.petmily.DAO;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.petmily.DTO.AdoptReview_DTO;
import com.project.petmily.DTO.Page_DTO;

@Repository
public class AdoptReview_DAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	/* 후기글 쓰기 처리 */
	public int ar_write(AdoptReview_DTO arDTO) {
		return sql.insert("AdoptReview.ar_write", arDTO);
	}
	
	/* 입양 후기 목록으로 이동 (후기글 쓰고나서)*/
	public List<AdoptReview_DTO> ar_mylist(int a_number) {
		return sql.selectList("AdoptReview.ar_mylist",a_number);
	}
	
	/* 마이페이지 - 내가쓴 입양 후기 목록 */
	public List<AdoptReview_DTO> my_arlist(String id) {
		return sql.selectList("AdoptReview.my_arlist", id);
	}
	
	/* 후기글 목록(페이징처리) */
	public List<AdoptReview_DTO> ar_list(Page_DTO pageDTO) {
		return sql.selectList("AdoptReview.ar_list",pageDTO);
	}
	
	/* 리스트 카운트(페이징처리) */
	public int listCount() {
		return sql.selectOne("AdoptReview.listCount");
	}

	/* 후기글 조회수 */
	public int ar_hitCount(int ar_number) {
		return sql.update("AdoptReview.ar_hitCount", ar_number);
	}

	/* 후기글 상세보기 */
	public AdoptReview_DTO ar_view(int ar_number) {
		return sql.selectOne("AdoptReview.ar_view", ar_number);
	}

	/* 분양 후기 작성 후 분양후기 유무 */
	public int ar_confirm(int ar_number) {
		return sql.update("AdoptReview.ar_confirm", ar_number);
	}

}
