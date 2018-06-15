package com.inc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.inc.service.CartService;
import com.inc.vo.CartVo;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	
	@RequestMapping(value = "/product/view", method = RequestMethod.GET)
	public String list(@RequestParam(required = false) String id, Model model) {
		List<CartVo> cartList = cartService.list(id);
		model.addAttribute("cartList", cartList);
		return "/cart/list.jsp";
	}
	
	@RequestMapping(value = "/cart/update", method = RequestMethod.GET)
	public String update(@RequestParam(required = false) int id, int count, Model model) {
		cartService.update(id, count);
		return "redirect:/cart/list";
	}
	
	@RequestMapping(value = "/cart/delete", method = RequestMethod.GET)
	public String delete(@RequestParam(required = false) int id, Model model) {
		cartService.delete(id);
		return "redirect:/cart/list";
	}
}
