package cn.service.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.dao.GoodsDao;
import cn.entity.Goods;
import cn.service.dao.GoodsServiceDao;
@Service
public class GoodsServiceDaoImpl implements GoodsServiceDao {
	@Autowired
	private GoodsDao dao ;

	@Override
	public List<Goods> findAll() {
		return dao.findAll();
	}

	@Override
	public void deleteGoods(int id) {
		dao.deleteGoods(id);
	}

	@Override
	public void addGoods(Goods g) {
		dao.addGoods(g);
	}

	@Override
	public void updateGoods(Goods g) {
		dao.updateGoods(g);
	}

	@Override
	public Goods findByIdGoods(int id) {
		return dao.findByIdGoods(id);
	}

	@Override
	public List<Goods> findByNameGoods(String name) {
		return dao.findByNameGoods(name);
	}
}
