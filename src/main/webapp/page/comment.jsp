<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<base href="<%=path%>">
<title>个人中心</title>

<link href="css/vendor.css" rel="stylesheet">

<link href="css/profile.css" rel="stylesheet">
<link href="css/icon/iconfont.css" type="text/css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css">


<script src="js_1/perf.js" type="text/javascript"
	crossorigin="anonymous"></script>
<script src="js_1/vendor.juerys" type="text/javascript"
	crossorigin="anonymous"></script>
<script src="js_1/profile.js" type="text/javascript"
	crossorigin="anonymous"></script>



</head>

<body cute-title=""
	ng-class="{hidesidebar: layoutState &amp;&amp; layoutState.hideSidebar, smallbody: layoutState.smallBody, whitebody: layoutState.whiteBody}"
	style="position: relative;" lim:visitorcapacity="1">

	<input type="hidden" id="uuidhidden" name="uuidhidden"
		value="${loginUser.uuid}" />
	<div ng-switch="state.type" state="layoutState"
		class="ng-isolate-scope">
		<!-- ngSwitchWhen: checkout -->
		<!-- ngSwitchDefault:  -->
		<div ng-switch-default="" topbar-default="" state="state"
			class="ng-scope ng-isolate-scope">
			<header class="topbar" role="navigation"
				ng-class="{shoptopbar: state.type === 'shop'}">
				<div class="container clearfix">
					<a href="index.jsp" hardjump="" class="topbar-item topbar-homepage"
						ng-class="{'focus': $root.locationpath[0] === 'place'}">首页</a> <a
						href="page/profile_order.jsp" hardjump="" class="topbar-item"
						ng-class="{'focus': $root.locationpath[1] === 'order'}">我的订单</a>
					<nav class="topbar-nav">
						<div topbar-profilebox="">
							<div class="topbar-profilebox">
								<!-- ngIf: $root.user.avatar && $root.topbarType !== 'checkout' -->
								<span class="topbar-profilebox-avatar icon-profile ng-hide"
									ng-show="!$root.user.username"></span> <span
									ng-show="!$root.user.username" class="ng-hide"> <a
									ng-href="https://account.ele.me/login" target="_blank"
									href="https://account.ele.me/login">登录</a>/<a
									ng-href="https://account.ele.me/register" target="_blank"
									href="https://account.ele.me/register">注册</a></span> <span
									class="topbar-profilebox-wrapper" ng-show="$root.user.username">
									<!-- ngIf: $root.topbarType === 'checkout' --> <span
									class="topbar-profilebox-username ng-binding">黄小小小州</span> <!-- ngIf: $root.topbarType !== 'checkout' -->
									<span class="topbar-profilebox-btn icon-arrow-down ng-scope"
									ng-if="$root.topbarType !== 'checkout'"></span>
									<div class="dropbox topbar-profilebox-dropbox">
										<a class="icon-profile" href="https://www.ele.me/profile"
											hardjump="">个人中心</a> <a class="icon-location"
											href="https://www.ele.me/profile/address" hardjump="">我的地址</a>
										<a class="icon-logout" href="javascript:" ng-click="logout()">退出登录</a>
									</div>
								</span>
							</div>
						</div>
					</nav>
				</div>
			</header>
		</div>
	</div>
	<div class="importantnotification container" role="banner">
		<!-- ngIf: enable -->
	</div>

	<!-- ngView:  -->
	<div ng-view="" role="main" class="ng-scope">
		<div class="profile-container container" profile-container=""
			page-name="order" page-title="近三个月订单">
			<div class="clearfix">
				<div class="location"
					ng-style="{visibility: geohash ? '' : 'hidden'}" role="navigation"
					location="" style="visibility: hidden;">
					<span>当前位置:</span> <span class="location-current"><a
						class="inherit ng-binding" ng-href="/place/" ubt-click="401"
						ng-bind="place.name || place.address"
						href="https://www.ele.me/place/"></a></span> <span
						class="location-change"
						ng-class="{ 'location-hashistory': user.username &amp;&amp; userPlaces &amp;&amp; userPlaces.length &gt; 0 }"><a
						ng-href="/home" ubt-click="400" hardjump=""
						href="https://www.ele.me/home">[切换地址]</a>
						<ul class="dropbox location-dropbox" ubt-visit="398">
							<li class="arrow"></li>
							<!-- ngRepeat: userPlace in userPlaces | filter:filterPlace | limitTo: 4 -->
							<li class="changelocation"><a ng-href="/home" hardjump=""
								href="https://www.ele.me/home">修改收货地址<span
									class="icon-location"></span></a></li>
						</ul></span> <span ng-transclude=""><i
						class="icon-arrow-right ng-scope"></i><span
						class="ng-binding ng-scope"></span></span>
				</div>
				<div search-input=""></div>
			</div>
			<ul class="profile-sidebar" role="navigation" profile-sidebar="">
				<li class="profile-sidebar-section"><h2
						class="profile-sidebar-sectiontitle"
						ng-class="{ active: pageName === 'profile' }">
						<i class="icon-line-home"></i><a href="page/profile.jsp">个人中心</a>
					</h2></li>
				<li class="profile-sidebar-section"><h2
						class="profile-sidebar-sectiontitle">
						<i class="iconfont">&#xe649;</i><a href="page/message_1.jsp">小本经营</a>
					</h2></li>

				<li class="profile-sidebar-section"><h2
						class="profile-sidebar-sectiontitle">
						<i class="iconfont">&#xe649;</i><a href="page/message.jsp">接单通知</a>
					</h2></li>
				<li class="profile-sidebar-section"><h2
						class="profile-sidebar-sectiontitle">
						<i class="icon-line-order"></i>我的订单
					</h2>
					<ul>
						<li ng-class="{ active: pageName === 'order' }" class="active"><a
							href="javascript:void(0)"
							onclick="getOrders(1,${loginUser.uuid})" style="color: #666">订单记录</a></li>
						<li ng-class="{ active: pageName === 'order-unrated' }"><a
							href="javascript:void(0)"
							onclick="getComingOrders(1,${loginUser.uuid})">待收货订单</a> <span
							class="moreinfo ng-binding ng-scope" ng-if="unratedNumber"
							ng-bind="unratedNumber" id="waitComing" >6</span></li>
						<li ng-class="{ active: pageName === 'order-unrated' }"><a
							href="javascript:void(0)"
							onclick="getWaitOrders(1,${loginUser.uuid})">待评价订单</a> <span
							class="moreinfo ng-binding ng-scope" ng-if="unratedNumber"
							ng-bind="unratedNumber" id="waitComment" >6</span></li>
						<li ng-class="{ active: pageName === 'order-refunding' }"><a
							href="javascript:void(0)"
							onclick="getCancleOrders(1,${loginUser.uuid})">退单记录</a></li>
					</ul></li>

				<li class="profile-sidebar-section"><h2
						class="profile-sidebar-sectiontitle">
						<i class="icon-line-profile"></i>我的资料
					</h2>
					<ul>
						<li><a href="page/profile_msg.jsp">个人资料</a></li>
						<li><a href="page/profile_addrmanage.jsp">地址管理</a></li>
						<li><a href="page/modifyPwd.jsp">修改密码</a></li>
					</ul></li>

			</ul>



			<div class="profile-panel" role="main">
				<h3 ng-if="pageTitleVisible" class="profile-paneltitle ng-scope">
					<span ng-bind="pageTitle" class="ng-binding">待评价订单</span> <span
						class="subtitle ng-binding"
						ng-bind-html="pageSubtitle | toTrusted">带(<span
						class="stress">*</span>)标志为必填项
					</span>
				</h3>
				<div class="profile-panelcontent" ng-transclude="">
					<div ng-if="unrated" class="unrated-orderinfo ng-scope">
						<div class="unrated-orderinfo-item">
							<a ng-href="/shop/1361765" href="https://www.ele.me/shop/1361765"><img
								ng-src="//fuss10.elemecdn.com/7/37/3035f05e693d405b214af9941e100jpeg.jpeg?imageMogr2/thumbnail/48x48/format/webp/quality/85"
								alt="至尊煲仔饭(工院店)"
								src="https://fuss10.elemecdn.com/7/37/3035f05e693d405b214af9941e100jpeg.jpeg?imageMogr2/thumbnail/48x48/format/webp/quality/85"></a>
							<div class="rstinfo">
								<h3>
									<a class="color-normal ng-binding" ng-href="/shop/1361765"
										ng-bind="unrated.rstName"
										href="https://www.ele.me/shop/1361765">至尊煲仔饭(工院店)</a>
								</h3>
								<p>
									<span ng-bind="unrated.foodConcat" class="ng-binding">腐竹炒肉+ad钙奶1份</span>共<span
										class="stress ng-binding" ng-bind="unrated.foodQuantity">1</span>个菜品
								</p>
							</div>
						</div>
						<span class="unrated-orderinfo-item ng-binding"
							ng-bind="'下单时间：' + (unrated.created_at | date:'yyyy-MM-dd HH:mm:ss')">下单时间：2017-03-05
							11:38:40</span>
					</div>
					<div ng-if="unrated" class="unrated-rate ng-scope">
						<div class="unrated-ratelist">
							<span class="unrated-ratelist-label"><span>*</span>代递员服务</span>
							<div class="unrated-ratelist-content rate ng-isolate-scope"
								rate="" config="rateServiceConfig" value="rate.service"
								isreadonly="stableRate.service.value">
								<p class="rate-star star level0"
									ng-class="{readonly: isreadonly, star: starStyle}">
									<span ng-click="doRate($event)" ng-mouseover="doRate($event)"
										ng-mouseleave="doRate($event)" data-level="0"><a
										class="icon-star-rate" href="javascript:" data-level="1"
										ng-class="{active : rateLevel >= 1}"></a> <a
										class="icon-star-rate" href="javascript:" data-level="2"
										ng-class="{active : rateLevel >= 2}"></a> <a
										class="icon-star-rate" href="javascript:" data-level="3"
										ng-class="{active : rateLevel >= 3}"></a> <a
										class="icon-star-rate" href="javascript:" data-level="4"
										ng-class="{active : rateLevel >= 4}"></a> <a
										class="icon-star-rate" href="javascript:" data-level="5"
										ng-class="{active : rateLevel >= 5}"></a></span>
									<span ng-if="config.tipText"
										class="active rate-star-text ng-binding ng-scope"
										ng-bind="config.tipText[rateLevel]">点击星星打分</span>
								</p>
								
							</div>
						</div>
						
						<div class="unrated-ratelist offset">
							<button class="btn-primary btn-lg" ng-click="rateSubmit()">提交评价</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer" role="contentinfo">
		<div class="container clearfix">
			<div class="footer-link">
				<h3 class="footer-link-title">用户帮助</h3>
				<a class="footer-link-item" href="https://www.ele.me/support/center"
					target="_blank">服务中心</a> <a class="footer-link-item"
					href="https://www.ele.me/support/question/default" target="_blank">常见问题</a>
				<a class="footer-link-item" online-service="" href="javascript:"
					style="visibility: visible;">在线客服</a>
			</div>
			<div class="footer-link">
				<h3 class="footer-link-title">商务合作</h3>
				<a class="footer-link-item" href="https://kaidian.ele.me/"
					target="_blank">我要开店</a> <a class="footer-link-item"
					href="https://www.ele.me/support/about/jiameng" target="_blank">加盟指南</a>
				<a class="footer-link-item"
					href="https://www.ele.me/support/about/contact" target="_blank">市场合作</a>
				<a class="footer-link-item" href="http://openapi.eleme.io/"
					target="_blank">开放平台</a>
			</div>
			<div class="footer-link">
				<h3 class="footer-link-title">关于我们</h3>
				<a class="footer-link-item" href="https://www.ele.me/support/about"
					target="_blank">饿了么介绍</a> <a class="footer-link-item"
					href="http://jobs.ele.me/" target="_blank">加入我们</a> <a
					class="footer-link-item"
					href="https://www.ele.me/support/about/contact" target="_blank">联系我们</a>
				<a class="footer-link-item"
					href="https://www.ele.me/support/rules/default" target="_blank">规则中心</a>
			</div>
			<div class="footer-contect">
				<div class="footer-contect-item">
					24小时客服热线 : <a class="inherit" href="tel:10105757">10105757</a>
				</div>
				<div class="footer-contect-item">
					意见反馈 : <a class="inherit" href="mailto:feedback@ele.me">feedback@ele.me</a>
				</div>
				<div class="footer-contect-item">
					关注我们 :
					<div href="JavaScript:" class="icon-wechat" ubt-click="402">
						<div class="dropbox dropbox-bottom footer-contect-dropbox"
							ubt-visit="402">
							<img
								src="%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83_%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%E5%88%97%E8%A1%A8%20_%20%E9%A5%BF%E4%BA%86%E4%B9%88%E7%BD%91%E4%B8%8A%E8%AE%A2%E9%A4%90_files/wexinqc1002x.png"
								alt="微信号: elemeorder">
							<p>微信号: elemeorder</p>
							<p>饿了么网上订餐</p>
						</div>
					</div>
					<a href="http://e.weibo.com/elemeorder" class="icon-weibo"
						target="_blank"></a>
				</div>
			</div>
			<div class="footer-mobile">
				<a href="https://h.ele.me/landing" target="_blank"><img
					src="%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83_%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%E5%88%97%E8%A1%A8%20_%20%E9%A5%BF%E4%BA%86%E4%B9%88%E7%BD%91%E4%B8%8A%E8%AE%A2%E9%A4%90_files/appqc.png"
					class="footer-mobile-icon" alt="扫一扫下载饿了么手机 App"></a>
				<div class="footer-mobile-content">
					<h3>下载手机版</h3>
					<p>扫一扫,手机订餐方便</p>
				</div>
			</div>
			<div class="footer-copyright serif">
				<h5 class="owner">所有方：上海拉扎斯信息科技有限公司</h5>
				<p>
					增值电信业务许可证 : <a href="http://www.shca.gov.cn/" target="_blank">沪B2-20150033</a>
					| <a href="http://www.miibeian.gov.cn/" target="_blank">沪ICP备
						09007032</a> | <a
						href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20120305173227823"
						target="_blank">上海工商行政管理</a> Copyright ©2008-2017 ele.me, All
					Rights Reserved.
				</p>
			</div>
			<div class="footer-police container">
				<a href="http://www.zx110.org/picp/?sn=310100103568" rel="nofollow"
					target="_blank"><img alt="已通过沪公网备案，备案号 310100103568"
					src="%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83_%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%E5%88%97%E8%A1%A8%20_%20%E9%A5%BF%E4%BA%86%E4%B9%88%E7%BD%91%E4%B8%8A%E8%AE%A2%E9%A4%90_files/picp_bg.jpg"
					height="30"></a>
			</div>
		</div>

	</footer>

	<script src="js_1/jquery-1.12.4.js" type="text/javascript"></script>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script src="js_1/profile_1.js" type="text/javascript"></script>



	<script
		src="%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83_%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%E5%88%97%E8%A1%A8%20_%20%E9%A5%BF%E4%BA%86%E4%B9%88%E7%BD%91%E4%B8%8A%E8%AE%A2%E9%A4%90_files/textStatic.js"></script>
	<script
		src="%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83_%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%E5%88%97%E8%A1%A8%20_%20%E9%A5%BF%E4%BA%86%E4%B9%88%E7%BD%91%E4%B8%8A%E8%AE%A2%E9%A4%90_files/textStatic.js"></script>
</body>
</html>
