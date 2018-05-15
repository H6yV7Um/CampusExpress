showDai();
function showDai(){
	$('#DaiApplyTable').datagrid({
		url : 'dai/listDai',
		loadMsg: "数据加载中...",
		pagination : true, //底部显示分页工具栏
		toolbar : '#toolSignIn',
		pageList : [ 5, 10, 15, 20, 25, 30 ],/* 每页的条数(可选) */
		fitColumns : true,// 自适应
		singleSelect : true,// 只能选择一条(单选)
		columns : [ [{field : 'uuid',title : '用户编号',width : 70,align : 'center'},
					{field : 'dsid',title : '认证学号',width : 110,align : 'center'},
					{field : 'dspic',title : '学生证照片',width : 130,align : 'center',
						formatter : function(value, row, index) {
										if (row.upicture == null	|| row.upicture == "\\upload\\") {
											return "<img width='100' src='image/1.jpg'/>"
										} else {
											return "<img width='100' src='"	+ row.upicture + "'/>"
										}
						}
					},
					{field : 'opr',title : '操作',width : 100,align : 'center',
						formatter : function(value, row, index) {
									var oprStr =  '<a class="agreeBtn" href="javascript:void(0)" '
												+'onclick="agree('+ row.uuid	 +')">同意</a>  '
												+'<a class="refuseBtn" href="javascript:void(0)" '
												+'onclick="refuse('+ row.uuid	 +')">拒绝</a>  '
												+ '<script>$(".agreeBtn").linkbutton({iconCls: "icon-ok"});  </script>'
												+ '<script>$(".refuseBtn").linkbutton({iconCls: "icon-no"});  </script>';
										return oprStr;
						}
	
					}, ] ]
	});

}

//同意成为待递员
 function agree(uuid ){
	  $.get("dai/agree?uuid="+uuid,function(data){
		if(!data){
			$.messager.show({
				title : '提示信息',
				msg : '同意失败!!',
				showType : 'show',
				style : {
					top : document.body.scrollTop
							+ document.documentElement.scrollTop,
					bottom : ''
				}
			});
		
		}else{
			showDai();
		}
	},"json");
  }
 
//拒绝成为待递员
 function refuse(uuid ){
	  $.get("dai/refuse?uuid="+uuid,function(data){
		if(!data){
			$.messager.show({
				title : '提示信息',
				msg : '拒绝失败!!',
				showType : 'show',
				style : {
					top : document.body.scrollTop
							+ document.documentElement.scrollTop,
					bottom : ''
				}
			});
		}else{
			showDai();
		}
	},"json");
  }
 
 
 
 
 
 
 