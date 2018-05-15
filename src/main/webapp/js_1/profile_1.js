var parameuuid=$("#uuidhidden").val();

$.get("zxd/worderlist?uuid="+parameuuid,function(data){
	$("#waitComment").empty();
	$("#waitComment").text(data.total);
},"json");

$.get("zxd/corderlist?uuid="+parameuuid,function(data){
	$("#waitComing").empty();
	$("#waitComing").text(data.total);
},"json");

getOrders(1,parameuuid)

$('#win').window({    
    width:250,    
    height:350,    
    modal:true,
    title:'接单人信息',
    maximizable:false,
    minimizable:false,
    collapsible:false,
    closed:true,
    
}); 

//查询所有订单信息
function getOrders(pageNum,uuid){
	$.post("zxd/orderlist?page="+pageNum+"&uuid="+uuid,function(data){
		$("#orderlist").empty();
		var orders=data.rows;
		for(var i=0;i<orders.length;i++){
			$("#orderlist").append("<tr  class='timeline' order-timeline=''ng-repeat='item in orderList'>"+
								"<td class='ordertimeline-time'><h3>"+orders[i].ooid+
								"</h3><i class='ordertimeline-time-icon icon-uniE65D ng-scope unreview'ng-if='item.realStatus !== 5'"+
								"ng-class='{'unfinish': item.realStatus !== 4, 'unreview': item.realStatus === 4}'></i>"+
								"</td><td class='ordertimeline-avatar'><img src='"+orders[i].upicture+"'></td>"+
								"<td class='ordertimeline-info'><h3 class='ordertimeline-title'>"+
								"<a ng-href='/shop/562286' ng-bind='item.restaurant.name'"+
								"class='ng-binding' href='javascript:void(0)'>"+orders[i].otype+"</a>"+
								"</h3><p class='ordertimeline-info-food'><span"+
								"class='ordertimeline-food ng-binding' ng-bind='item.product'>"+
								orders[i].osize+"</span>&nbsp;&nbsp;<span class='ordertimeline-info-productnum ng-binding'"+
								"ng-bind='item.productnum'>"+orders[i].zaddr+"</span>&nbsp;&nbsp;<span>"+orders[i].otime+"</span>"+
								"</p><p>订单描述：<a ng-href='order/id/1202435690561146071'"+
								"ng-bind='item.unique_id' class='ng-binding'"+
								"href='javascript:void(0)'>"+orders[i].odesc+"</a></p></td>"+
								"<td class='ordertimeline-amount'><h3 class='ordertimeline-title ordertimeline-price ui-arial ng-binding'"+
								"ng-bind='item.total_amount.toFixed(2)'>￥"+orders[i].oprice+".00</h3>"+
								"</td><td class='ordertimeline-status'><a href='javascript:void(0)' onclick='showDU("+orders[i].did+")'><h3 ng-bind='item.statusText'"+
								"ng-class='{'waitpay': (item.realStatus === 1), 'end': (item.realStatus === 5)}'"+
								"class='ng-binding'>"+orders[i].did+"</h3></a></td>"+
								"<td class='ordertimeline-handle'>"+
								"<span ng-if='item.realStatus === 4'"+
								"><a ng-href='order/rate/1202435690561146071' href='javascript:void(0)'>"+orders[i].ostatus+
								"</span></td></tr>");

			
		}
		
		$("#orderPage").empty();
		$("#orderPage").append("<li class='current'>1</li><li>2</li><li>3</li><li>4</li><li>5</li>")
		
	},"json");
	
}


//显示接单人的信息
function showDU(did){
	$.post("zxd/findDU?did="+did,function(data){
		//alert(data.uuid+data.uname+data.usex+data.uphone+data.uemail+data.uaddr);
		//$.messager.show(data.uuid,data.uname);
		$('#win').window('open');
		$("#uuid").html(data.uuid);
	    $("#uname").html(data.uname);
	    $("#usex").html(data.usex);
	    $("#uphone").html(data.uphone);
	    $("#uemail").html(data.email);
	    $("#uaddr").html(data.uaddr);
	},"json");
	
}


