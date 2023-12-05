package com.example.sample.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.sample.entity.UserColor;
import com.example.sample.service.UserColorService;



@Controller
@RequestMapping("/diary")
public class UserColorController {
	private String custId = "maria";
	private int cid = 33;
	LocalDate today = LocalDate.now();
	
	
	private String buffer;
	
	@Autowired private UserColorService userColorService;
	
	@GetMapping("/diarySelect")
	public String diarySelect() {
		return "diarySelect";
	}
	
	@GetMapping("/diaryWrite")		// routing 정보, localhost:8090/sample/home
	public String diaryWrite() {
		return "diaryWrite";			// webapp/WEB-INF/view/diaryWrite.jsp 를 렌더링해서 보여줄 것
	}
	
	@PostMapping("/diaryWrite")
	public String boardWriteProc(String content, boolean commit, boolean share, Model model) {
		System.out.println(commit);
		System.out.println(share);
		
		
		if (content.replaceAll("\\s", "").length() >= 30) {
				commit = true;
				content = content.trim();
				UserColor userColor = userColorService.searchUserColor(custId, today.toString());
				userColorService.updateUserColorCommit(userColor.getUcid(), content, commit, share);
				model.addAttribute("msg", "작성 완료되었어요.");
				model.addAttribute("url", "/sample/diary/diaryWrite");
			
		}
		else {
			model.addAttribute("msg", "일기 내용이 충분하지 않아요.");
			model.addAttribute("url", "/sample/diary/diaryWrite");
		}
			
			
		return "common/alertMsg";
	}
	
	@ResponseBody
	@GetMapping("/write_in")
	public String writeIn(String contentIn) {
		buffer = contentIn;
		System.out.println(buffer);
		 
		UserColor userColor = userColorService.searchUserColor(custId, today.toString());
		System.out.println(userColor);
		try {
		if (userColor == null) {
			userColorService.insertUserColorSave(custId, cid, buffer);
		} else {
			if (buffer.isEmpty()) {
				userColorService.updateUserColorSave(userColor.getUcid(), " ", today.toString());
			} else {
			userColorService.updateUserColorSave(userColor.getUcid(), buffer, today.toString());
			}
		}
		} catch (Exception e) {
			if (userColor == null) 
				userColorService.insertUserColorSave(custId, cid, " ");
		}
		return "";
	}
	
}
