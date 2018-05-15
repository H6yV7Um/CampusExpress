<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>星星投票</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" >

//定义函数记录星星状态
function SaveClass()
{
 var temClassArry = new Array()
 $("#UserStart > li").each(function(i){
 temClassArry[i] = $(this).attr("class");
 })
 return temClassArry;
}
$(document).ready(function(){
 var temparray = SaveClass();

//鼠标滑到星星上
 $("#UserStart > li").mousemove( 
  function(){
   var currentCount=0;
   currentCount = $("#UserStart > li").index($(this)[0])
   $("#UserStart > li").each(function(i){if(i<=currentCount) 
      {
       $(this).removeClass();
       $(this).addClass("on");
      }
      else
      {
       $(this).removeClass();
       $(this).addClass("off");
      }})
  }
 )

//鼠标在星星上点击
  $("#UserStart > li").click(function(){
   temparray = SaveClass();
  })

//鼠标滑出星星上
$("#UserStart > li").mouseout(function(){
  $("#UserStart > li").each(function(i){
   $(this).removeClass();
   $(this).addClass(temparray[i]);
  })
  })
});
</script>

</head>
<body>
	<ul class="star" id="UserStart" style="list-style:none;">
		<li class="on" ></li>
		<li class="on"></li>
		<li class="off"></li>
		<li class="off"></li>
		<li class="off"></li>
		<li class="off"></li>
		<li class="off"></li>
		<li class="off"></li>
		<li class="off"></li>
		<li class="off"></li>
	</ul>
</body>
</html>