//查询等待评价的订单信息
function getWaitOrders(pageNum,uuid){
	$.post("zxd/worderlist?page="+pageNum+"&uuid="+uuid,function(data){
		$("#waitComment").empty();
		$("#waitComment").text(data.total);
		$("#orderlist").empty();
		var orders=data.rows;
		for(var i=0;i<orders.length;i++){
			$("#orderlist").append("<tr  class='timeline' order-timeline=''ng-repeat='item in orderList'>"+
								"<td class='ordertimeline-time'><h3>"+orders[i].ooid+
								"</h3><i class='ordertimeline-time-icon icon-uniE65D ng-scope unreview'ng-if='item.realStatus !== 5'"+
								"ng-class='{'unfinish': item.realStatus !== 4, 'unreview': item.realStatus === 4}'></i>"+
								"</td><td class='ordertimeline-avatar'><img src='"+orders[i].upicture+"'></td>"+
								"<td class='ordertimeline-info'><h3 class='ordertimeline-title'>"+
								"<a ng-href='/shop/562286' ng-bind='item.restaurant.name'"+
								"class='ng-binding' href='javascript:void(0)'>"+orders[i].otype+"</a>"+
								"</h3><p class='ordertimeline-info-food'><span"+
								"class='ordertimeline-food ng-binding' ng-bind='item.product'>"+
								orders[i].osize+"</span>&nbsp;&nbsp;<span class='ordertimeline-info-productnum ng-binding'"+
								"ng-bind='item.productnum'>"+orders[i].zaddr+"</span>&nbsp;&nbsp;<span>"+orders[i].otime+"</span>"+
								"</p><p>订单描述：<a ng-href='order/id/1202435690561146071'"+
								"ng-bind='item.unique_id' class='ng-binding'"+
								"href='javascript:void(0)'>"+orders[i].odesc+"</a></p></td>"+
								"<td class='ordertimeline-amount'><h3 class='ordertimeline-title ordertimeline-price ui-arial ng-binding'"+
								"ng-bind='item.total_amount.toFixed(2)'>￥"+orders[i].oprice+".00</h3>"+
								"</td><td class='ordertimeline-status'><a href='javascript:void(0)' onclick='showDU("+orders[i].did+")'><h3 ng-bind='item.statusText'"+
								"ng-class='{'waitpay': (item.realStatus === 1), 'end': (item.realStatus === 5)}'"+
								"class='ng-binding'>"+orders[i].did+"</h3></a></td>"+
								"<td class='ordertimeline-handle'>"+
								"<span ng-if='item.realStatus === 4'"+
								"class='ordertimeline-handle-group ng-scope'><a ng-href='order/rate/1202435690561146071' href='javascript:void(0)' onclick='comments("+orders[i].ooid+","+orders[i].did+")'>"+orders[i].ostatus+
								"</span></td></tr>");

			
		}
		
		$("#orderPage").empty();
		$("#orderPage").append("<li class='current'>1</li><li>2</li><li>3</li><li>4</li><li>5</li>")
		
	},"json");
	
}

//评价订单按钮
function comments(ooid,did){
	$.get("zxd/orderInfo?ooid="+ooid,function(data){
		//alert(data);
		$("#main").empty();
		$("#main").append('<h3 ng-if="pageTitleVisible" class="profile-paneltitle ng-scope">'+
					'<span ng-bind="pageTitle" class="ng-binding">待评价订单</span> <span'+
					' class="subtitle ng-binding"'+
					' ng-bind-html="pageSubtitle | toTrusted">带(<span'+
					' class="stress">*</span>)标志为必填项</span></h3>'+
					'<div class="profile-panelcontent" ng-transclude="">'+
					'<div ng-if="unrated" class="unrated-orderinfo ng-scope">'+
					'<div class="unrated-orderinfo-item">'+
					'<a ng-href="/shop/1361765" href="https://www.ele.me/shop/1361765"><img'+
					' ng-src="//fuss10.elemecdn.com/7/37/3035f05e693d405b214af9941e100jpeg.jpeg?imageMogr2/thumbnail/48x48/format/webp/quality/85"'+
					' alt="'+data.otype+'"'+
					'src="https://fuss10.elemecdn.com/7/37/3035f05e693d405b214af9941e100jpeg.jpeg?imageMogr2/thumbnail/48x48/format/webp/quality/85"></a>'+
					'<div class="rstinfo"><h3>'+
					'<a class="color-normal ng-binding" ng-href="/shop/1361765"'+
					'ng-bind="unrated.rstName"'+
					'href="javascript:void(0)">'+data.zaddr+'</a></h3><p>'+
					'<span ng-bind="unrated.foodConcat" class="ng-binding">'+data.odesc+'</span>&nbsp;&nbsp;<span'+
					' class="stress ng-binding" ng-bind="unrated.foodQuantity">'+data.osize+'</span></p></div></div>'+
					'<span class="unrated-orderinfo-item ng-binding ">'+
					'下单时间：'+data.otime+'</span></div>'+
					'<div ng-if="unrated" class="unrated-rate ng-scope">'+
					'<div class="unrated-ratelist">'+
					'<span class="unrated-ratelist-label"><span>*</span>代递员服务</span>'+
					'<div class="unrated-ratelist-content rate ng-isolate-scope"'+
					' rate="" config="rateServiceConfig" value="rate.service"'+
					'isreadonly="stableRate.service.value">'+
					'<p class="rate-star star level0"'+
					' ng-class="{readonly: isreadonly, star: starStyle}">'+
					'<span ng-click="doRate($event)" ng-mouseover="doRate($event)"'+
					'ng-mouseleave="doRate($event)" data-level="0">'+
					'<a	class="icon-star-rate" href="javascript:" data-level="1"'+
					' ng-class="{active : rateLevel >= 1}"></a> '+
					'<a	class="icon-star-rate" href="javascript:" data-level="2"'+
					' ng-class="{active : rateLevel >= 2}"></a>'+
					'<a	class="icon-star-rate" href="javascript:" data-level="3"'+
					' ng-class="{active : rateLevel >= 3}"></a>'+
					'<a	class="icon-star-rate" href="javascript:" data-level="4"'+
					' ng-class="{active : rateLevel >= 4}"></a>'+
					'<a	class="icon-star-rate" href="javascript:" data-level="5"'+
					'ng-class="{active : rateLevel >= 5}"></a></span>'+
					'<span ng-if="config.tipText"'+
					' class="active rate-star-text ng-binding ng-scope"'+
					'ng-bind="config.tipText[rateLevel]">点击星星打分</span>'+
					'</p></div></div><div class="unrated-ratelist offset">'+
					'<button class="btn-primary btn-lg" ng-click="rateSubmit()">提交评价</button>'+
					'</div></div></div>');
		
	},"json");
	
	/*$.get("zxd/comments?ooid="+ooid+"&did="+did,function(data){
		
		
	},"json");
	*/
}

