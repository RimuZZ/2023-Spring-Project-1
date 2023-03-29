package com.vitalchoice.web.review;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProductReviewController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/productreview")
	public String review1() {
		
		return "reviewinputform";
	}
	@ResponseBody
	@RequestMapping(value = "/reviewdb", produces = "application/text;charset=UTF-8", method = RequestMethod.POST)
	public String review2(@RequestParam("prd_num") int prd_num) {
		//리뷰화면에 노출할 (상품사진, 회사명, 상품명)
		Service_review serv = sqlSession.getMapper(Service_review.class);
		PrdshowDTO prddto =  serv.prdout(prd_num);
		
		JSONObject obj = new JSONObject();
		obj.put("product_name", prddto.getProduct_name());
		obj.put("store_sname", prddto.getStore_sname());
		obj.put("stored_file_name", prddto.getStored_file_name());
		String res = obj.toJSONString();
		
		return res;
	}
}
