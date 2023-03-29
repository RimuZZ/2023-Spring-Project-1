package com.vitalchoice.web.productout;

import java.util.ArrayList;

import com.vitalchoice.web.product.CategoryDTO;
import com.vitalchoice.web.product.ImageDTO;
import com.vitalchoice.web.product.ProductDTO;

public interface Service_productout {

	public ProductDTO productout(int product_num);

	public CategoryDTO categoryout(int category_num);

	public ArrayList<ImageDTO> thumbout(int product_num);

	public ArrayList<ImageDTO> detailout(int product_num);

	public String storenameout(int product_num);

}
