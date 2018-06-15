package com.inc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inc.dao.CartDao;
import com.inc.vo.CartVo;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao;

	@Override
	public List<CartVo> list(String id) {
		return cartDao.cartList(id);
	}

	@Override
	public void update(int id, int count) {
		CartVo cvo = new CartVo();
		cvo.setId(id);
		cvo.setCount(count);
		
		cartDao.update(cvo);
	}

	@Override
	public void delete(int id) {
		cartDao.delete(id);
	}

}
