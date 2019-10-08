package com.project.petmily.DTO;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class AdoptReview_DTO {

	private int ar_number;          // 게시글 번호
	private int a_number;           // 신청글 번호
	private String ar_id;           // 후기 작성자 아이디
	private int pet_number;         // 펫 번호
	private String pet_kategorie;   // 펫 종류
	private String pet_name;        // 펫 종
	private String ar_title;        // 후기글 제목
	private String ar_writer;       // 후기글 작성자(신청자)
	private String ar_writedate;    // 작성날짜
	private int ar_viewhit;         // 후기글 조회수
	private String ar_contents;     // 후기글 내용
	
	private MultipartFile adoptFile;   
	private String adoptFileName;
	private int ar_confirm;         // 분양 후기 작성 여부
	
}
