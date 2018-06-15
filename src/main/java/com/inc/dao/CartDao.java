package com.inc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.inc.vo.CartVo;

public class CartDao {
	@Autowired
	private SqlSession session;
	
	public List<CartVo> cartList(String id){
		List<CartVo> cartList = session.selectList("cart.cartList", id);
		return cartList;
	}

	public int getCount(Map<String, Object> idMap) {
		int count = session.selectOne("cart.getCount", idMap);
		return count;
	}

	public void insert(Map<String, Object> idMap) {
		session.insert("cart.insert", idMap);
	}

	public void update(CartVo cvo) {
		session.update("cart.update", cvo);
	}

	public void delete(int id) {
		session.delete("cart.delete", id);
	}
}





