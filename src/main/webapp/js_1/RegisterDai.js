$('#iform').form({
	url : "dai/RegisterDai",
	success : function(data) {
		if ($.trim(data) == "true") {
			alert("请耐心等待,正在审核....");
		} else {
			alert(" 注册失败!! 可能是您已经是待递员了");
		}
		$('#iform').reset();
	}

});

$('#iform').form({
	url : "zxd/RegisterDai",
	success : function(data) {
		if (data) {
			alert("恭喜你成为小递，加油哦！");
			window.location.href("index.jsp")
		} else {
			alert(" 注册失败");
		}
	}
});

function addpic(obj) {
	var picStr = window.URL.createObjectURL(obj.files[0]);
	$("#upicimage").attr("src", picStr);
};
