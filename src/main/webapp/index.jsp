<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>校园快递</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">

<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="Keywords"
	content="校园快递,代收货,发件,网购代收货,自提点,代收点,O2O,淘宝自提点,当当自提点,顺丰合作,社区店">
<meta name="description"
	content="校园快递 – 国内首家代收货服务提供者, 通过遍布城市各大角落的社区店，为您提供最便捷的收货服务体验。让您不用再担心家中没有人不能收快递；不用担心大件物品送到公司，但不方便挤公交车带回家；不用担心快递不准时，只能在家干等。还有手机App能够更快地为您找到附近的代收点哦！">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script src="js/jquery-1.js" type="text/javascript"></script>
<script src="js/swiper.js" type="text/javascript"></script>
<script src="js/base.js" type="text/javascript"></script>
<script src="js/page.js" type="text/javascript"></script>

<script src="js/wb.js" type="text/javascript" charset="utf-8"></script>

<script charset="UTF-8" src="js/bundle.js"></script>
<script charset="UTF-8" src="js/iframeWidget.js"></script>
<link type="text/css" rel="stylesheet" href="css/index.css" />
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css" />
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css" />
</head>
<body>
	<iframe style="display: none;" id="sina_anywhere_iframe"></iframe>
	<div class="header-top">
		<div class="com-w">
			<c:choose>
				<c:when test="${loginUser eq null }">
					<p class="h-wel">
						<a href="page/Login.jsp">[请登录]</a>校园快递
					</p>
				</c:when>
				<c:otherwise>
					<p class="h-wel">
						<span
							style="color: #E76D26; font-size: 14px; font-weight: bold; font-style: italic;">${loginUser.uname}</span>,&nbsp;欢迎你来到校园快递!
					</p>

					<input type="hidden" id="uuidhidden" name="uuidhidden"
						value="${loginUser.uuid}" />
				</c:otherwise>
			</c:choose>

			<div class="h-r">
				<ul>
					<li class="h-qq"><em></em>
						<div class="qq-tanchu">
							<b></b>
							<p>
								校园快递在线客服 <br> <span class="gray">4007333390</span>
							</p>
							<a onclick='KF.closeIMC(this,"SOFTWARE")' class="btn"
								target="_blank"
								href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4007333390&amp;f=1&amp;ty=1&amp;">点击咨询</a>
						</div></li>
					<!--未关注-->
					<li class="h-sina"><em></em>
						<div class="sina-tanchu" style="left: 845px; display: none;">
							<b></b>
							<p>
								校园快递官方微博： <br> <img src="image/logo1.png">
							</p>
							<wb:follow-button uid="2137795655" type="red_1" width="67"
								height="24" class="gz2">
								<iframe
									src="%E6%94%B6%E8%B4%A7%E5%AE%9D_files/followbutton_002.htm"
									scrolling="no" marginheight="0" width="67" height="24"
									frameborder="0"></iframe>
							</wb:follow-button>
						</div></li>
					<!--已关注-->
					<li class="h-sina" style="display: none;">
						<div class="sina-followed">
							<wb:follow-button uid="2137795655" type="red_1" width="67"
								height="24" class="gz3">
								<iframe
									src="%E6%94%B6%E8%B4%A7%E5%AE%9D_files/followbutton_002.htm"
									scrolling="no" marginheight="0" width="67" height="24"
									frameborder="0"></iframe>
							</wb:follow-button>
						</div>
					</li>
					<li class="h-tel"><em></em><img src="image/tel.jpg"></li>
				</ul>
			</div>
		</div>
	</div>


	<div class="header-mid">
		<div class="com-w bh-posRlt">
			<div class="logo" id="logo">
				<p>
					<a href="http://www.shouhuobao.com/shooter/index.html"><img
						src="image/Logo.jpg"></a>
				</p>
			</div>
			<div class="menu_1">
				<ul>
					<li class="on"><a href="#"
						style="color: #e76d26; border-bottom: 2px solid #e76d26;">首页</a></li>
					<li><a href="page/about.jsp">关于我们</a></li>
					<li><a href="page/Login.jsp">商户中心</a></li>
					<li><a href="page/order.jsp">我要投单</a></li>
					<li><a href="page/profile.jsp">个人中心</a></li>
				</ul>
			</div>
			<div class="navShow"></div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="banner"
		style="background: rgb(46, 43, 60) none repeat scroll 0% 0%;">
		<ul style="margin-left: -4047px; transition: NaNpx 0s ease 0s;">
			<li
				style="background: rgb(205, 43, 58) none repeat scroll 0% 0%; padding-left: 44.5px; padding-right: 44.5px;"><a
				href="#" target="_blank"><img src="image/banner-1.jpg"></a></li>
			<li style="padding-left: 44.5px; padding-right: 44.5px;"><a
				href="#" target="_blank"><img src="image/banner-2.jpg"></a></li>
			<li style="padding-left: 44.5px; padding-right: 44.5px;"><a
				href="#" target="_blank"><img src="image/banner-3.jpg"></a></li>
			<li style="padding-left: 44.5px; padding-right: 44.5px;"><a
				href="#" target="_blank"><img src="image/banner-2.jpg"></a></li>
		</ul>
		<div class="slidetabs">
			<span class="" style="transition: all 0.5s ease 0s;"></span>
			<!--<span style="transition: all 0.5s ease 0s;" class=""></span>
			<span style="transition: all 0.5s ease 0s;" class=""></span>
			<span style="transition: all 0.5s ease 0s;" class="current"></span> -->
		</div>
		<b class="prevSlider" style="display: none;"></b> <b
			class="nextSlider" style="display: none;"></b>
	</div>
	<div class="content">
		<div class="com-w" id="container_l">
			<h3 class="com-title">让生活更简单</h3>
			<div class="content-bottom-l-1">
				<div class="tag_list">
					<dl>
						<dt>
							<em>分类</em>
						</dt>
						<dd id="typelist"></dd>
					</dl>
					<div class="clear"></div>
				</div>
			</div>
			<div class="l_box_list" id="topic_list">
				<ul id="expressList">
				</ul>

			</div>
			<div id="getordmsg" style="display: none">
				<input type="text" name="ordoramsg" id="ordoramsg" class="ordoramsg"
					placeholder="请输入预计到达时间" required="required"> <input
					type="button" onclick="applyorder()" value="提交" class="submitorder">
				<input type="hidden" id="hiddoid" name="hiddoid"> <input
					type="hidden" id="hidddid" name="hidddid">
			</div>
			<div class="page-sep-wrap">
				<div class="page-sep" id="pagation">
					<div class="clear"></div>
				</div>
			</div>
		</div>

	</div>
	<div class="cooperative">
		<img src="image/mycompany.png" width="100%">
	</div>

	<div class="aboutUs">
		<div class="com-w">
			<h3 class="com-title">关注我们</h3>
			<ul class="bh-overf guanzhul">
				<li>
					<div class="guanzhuTan guanzhu1">
						<p>
							<img src="image/shbwxda.jpg" class="daimgs"><img
								src="image/guan.png" class="guanicon">
						</p>
					</div>
				</li>
				<li>
					<div class="guanzhuwms">
						<img src="image/shbwxq.jpg"><span
							style="background-color: #fcd020;" class="shbwx1">我要发快递 </span><i>关注校园快递快递微信</i>
					</div>
					<div class="guanzhuTan guanzhu1">
						<p>
							<img src="image/shbwxqda.jpg" class="daimgs"><img
								src="image/guan.png" class="guanicon">
						</p>
					</div>
				</li>
				<li class="mobileShow"></li>
			</ul>
		</div>
	</div>

	<div class="footer">
		<div class="com-w">
			<div class="bh-overf">

				<!-- <div class="f-aboutUs">
        <h3>关注我们</h3>
        <ul>
          <li><img src="images/er3.jpg" />
            <p> 校园快递官方微信 </p>
          </li>
          <li><img src="images/er4.jpg" />
            <p> 社区服务联盟官方微信 </p>
          </li>
          <div class="clearfix"></div>
        </ul>
      </div> -->
				<div class="clearfix"></div>
			</div>
			<!-- <div class="pad-help"> <a href="http://www.shouhuobao.com/index!introduction.html">校园快递简介</a> <a href="http://www.shouhuobao.com/index!service.html">什么是代收货服务</a> <a href="http://www.shouhuobao.com/index!cooperation.html">对外合作</a> <a href="http://www.shouhuobao.com/index!join.html">网点加盟</a> </div> -->
			<div class="copyRight bh-overf">
				<p>
					<span>©2011-2015 Shouhuobao.com 版权所有</span><span
						class="copyright-icp">京ICP证140708号 京ICP备11018594号-1<b>京公网安备编号：11010502026840</b></span>
					<span class="copyAddress">公司地址：湖南省衡阳市酃湖乡衡花路18号</span>
				</p>
				<img src="image/copyRight.jpg" class="bh-fr">
			</div>
		</div>
	</div>
	<div class="back" style="display: none;">
		<a href="#logo"></a>
	</div>

	<script src="js_1/jquery-1.12.4.js" type="text/javascript"></script>
	<script src="js_1/index.js" type="text/javascript"></script>
	<script src="easyui/jquery.min.js" type="text/javascript"></script>
	<script src="easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script src="easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="js/h.js" type="text/javascript"></script>
</body>
</html>
