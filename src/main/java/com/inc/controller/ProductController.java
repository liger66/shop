package com.inc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.inc.service.FileService;
import com.inc.service.ProductService;
import com.inc.vo.ProductVo;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private FileService fileService;

	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	public String list(@RequestParam(required = false) String category, Model model) {
		List<ProductVo> productList = productService.list(category);
		model.addAttribute("productList", productList);
		return "/product/list.jsp";

	}

	@RequestMapping(value = "/product/insert", method = RequestMethod.GET)
	public String insert() {
		return "/product/insert.jsp";
	}

	@RequestMapping(value = "/product/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute ProductVo productVo, 
			             HttpServletRequest request, Model model) {
		try {
			//파일저장
			String path = request.getServletContext().getRealPath("/WEB-INF/resources/image/large");
			String filename;

			filename = fileService.saveFile(path, productVo.getImage_l_file());
			productVo.setImage_l(filename);

			path = request.getServletContext().getRealPath("/WEB-INF/resources/image/small");
			filename = fileService.saveFile(path, productVo.getImage_s_file());
			productVo.setImage_s(filename);
			
			//DB에 product저장
			productService.insert(productVo);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "서버 오류");
			model.addAttribute("url","/product/list");
			return "/error.jsp";
		}
		return "redirect:/product/list";
	}

}