//查询取消订单的订单信息
function getCancleOrders(pageNum,uuid){
	$.post("zxd/cancleorderlist?page="+pageNum+"&uuid="+uuid,function(data){
		$("#orderlist").empty();
		var orders=data.rows;
		for(var i=0;i<orders.length;i++){
			$("#orderlist").append("<tr  class='timeline' order-timeline=''ng-repeat='item in orderList'>"+
								"<td class='ordertimeline-time'><h3>"+orders[i].ooid+
								"</h3><i class='ordertimeline-time-icon icon-uniE65D ng-scope unreview'ng-if='item.realStatus !== 5'"+
								"ng-class='{'unfinish': item.realStatus !== 4, 'unreview': item.realStatus === 4}'></i>"+
								"</td><td class='ordertimeline-avatar'><img src='"+orders[i].upicture+"'></td>"+
								"<td class='ordertimeline-info'><h3 class='ordertimeline-title'>"+
								"<a ng-href='/shop/562286' ng-bind='item.restaurant.name'"+
								"class='ng-binding' href='javascript:void(0)'>"+orders[i].otype+"</a>"+
								"</h3><p class='ordertimeline-info-food'><span"+
								"class='ordertimeline-food ng-binding' ng-bind='item.product'>"+
								orders[i].osize+"</span>&nbsp;&nbsp;<span class='ordertimeline-info-productnum ng-binding'"+
								"ng-bind='item.productnum'>"+orders[i].zaddr+"</span>&nbsp;&nbsp;<span>"+orders[i].otime+"</span>"+
								"</p><p>订单描述：<a ng-href='order/id/1202435690561146071'"+
								"ng-bind='item.unique_id' class='ng-binding'"+
								"href='javascript:void(0)'>"+orders[i].odesc+"</a></p></td>"+
								"<td class='ordertimeline-amount'><h3 class='ordertimeline-title ordertimeline-price ui-arial ng-binding'"+
								"ng-bind='item.total_amount.toFixed(2)'>￥"+orders[i].oprice+".00</h3>"+
								"</td><td class='ordertimeline-status'><a href='javascript:void(0)' onclick='showDU("+orders[i].did+")'><h3 ng-bind='item.statusText'"+
								"ng-class='{'waitpay': (item.realStatus === 1), 'end': (item.realStatus === 5)}'"+
								"class='ng-binding'>"+orders[i].did+"</h3></a></td>"+
								"<td class='ordertimeline-handle'>"+
								"<span ng-if='item.realStatus === 4'"+
								"><a ng-href='order/rate/1202435690561146071' href='javascript:void(0)'>"+orders[i].ostatus+
								"</span></td></tr>");

			
		}
		
		$("#orderPage").empty();
		$("#orderPage").append("<li class='current'>1</li><li>2</li><li>3</li><li>4</li><li>5</li>")
		
	},"json");
	
}
	
