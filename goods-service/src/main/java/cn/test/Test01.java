package cn.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.entity.Goods;
import cn.service.dao.impl.GoodsServiceDaoImpl;

public class Test01 {
	public static void main(String[] args) {
		ApplicationContext con = 
				new ClassPathXmlApplicationContext("applicationContext-dao.xml","applicationContext-service.xml");
		GoodsServiceDaoImpl service = 
				con.getBean("goodsServiceDaoImpl", GoodsServiceDaoImpl.class);
		
		List<Goods> list = service.findByNameGoods("手");
		System.out.println(list);
	}
}
