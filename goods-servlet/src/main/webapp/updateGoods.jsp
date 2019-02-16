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
	<h1>修改商品</h1>
	<div id="update">
		商品ID:<input type="text" v-model="id" disabled="disabled" /> <br/>
    	商品名称:<input type="text" v-model="name" /> <br/>
       	商品价格:<input type="text" v-model="price" /> <br/>
       	 类型ID:<input type="text" v-model="c_id" /> <br/>
        <button @click="modifi()">确定修改</button>
    </div>
</body>
</html>

<script>
	var vm = new Vue({
		el:'#update',
		data:{
			id:'${requestScope.g.id}',
			name:'${requestScope.g.name}',
			price:'${requestScope.g.price}',
			c_id:'${requestScope.g.c_id}'
		},
		methods:{
			modifi:function(){
				//得到表单的数据
				var id = this.id ;
				var name = this.name ;
				var price = this.price ;
				var c_id = this.c_id ;
				//alert(id);
				//执行ajax请求
				$.ajax({
					url:'${pageContext.request.contextPath}/updateGoods.action',
					method:'POST',
					data:{"id":id,"name":name,"price":price,"c_id":c_id},
					dataType:'text',
					success:function(data){
						alert(data);
						//跳转到主页面
						window.location.href = "${pageContext.request.contextPath}/Vuetable.jsp" ;
					}
				});
			}
		}
	});
</script>
