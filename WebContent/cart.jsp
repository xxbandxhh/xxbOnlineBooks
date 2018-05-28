<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>购物车页面</title>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<link href="css/myCart.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.min.js"></script>

<style type="text/css">
.addcart {
    background: #fd532d;
    padding: 0px 50px;
    border-radius: 4px;
    color: #FFFFFF;
    margin-right: 10px;
    font-size: 16px;
    line-height: 50px;
    outline: none;
	border: none;
}
</style>

<!-- <script type="text/javascript" src="js/myCart.js"></script> -->
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






<div id="content">
 <form method="post" name="myform">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
  <tr>
    <td class="title title_1"><input id="allCheckBox" type="checkbox" value="" onclick="selectAll()" />全选</td>
    <td class="title title_2" colspan="2">店铺宝贝</td>
    <td class="title title_3">获积分</td>
    <td class="title title_4">单价（元）</td>
    <td class="title title_5">数量</td>
    <td class="title title_6">小计（元）</td>
    <td class="title title_7">操作</td>
  </tr>
  <tr>
  	<td style="height:5px"></td>
  </tr>
  <tr>
    <td colspan="8" class="line"></td>
  </tr>
  
  
  <tr>
    <td colspan="8" class="shopInfo">店铺：<a href="#">好商城官方配送</a> </td>
  </tr>
  
  <c:forEach items="${cart }" var="entry" varStatus="vs">
  
	   <tr id="product1" style="height:150px">
	    <td class="cart_td_1" width="5%"><input name="cartCheckBox" type="checkbox" value="product1" onclick="selectSingle()" /></td>
	    <td class="cart_td_2" width="18%"><img src="${pageContext.request.contextPath }/${entry.key.pimage}" alt="shopping"/></td>
	    <td class="cart_td_3" width="33%"><a href="#">${entry.key.pname}</a><br />
		        颜色：棕色 尺码：37<br />
		        保障：<img src="images/taobao_icon_01.jpg" alt="icon" /></td>
	    <td class="cart_td_4" width="5%">5</td>
	    <td class="cart_td_5" width="10%">${entry.key.shop_price}</td>
	    <td class="cart_td_6" width="10%">
	    	<img src="images/taobao_minus.jpg" alt="minus" onclick="changeNum('num_${vs.count}','minus','${entry.key.pid}')" class="hand"/>
	    	<input id="num_${vs.count }" type="text"  value="${entry.value }" class="num_input" readonly="readonly"/>
	    	<img src="images/taobao_adding.jpg" alt="add" onclick="changeNum('num_${vs.count}','add','${entry.key.pid}')"  class="hand"/>
	    </td>
	    <td class="cart_td_7" width="10"></td>
	    <td class="cart_td_8" width="10"><a href="javascript:deleteRow('product1');">删除</a></td>
	  </tr>
  
  </c:forEach>
  
  
  
   <tr>
   <td  colspan="3"><a href="javascript:void(0);"><img src="images/taobao_del.jpg" alt="delete"/></a></td>
    <td colspan="5" class="shopend">商品总价（不含运费）：
    	<label id="total" class="yellow"></label> 元<br />
    	可获积分 <label class="yellow" id="integral"></label> 点<br />
	    <button type="button" class="addcart yh" onclick="gotoAddress()" style="margin-top:20px;margin-top:20px">
	    	<img src="images/ht.png" width="25" height="25"/>提交订单
	    </button>
	</td>
  </tr>
</table>
  </form>

</div>

<script type="text/javascript">
//提交订单
function gotoAddress(){
	location.href="${pageContext.request.contextPath}/addr.jsp";
}

//购物车计算
function changeNum(numId,flag,pid){
	var numId=document.getElementById(numId);
	if(flag=="minus"){
		if(numId.value<=1){
			alert("商品不能小于一件");
			return false;
		}
		else{
			//发送ajax减少购物车中的商品数量
			$.post(
				"${pageContext.request.contextPath}/changeCartServlet",
				{"pid":pid,"flag":flag},
				function(data){
					if(data=="true"){
						numId.value=parseInt(numId.value)-1;
						productCount();
					}
				},
				"text"
			);
		}
	}else{
		//发送ajax添加购物车中的商品数量
		$.post(
			"${pageContext.request.contextPath}/changeCartServlet",
			{"pid":pid,"flag":flag},
			function(data){
				if(data=="true"){
					numId.value=parseInt(numId.value)+1;
					productCount();
				}
			},
			"text"
		);
	}
}

function productCount(){
	var total=0;      
	var integral=0;   

	var point;      
	var price;     
	var number;    
	var subtotal;  

	var myTableTr=document.getElementById("shopping").getElementsByTagName("tr"); 
	if(myTableTr.length>0){
		for(var i=1;i<myTableTr.length;i++){
			if(myTableTr[i].getElementsByTagName("td").length>2){
				point=myTableTr[i].getElementsByTagName("td")[3].innerHTML; 
				price=myTableTr[i].getElementsByTagName("td")[4].innerHTML;
				number=myTableTr[i].getElementsByTagName("td")[5].getElementsByTagName("input")[0].value;
				integral+=point*number;
				total+=price*number;
				myTableTr[i].getElementsByTagName("td")[6].innerHTML=price*number;
			}
		}
		document.getElementById("total").innerHTML=total;
		document.getElementById("integral").innerHTML=integral;

	}
}
window.onload=productCount;


function selectAll(){
	var oInput=document.getElementsByName("cartCheckBox");
	for (var i=0;i<oInput.length;i++){
		oInput[i].checked=document.getElementById("allCheckBox").checked;
	}
}


function selectSingle(){
	var k=0;
	var oInput=document.getElementsByName("cartCheckBox");
	for (var i=0;i<oInput.length;i++){
		if(oInput[i].checked==false){
			k=1;
			break;
		}
	}
	if(k==0){
		document.getElementById("allCheckBox").checked=true;
	}
	else{
		document.getElementById("allCheckBox").checked=false;
	}
}


function deleteRow(rowId){
	var Index=document.getElementById(rowId).rowIndex; //��ȡ��ǰ�е������
	document.getElementById("shopping").deleteRow(Index);
	document.getElementById("shopping").deleteRow(Index-1);
	productCount();
}


function deleteSelectRow(){
	var oInput=document.getElementsByName("cartCheckBox");
	var Index;
	for (var i=oInput.length-1;i>=0;i--){
		if(oInput[i].checked==true){
			Index=document.getElementById(oInput[i].value).rowIndex;
			document.getElementById("shopping").deleteRow(Index);
			document.getElementById("shopping").deleteRow(Index-1);
		}
	}
	productCount();
}



</script>


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
			<div id="layout_partner">
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





</body>
</html>
