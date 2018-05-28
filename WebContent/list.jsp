<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<meta name="keywords" content="首页" />
<meta name="description" content="首页" />
 <link rel="stylesheet" type="text/css" href="css/index.css"/>
 <link rel="stylesheet" type="text/css" href="css/normalize.css"/>
 <link rel="stylesheet" type="text/css" href="css/shaixuan.css">
 <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
 <script src="js/common.js" type="text/javascript" charset="utf-8"></script>
   <script type="text/javascript">
  $(document).ready(function(){
	  var showproduct = {
		  "boxid":"showbox",
		  "sumid":"showsum",
		  "boxw":400,//宽度,该版本中请把宽高填写成一样
		  "boxh":400,//高度,该版本中请把宽高填写成一样
		  "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
		  "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
		  "sumi":7,//列表间隔
		  "sums":5,//列表显示个数
		  "sumsel":"sel",
		  "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
		  "lastid":"showlast",
		  "nextid":"shownext"
		  };//参数定义	  
	 $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
  });
</script>

<style type="text/css">
.demo{margin:0px auto 10px auto;}

.m-sidebar{position: fixed;top: 0;right: 0;background: #000;z-index: 2000;width: 35px;height: 100%;font-size: 12px;color: #fff;}
.cart{color: #fff;text-align:center;line-height: 20px;padding: 200px 0 0 0px;}
.cart span{display:block;width:20px;margin:0 auto;}
.cart i{width:35px;height:35px;display:block; background: url(img/bg_right.png) no-repeat -28px -20px;}
#msg{position:fixed; top:245px; right:35px; z-index:10000; width:1px; height:44px; line-height:44px; font-size:16px; text-align:center; color:#fff; background:#FFAA00; display:none}

.box{float:left; width:24%;display:inline;border:1px solid #fff;margin-bottom:10px; text-align:center;padding:0 0 30px 0;}
.box .info{height:300px;overflow:hidden;}
.box p{line-height:20px; padding:4px 10px 10px 10px; text-align:left;font-size:13px;}
.box:hover{border:1px solid #ebebeb;}
.box h4{line-height:32px; font-size:14px; color:#f30;font-weight:500}
.box h4 span{font-size:20px}
.u-flyer{display: block;width: 50px;height: 50px;border-radius: 50px;position: fixed;z-index: 9999;}

.button {
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 16px/100% 'Microsoft yahei',Arial, Helvetica, sans-serif;
	padding: .3em 0.6em .30em;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	-webkit-border-radius: .5em; 
	-moz-border-radius: .5em;
	border-radius: .5em;
	/* -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	box-shadow: 0 1px 2px rgba(0,0,0,.2); */
}
.button:hover {
	text-decoration: none;
}
.button:active {
	position: relative;
	top: 1px;
}
/* orange */
.orange {
	color: #fef4e9;
	border: solid 1px #da7c0c;
	background: #f78d1d;
	background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
	background: -moz-linear-gradient(top,  #faa51a,  #f47a20);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#faa51a', endColorstr='#f47a20');
}
.orange:hover {
	background: #f47c20;
	background: -webkit-gradient(linear, left top, left bottom, from(#f88e11), to(#f06015));
	background: -moz-linear-gradient(top,  #f88e11,  #f06015);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
}
.orange:active {
	color: #fcd3a5;
	background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
	background: -moz-linear-gradient(top,  #f47a20,  #faa51a);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
}
</style>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.fly.min.js"></script>
<!--[if lte IE 9]>
<script src="js/requestAnimationFrame.js"></script>
<![endif]-->

<script>
$(function() {
	var offset = $("#end").offset();
	$(".addcar").click(function(event){
		var addcar = $(this);
		var img = addcar.parent().find('img').attr('src');
		var flyer = $('<img class="u-flyer" src="'+img+'">');
		/* alert(event.pageX);
		alert(event.pageY); */
		flyer.fly({
			start: {
				left: event.clientX,
				top: event.clientY
			},
			end: {
				left: offset.left+10,
				top: offset.top+10,
				width: 0,
				height: 0
			},
			onEnd: function(){
				$("#msg").show().animate({width: '250px'}, 500).fadeOut(2000);
				addcar.css("cursor","default").removeClass('orange').unbind('click');
				this.destory();
			}
		});
	});
  
});
</script>

</head>
<body>

	<!-- 头部分开始 -->
 		<!--搜索-->
		<div id="search" style="margin:15px auto">
			<a href="####" class="logo"></a>
			<a href="####" class="logogif">
				<img src="img/logo.gif" alt="" />
			</a>
			<div class="main_search">
				<div class="ng_search">
					<i class="ng-iconfont search-icon">&#xe619;</i>
					<form action="">
						<div class="search-keyword-box">
							<input value="iPhone6s最大的不同就是处处相同" id="searchKeywords" type="text" class="search-keyword" />
						</div>
						<input id="searchSubmit" type="submit" class="search-btn" value="搜索" />
						<div class="hotwords">
							<a href="####">PPTV互联网电视</a>
							<a href="####">三星note5</a>
							<a href="####">奶粉</a>
							<a href="####">烤箱</a>
							<a href="####">智能电视</a>
							<a href="####">面膜</a>
							<a href="####">奥克斯空调</a>
							<a href="####">大闸蟹</a>
							<a href="####" style="color: #FF6600;">香港莎莎</a>
							<a href="####">佳能70d</a>
						</div>
					</form>
				</div>
			</div>
			<div class="erweima">
				<a href="####" title="移动端">
					<img src="img/erweima.jpg" alt="移动端" />
				</a>
			</div>
		</div>
		<!--搜索结束-->
 		<!-- 头部分结束 -->

		<!-- 灰色导航条 -->
		<div style="width:100%;height:40px;background: #f3f3f3">
			
		</div>

 	          
  
  <!-- 筛选部分 -->
  
  <div style="margin-top:5px">
  
  	<ul class="select">
		<li class="select-list">
			<dl id="select1">
				<dt>上装：</dt>
				<dd class="select-all selected"><a href="#">全部</a></dd>
				<dd><a href="#">针织衫</a></dd>
				<dd><a href="#">毛呢外套</a></dd>
				<dd><a href="#">T恤</a></dd>
				<dd><a href="#">羽绒服</a></dd>
				<dd><a href="#">棉衣</a></dd>
				<dd><a href="#">卫衣</a></dd>
				<dd><a href="#">风衣</a></dd>
			</dl>
		</li>
		<li class="select-list">
			<dl id="select2">
				<dt>裤装：</dt>
				<dd class="select-all selected"><a href="#">全部</a></dd>
				<dd><a href="#">牛仔裤</a></dd>
				<dd><a href="#">小脚/铅笔裤</a></dd>
				<dd><a href="#">休闲裤</a></dd>
				<dd><a href="#">打底裤</a></dd>
				<dd><a href="#">哈伦裤</a></dd>
			</dl>
		</li>
		<li class="select-list">
			<dl id="select3">
				<dt>裙装：</dt>
				<dd class="select-all selected"><a href="#">全部</a></dd>
				<dd><a href="#">连衣裙</a></dd>
				<dd><a href="#">半身裙</a></dd>
				<dd><a href="#">长袖连衣裙</a></dd>
				<dd><a href="#">中长款连衣裙</a></dd>
			</dl>
		</li>
		<li class="select-result">
			<dl>
				<dt>已选条件：</dt>
				<dd class="select-no">暂时没有选择过滤条件</dd>
			</dl>
		</li>
	</ul>
  
  </div>
  
  
  
  
  <!-- 筛选部分 -->
  
  
  
                
<!-- 商品介紹 -->                
                <div class="gdetail" style="margin-top:3px">
                	<!-- left -->
                	<div class="aside">
                		  <h3>看了还看<span><img src="images/fod.png"width="22" height="22"/>换一批</span></h3>
                		  
                		  <!-- 历史记录 -->
                		  
                		  <c:forEach items="${historyMap }" var="entry">
                		  
	                		  <dl class="ac-mod-list">
	                		  	<dt><a href="${pageContext.request.contextPath }/infoServlet?pid=${entry.key}"><img src="${pageContext.request.contextPath }/${entry.value.pimage}"/></a></dt>
	                		  	<dd>
	                		  		  ${entry.value.pname}
	                		  		  <span>￥${entry.value.shop_price}</span>
	                		  	</dd>
	                		  </dl>
                		  
                		  </c:forEach>
                		  
                	</div>




					<!-- 商品列表 -->
                	<div class="detail" style="border:1px solid #ebebeb;width:972px;padding:15px">
                		
						<div id="content" class="active_list"> 
							
							
							<!-- 列表 带加入购物车 -->
							
							<div id="main">
								<div class="demo">
								
									<c:forEach items="${productList }" var="product">
								
										<div class="box">
											<a href="${pageContext.request.contextPath }/infoServlet?pid=${product.pid}">
												<div class="info">
													<img src="${pageContext.request.contextPath }/${product.pimage}" width="180" height="180">
													<h4>￥<span>${product.shop_price}</span></h4>
													<p>${product.pname}</p>
												</div>
											</a>
											<a href="javascript:void(0);" class="button orange">收藏商品</a>
											<a href="javascript:void(0);" class="button orange addcar">加入购物车</a>
										</div>
									
									</c:forEach>
									
								</div>
								
								
							
								<div class="m-sidebar">
									<div class="cart">
										<i id="end"></i>
										<span>购物车</span>
									</div>
								</div>
								
								<div id="msg">已成功加入购物车！</div>
								
							</div>
							
							<!-- 列表 带加入购物车 -->
							
							
						</div>
												
                	</div>
                </div>
                
               
     	<div style="clear: both;"></div>
          
    	<!-- 底部 -->
    
    
		<!--正品保障帮助中心-->
		<div id="layout_foot">
			<div id="serv">

				<div class="ng-ser-box-con">
					<div class="ng-promise">
						<dl>
							<dt class="zheng">正品保障</dt>
							<dd>
								<p><strong><a href="####"  >正品保障</a></strong></p>
								<p>正品保障，提供发票</p>
							</dd>
						</dl>
						<dl>
							<dt class="jisu">急速物流</dt>
							<dd>
								<p><strong><a href="####"  >急速物流</a></strong></p>
								<p>急速物流，急速送达</p>
							</dd>
						</dl>
						<dl>
							<dt class="wuyou">无忧售后</dt>
							<dd>
								<p><strong><a href="####" >无忧售后</a></strong></p>
								<p>7天无理由退换货</p>
							</dd>
						</dl>
						<dl>
							<dt class="te">特色服务</dt>
							<dd>
								<p><strong><a href="####"  >特色服务</a></strong></p>
								<p>私人定制家电套餐</p>
							</dd>
						</dl>
						<dl>
							<dt class="help">帮助中心</dt>
							<dd>
								<p><strong><a href="####"  >帮助中心</a></strong></p>
								<p>您的购物指南</p>
							</dd>
						</dl>
						<div class="clear"></div>
					</div>
					<div class="ng-help-box">
						<dl>
							<dt>购物指南</dt>
							<dd><a href="####">导购演示</a></dd>
							<dd><a href="####">免费注册</a></dd>
							<dd><a href="####">会员等级</a></dd>
							<dd><a href="####">常见问题</a></dd>
							<dd><a href="####">品牌大全</a></dd>
						</dl>
						<dl>
							<dt>支付方式</dt>
							<dd><a href="####">易付宝支付</a></dd>
							<dd><a href="####">网银支付</a></dd>
							<dd><a href="####">快捷支付</a></dd>
							<dd><a href="####">分期付款</a></dd>
							<dd><a href="####">货到付款</a></dd>
							<dd><a href="####">任性付支付</a></dd>
						</dl>
						<dl>
							<dt>物流配送</dt>
							<dd><a href="####">免运费政策</a></dd>
							<dd><a href="####">配送服务承诺</a></dd>
							<dd><a href="####">签收验货</a></dd>
							<dd><a href="####">物流查询</a></dd>
						</dl>
						<dl>
							<dt>售后服务</dt>
							<dd><a href="####">退换货政策</a></dd>
							<dd><a href="####">退换货流程</a></dd>
							<dd><a href="####">购买延保服务</a></dd>
							<dd><a href="####">退款说明</a></dd>
							<dd><a href="####">退换货申请</a></dd>
							<dd><a href="####">维修/保养</a></dd>
						</dl>
						<dl>
							<dt>商家服务</dt>
							<dd><a href="####">商家入驻</a></dd>
							<dd><a href="####">培训中心</a></dd>
							<dd><a href="####">信息公告</a></dd>
							<dd><a href="####">广告服务</a></dd>
							<dd><a href="####">商家帮助</a></dd>
							<dd><a href="####">服务市场</a></dd>
						</dl>
					</div>
					<div class="ng-app-down">
						<p>易购客户端</p>
						<a href="####">
							<img src="img/bottom-app-down.png" alt="" height="87" width="87" />
						</a>
					</div>
					<div class="clear"></div>
				</div>

			</div>
			<div id="layout_partner" style="margin-top:0px">
				<div id="partner">
					<div class="ng-new-pro-con">
						<div class="ng-new-pro-list">
							<dl>
								<dt>
                                    <a href="####"><img src="img/foot1.png" height="80" width="80" /></a>
                                </dt>
								<dd>
									<p class="ng-title"><a href="####">政企采购</a></p>
									<p class="ng-intro"><a href="####">为企业用户量身定做的采购平台，优选办宁易购全站商品，为企业采购提供专业化的一站式采购解决方案。</a></p>
								</dd>
							</dl>
							<dl>
								<dt>
								    <a href="####" ><img src="img/foot2.png" height="80" width="80" /></a>
								</dt>
								<dd>
									<p class="ng-title"><a href="####">办宁众包</a></p>
									<p class="ng-intro"><a href="####">以办宁全渠道包销为主要特点，整合全社会众包资源，扶持创新企业，推广创新产品。</a></p>
								</dd>
							</dl>
						</div>
						<div class="ng-serch-suning">
							<dl>
								<dt></dt>
								<dd>
									<p class="ng-title">身边办宁</p>
									<p class="ng-intro">全国300个城市1600家门店3000个服务点为您提供最贴心的服务！</p>
									<a href="####" class="srh-btn"></a>
								</dd>
							</dl>
						</div>
						<div class="footer-egg-con"></div>
					</div>
				</div>
				<div class="foot_list">
					<p class="ng-url-list">
						<a href="" target="_blank">办宁云商</a><span>|</span>
						<a href="" target="_blank">办宁互联</a><span>|</span>
						<a href="" target="_blank">办宁金融</a><span>|</span>
						<a href="" target="_blank">易付宝</a><span>|</span>
						<a href="" target="_blank">办宁满座网</a><span>|</span>
						<a href="" target="_blank">PPTV</a><span>|</span>
						<a href="" target="_blank">红孩子</a><span>|</span>
						<a href="" target="_blank">缤购</a><span>|</span>
						<a href="" target="_blank">乐购仕</a><span>|</span>
						<a href="" target="_blank">办宁物流</a><span>|</span>
						<a href="" target="_blank">办宁美国</a><span>|</span>
						<a href="" target="_blank">办宁香港</a>
					</p>
					<p class="ng-url-list">
						<a href="" target="_blank">关于办宁易购</a><span>|</span>
						<a href="" target="_blank">联系我们</a><span>|</span>
						<a href="" target="_blank">诚聘英才</a><span>|</span>
						<a href="" target="_blank">供应商入驻</a><span>|</span>
						<a href="" target="_blank">办宁联盟</a><span>|</span>
						<a href="" target="_blank">办宁招标</a><span>|</span>
						<a href="" target="_blank">友情链接</a><span>|</span>
						<a href="" target="_blank">法律申明</a><span>|</span>
						<a href="" target="_blank">用户体验提升计划</a><span>|</span>
						<a href="" target="_blank">股东会员认证</a>
					</p>
					<p class="ng-copyright">Copyright(c) 2002-2015 ，电子商务有限公司版权所有 885551号</p>
				</div>
			</div>

		</div>
		<!--正品保障帮助中心-->
    
    
    <!-- 底部 -->
     
       
                
                
</body>
</html>