//查询等待收货的订单信息
function getComingOrders(pageNum,uuid){
	$.post("zxd/corderlist?page="+pageNum+"&uuid="+uuid,function(data){
		$("#waitComing").empty();
		$("#waitComing").text(data.total);
		$("#orderlist").empty();
		var orders=data.rows;
		for(var i=0;i<orders.length;i++){
			$("#orderlist").append("<tr  class='timeline' order-timeline=''ng-repeat='item in orderList'>"+
								"<td class='ordertimeline-time'><h3>"+orders[i].ooid+
								"</h3><i class='ordertimeline-time-icon icon-uniE65D ng-scope unreview'ng-if='item.realStatus !== 5'"+
								"ng-class='{'unfinish': item.realStatus !== 4, 'unreview': item.realStatus === 4}'></i>"+
								"</td><td class='ordertimeline-avatar'><img src='"+orders[i].upicture+"'></td>"+
								"<td class='ordertimeline-info'><h3 class='ordertimeline-title'>"+
								"<a ng-href='/shop/562286' ng-bind='item.restaurant.name'"+
								"class='ng-binding' href='javascript:void(0)'>"+orders[i].otype+"</a>"+
								"</h3><p class='ordertimeline-info-food'><span"+
								"class='ordertimeline-food ng-binding' ng-bind='item.product'>"+
								orders[i].osize+"</span>&nbsp;&nbsp;<span class='ordertimeline-info-productnum ng-binding'"+
								"ng-bind='item.productnum'>"+orders[i].zaddr+"</span>&nbsp;&nbsp;<span>"+orders[i].otime+"</span>"+
								"</p><p>订单描述：<a ng-href='order/id/1202435690561146071'"+
								"ng-bind='item.unique_id' class='ng-binding'"+
								"href='javascript:void(0)'>"+orders[i].odesc+"</a></p></td>"+
								"<td class='ordertimeline-amount'><h3 class='ordertimeline-title ordertimeline-price ui-arial ng-binding'"+
								"ng-bind='item.total_amount.toFixed(2)'>￥"+orders[i].oprice+".00</h3>"+
								"</td><td class='ordertimeline-status'><a href='javascript:void(0)' onclick='showDU("+orders[i].did+")'><h3 ng-bind='item.statusText'"+
								"ng-class='{'waitpay': (item.realStatus === 1), 'end': (item.realStatus === 5)}'"+
								"class='ng-binding'>"+orders[i].did+"</h3></a></td>"+
								"<td class='ordertimeline-handle'>"+
								"<span ng-if='item.realStatus === 4'"+
								"class='ordertimeline-handle-group ng-scope'><a ng-href='order/rate/1202435690561146071' href='javascript:void(0)' onclick='sureOrder("+orders[i].ooid+")'>"+orders[i].ostatus+
								"</span></td></tr>");

			
		}
		
		/*$("#orderPage").empty();
		$("#orderPage").append("<li class='current'>1</li><li>2</li><li>3</li><li>4</li><li>5</li>")*/
		
	},"json");
	
}

//确认收货
function sureOrder(ooid){
	$.get("zxd/sureOrder?ooid="+ooid,function(data){
		//alert(data);

		$.messager.alert('确认收货', '确认收货成功！！！', 'warning');
		var uuid=$("#uuidhidden").val();
		getComingOrders(1,uuid);
		$.get("zxd/worderlist?uuid="+parameuuid,function(data){
			$("#waitComment").empty();
			$("#waitComment").text(data.total);
		},"json");

		$.get("zxd/corderlist?uuid="+parameuuid,function(data){
			$("#waitComing").empty();
			$("#waitComing").text(data.total);
		},"json");
		
		

		
		/*if(data.trim() == "true") {
			$.messager.confirm('确认对话框', '您确认要收货吗？', function(r){
				if (r){
					$.messager.alert('确认收货', '确认收货成功！！！', 'warning');
					
				}
			});
			
			$.get("zxd/worderlist?uuid="+parameuuid,function(data){
				$("#waitComment").empty();
				$("#waitComment").text(data.total);
			},"json");

			$.get("zxd/corderlist?uuid="+parameuuid,function(data){
				$("#waitComing").empty();
				$("#waitComing").text(data.total);
			},"json");
		} else {
			$.messager.show({
				title : '确认收货',
				msg : '确认收货失败!!!',
				timeout : 5000,
				showType : 'show',
				style : {
					top : document.body.scrollTop
							+ document.documentElement.scrollTop,
				}
			});
		}
*/
		
	},"json")
	
}

