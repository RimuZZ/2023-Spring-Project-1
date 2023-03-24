package com.vitalchoice.web.product;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ProductController {
	
	private static String CURR_IMAGE_REPO_PATH = "C:\\git\\2023-Spring-Project-1\\VitalChoice\\src\\main\\webapp\\WEB-INF";

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/productinput")
	public String product1() {
		return "productinputform";
	}
	@RequestMapping(value = "/productinputsave")
	public String product2(MultipartHttpServletRequest request) {
		String category1 = request.getParameter("category1");
		String category2 = request.getParameter("category2");
		System.out.println(category1);
		System.out.println(category2);
		return "redirect:productinput";
	}
}
