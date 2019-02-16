package cn.action;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.entity.Goods;
import cn.service.dao.impl.GoodsServiceDaoImpl;

@Controller
public class MyController01 {
	@Autowired
	private GoodsServiceDaoImpl service ;
	
	@RequestMapping(value="/findAll.action",produces="application/json;charset=utf-8")
	@ResponseBody  //得到json或字符串数据，阻止页面转发或重定向
	public List<Goods> findAllController(){
		//得到所有的数据
		List<Goods> list = service.findAll();
		return list ;
	}
	
	@RequestMapping("/find.action")
	public String findByIdGoodsController(int id,ModelMap map){
		//得到单条数据
		Goods goods = service.findByIdGoods(id);
		//将数据保存到页面
		map.addAttribute("g", goods);
		return "/updateGoods.jsp" ;  //转发到此页面
	}
	
	@RequestMapping("/delGoods.action")
	public void deleteGoodsController(int id,PrintWriter out){
		 //得到删除的方法
		service.deleteGoods(id);
		out.write("删除成功");
	}
	
	@RequestMapping("/add.action")
	public void addGoodsController(Goods g,PrintWriter out){
		//得到添加的方法
		service.addGoods(g);
		out.write("添加成功");
	}
	
	@RequestMapping("/updateGoods.action")
	public void updateGoodsController(Goods g,PrintWriter out){
		//得到修改数据的方法
		service.updateGoods(g);
		out.write("修改成功");
	}
	
	@RequestMapping(value="/findByName.action",produces="application/json;charset=utf-8")
	@ResponseBody  //得到json或字符串数据，阻止页面转发或重定向
	public List<Goods> findByNameGoodsController(String name){
		//得到模糊查询的方法
		List<Goods> list = service.findByNameGoods(name);
		return list ;
	}
}
