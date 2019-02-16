package cn.service.dao;

import java.util.List;

import cn.entity.Goods;

public interface GoodsServiceDao {
	/**
	 * 查询出所有的数据
	 * @return
	 */
	public List<Goods> findAll();
	/**
	 * 模糊查询数据
	 * @param name
	 * @return
	 */
	public List<Goods> findByNameGoods(String name);
	/**
	 * 根据传入的id得到数据
	 * @param id
	 * @return
	 */
	public Goods findByIdGoods(int id);
	/**
	 * 删除一条数据
	 * @param id
	 */
	public void deleteGoods(int id);
	/**
	 * 添加数据
	 * @param g
	 */
	public void addGoods(Goods g);
	/**
	 * 修改数据
	 * @param g
	 */
	public void updateGoods(Goods g);
}
