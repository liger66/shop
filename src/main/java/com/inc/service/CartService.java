package com.inc.service;

import java.util.List;

import com.inc.vo.CartVo;
import com.inc.vo.ProductVo;

public interface CartService {
	List<CartVo> list(String id);

	void update(int id, int count);

	void delete(int id);
}
