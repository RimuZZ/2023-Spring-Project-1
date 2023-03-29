package com.vitalchoice.web.productout;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vitalchoice.web.product.CategoryDTO;
import com.vitalchoice.web.product.ImageDTO;
import com.vitalchoice.web.product.ProductDTO;

@Controller
public class ProductOutController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/productout")
	public String productdetail1(HttpServletRequest request, Model mo) {
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		Service_productout serv = sqlSession.getMapper(Service_productout.class);
		ProductDTO productdto = serv.productout(product_num);
		CategoryDTO categorydto = serv.categoryout(productdto.getCategory_num());
		ArrayList<ImageDTO> thumblist = serv.thumbout(product_num);
		ArrayList<ImageDTO> detaillist = serv.detailout(product_num);
		String store_sname = serv.storenameout(product_num);
		mo.addAttribute("productdto", productdto);
		mo.addAttribute("categorydto", categorydto);
		mo.addAttribute("thumblist", thumblist);
		mo.addAttribute("detaillist", detaillist);
		mo.addAttribute("store_sname", store_sname);
		return "productout";
	}
	
}
