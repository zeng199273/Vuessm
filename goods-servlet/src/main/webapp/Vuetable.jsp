<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Vue综合练习</title>
<!-- 导入Vue的在线插件 -->
<script src="https://cdn.bootcss.com/vue/2.2.2/vue.min.js"></script>
<!-- 导入Vue Ajax的在线插件 -->
<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
<!-- 导入jQuery在线插件 -->
<script src="https://code.jquery.com/jquery.js"></script>
</head>
<body>	
	<h1>商品管理系统综合练习</h1>
	<div id="box">
		<p>
			模糊查询:<input type="text" name="name"/> 
			<button @click="query()">查询</button>
		</p>
    	<table border="1" width="500">
        	<tr>
            	<td>商品ID</td>
                <td>商品名称</td>
                <td>商品价格</td>
                <td>类型ID</td>
                <td>操作</td>
            </tr>
            <tr v-for="g in goods">
            	<td v-text="g.id"></td>
                <td v-text="g.name"></td>
                <td v-text="g.price"></td>
                <td v-text="g.c_id"></td>
                <td>
                	<a href="#" @click="add()">添加</a>&nbsp;&nbsp;
                    <a href="#" @click="modifi(g)">修改</a>&nbsp;&nbsp;
                    <a href="#" @click="del(g)">删除</a>
                </td>
            </tr>
        </table>
        <p>
        	<a href="#">上一页</a>
        	<a href="#">下一页</a>
        </p>
    </div>
</body>
</html>

<script>
	var url = "${pageContext.request.contextPath}/findAll.action" ;
	var vm = new Vue({
		el:'#box',	
		data:{
			goods:[]
		},
		methods:{
			//删除数据的方法
			del:function(gs){
				var url = "${pageContext.request.contextPath}/delGoods.action?id="+gs.id ;
				this.$http.get(url).then(function(data){
					location.reload(true);
				});
			},
			//添加数据的方法
			add:function(){
				//跳转到添加页面
				window.location.href = "${pageContext.request.contextPath}/addGoods.html" ;
			},
			//修改数据的方法
			modifi:function(g){
				//跳转到修改页面
				window.location.href = "${pageContext.request.contextPath}/find.action?id="+g.id ;
			},
			//模糊查询的方法
			query:function(){
				//得到表单的值
				var name = $("input[name=name]").val();
				//alert(name);
				//发送请求，得到数据
				var url = "${pageContext.request.contextPath}/findByName.action";
				this.$http.post(url,{name:name},{emulateJSON:true})
				.then(function(data){
					this.goods = data.data ;
				},function(){
					alert("请求失败");
				}); 
			}
		},
		//vue的生命周期
		mounted:function(){
			//一上来就执行ajax请求，得到数据 
			this.$http.get(url).then(function(data){
				this.goods = data.data ;
			},function(){
				alert("请求失败");
			});
		}
	});
</script>
