<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>好易购商城订单</title>
<link href="css/index.css" type="text/css" rel="stylesheet"/>
<link href="css/public.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="css/base.css"/>
<script type="text/javascript" src="js/jquery_cart.js"></script>
<link rel="stylesheet" type="text/css" href="css/buyConfirm.css" />
<script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="js/unslider.min.js" type="text/javascript"></script>
<script src="js/index.js" type="text/javascript"></script>
<script type="text/javascript">

window.onload = function(){
new tab('test4-input-input_tab1-input_tab2', '-');
}
function tab(o, s, cb, ev){ //tab换类
var $ = function(o){return document.getElementById(o)};
var css = o.split((s||'_'));
if(css.length!=4)return;
this.event = ev || 'onclick';
o = $(o);
if(o){
this.ITEM = [];
o.id = css[0];
var item = o.getElementsByTagName(css[1]);
var j=1;
for(var i=0;i<item.length;i++){
if(item[i].className.indexOf(css[2])>=0 || item[i].className.indexOf(css[3])>=0){
if(item[i].className == css[2])o['cur'] = item[i];
item[i].callBack = cb||function(){};
item[i]['css'] = css;
item[i]['link'] = o;
this.ITEM[j] = item[i];
item[i]['Index'] = j++;
item[i][this.event] = this.ACTIVE;
}
}
return o;
}
}
tab.prototype = {
ACTIVE:function(){
var $ = function(o){return document.getElementById(o)};
this['link']['cur'].className = this['css'][3];
this.className = this['css'][2];
try{
$(this['link']['id']+'_'+this['link']['cur']['Index']).style.display = 'none';
$(this['link']['id']+'_'+this['Index']).style.display = 'block';
}catch(e){}
this.callBack.call(this);
this['link']['cur'] = this;
}
}
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

	


 
 <!--订单提交body部分开始-->  


<div class="border_top_cart">

        <div class="container payment-con">
    <form  target="_blank" action="${pageContext.request.contextPath }/payServlet" id="pay-form" method="post">
            <div class="order-info">
                <div class="msg">
                    <h3>您的订单已提交成功！付款咯～</h3>
                    <p></p>
                    
                                                                    <p class="post-date">成功付款后，7天发货</p>
                                    </div>
                <div class="info">
                    <p>
                        金额：<span class="pay-total">49.00元</span>
                    </p>
                    <p>
                        订单：1150505740045173                    </p>
                    <p>
                        配送：潘骏杰                                    <span class="line">/</span>
                                    159****6437                                    <span class="line">/</span>
                                    江苏,无锡市,北塘区 民丰西苑82号202室                                                                <span class="line">/</span>
                                                                    不限送货时间                                    <span class="line">/</span>
                                    个人电子发票                                                    </p>
                </div>
                <div class="icon-box">
                    <i class="iconfont"><img src="images/yes_ok.png"></i>
                </div>
            </div>
            
            <div class="xm-plain-box">
                                                <!-- 选择支付方式 -->
                <div class="box-hd bank-title clearfix">
                    <div id="titleWrap" class="title-wrap">
                        <h2 class="title">选择支付方式</h2>
                        <h2 class="title hide " >你还需要继续支付 <em>49.00</em> 元</h2>
                        <span class="tip-tag"></span>
                    </div>
                </div>
                <div class="box-bd" id="bankList">
                    <div class="payment-bd">
                    <form name="ck">
                    <dl class="clearfix payment-box" >
                    <dt>
                                <strong>支付平台</strong>
                                <p>手机等大额支付推荐使用支付宝快捷支付</p>
                            </dt>
                            <dd>
                        <fieldset id="test4-input-input_tab1-input_tab2" style=" border:none;">
                        <ul class="payment-list clearfix" >
                           <li> <input class="input_tab1" name="myradio" id="r1" type="radio" checked="checked"/><label for="r1" ><img src="images/weixin.jpg" alt=""/></label></label></li>
                            <li><input class="input_tab2" name="myradio" id="r2" type="radio" /><label for="r2" ><img src="images/zfb.png" alt=""/></label></li>
                            <li> <input class="input_tab2" name="myradio" id="r2" type="radio" /><label for="r2" ><img src="images/yck.png" alt=""/></label></li>
                           <li>  <input class="input_tab2" name="myradio" id="r2" type="radio" /><label for="r2" ><img src="images/zxzf.png" alt=""/></label></li>
                             </ul>
                        <div >
                        <div id="test4_1">
                        	<ul class="payment-list clearfix"  style="background-color:#f3f3f3;   ">
                                <!-- 微信二维码 -->  
                               	<li>
                               		 <img src="images/myweixin.jpg"/>
                               	</li>
                            </ul>
                        </div>
                        <div  id="test4_2" style="display:none;">
                        	
                        </div>
                        <div  id="test4_3" style="display:none;">
                        	
                        </div>
                        <div  id="test4_4" style="display:none;">
                        	
                        	
                        	<!-- 银行卡图标 -->
                        	<dl class="clearfix payment-box" >
                            <dt>
                                <strong>银行网银</strong>
                                <p>支持以下各银行借记卡及信用卡</p>
                                
                            </dt>
                            <dd>
                               <ul class="payment-list clearfix">
                                    <li style="width:300px">
                                    	<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />工商银行
                                    	<img src="./bank_img/icbc.bmp" align="middle" />
                                    </li>
                                    <li style="width:300px">
                                    	<input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行 
										<img src="./bank_img/bc.bmp" align="middle" />
                                    </li>
                                    <li style="width:300px">
                                    	<input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行 
										<img src="./bank_img/abc.bmp" align="middle" />
                                    </li>
                                    <li style="width:300px">
                                    	<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行 
										<img src="./bank_img/bcc.bmp" align="middle" />
                                    </li>
                                    <li style="width:300px">
                                    	<input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
										<img src="./bank_img/pingan.bmp" align="middle" />
                                    </li>
                                    <li style="width:300px">
                                    	<input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行 
										<img src="./bank_img/ccb.bmp" align="middle" />
                                    </li>
                                    <li style="width:300px">
                                    	<input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行 
										<img src="./bank_img/guangda.bmp" align="middle" />
                                    </li>
                                    <li style="width:300px">
                                    	<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
										<img src="./bank_img/cmb.bmp" align="middle" />
                                    </li>
                                    
                                    
                               </ul>
                            </dd>
                        </dl>
                        	
                        	
                        </div>

                       

                        </div>
                        </fieldset>
                        </dd>
                        </dl>
                        </form>

                                                
                    </div>
                            </div>
            <div class="box-ft clearfix">
                    <input type="submit" class="btn btn-primary" value="下一步" id="payBtn">
                    <a href="#" class="btn btn-lineDakeLight">修改订单</a>
                    <span class="tip"></span>
                </div>
            </div>
</form>  
</div>
<!-- 支付弹框 -->
<!-- <div class="modal hide to-pay-tip" id="toPayTip">
    <div class="modal-header">
        <span class="close" id="toPayTipClose">
            <i class="iconfont">&#xe617;</i>
        </span>
        <h3>正在支付...</h3>
    </div>
    <div class="modal-body">
        <div class="pay-tip clearfix">
            <div class="fail">
                <h4>如果支付失败...</h4>
                <p>额度问题，推荐<a href="#" id="alipayTrigger">支付宝快捷支付 &gt;</a></p>
                <p>其他问题，查看<a href="#">支付常见问题 &gt;</a></p>
            </div>
            <div class="success">
                <h4>支付成功了</h4>
                <p>立即查看<a href="#" target="_blank">订单详情 &gt;</a></p>
            </div>
        </div>
    </div>
</div> -->
<!-- 余额支付弹框 -->
<!-- <div class="modal hide  balance-pay" id="balancePay">
    <div class="modal-body">
        <h3>账户余额支付：<span class="num"><em id="useCashAccountPayLeft">0.00</em>元</span></h3>
        <p id="checkCodeTip">短信验证码已下发至您的手机<span class="num"></span></p>
        <input type="text" name="verifycode" id="verifycode" class="input" placeholder="请输入验证码"> <span class="send-again" id="sendAgain">重新发送<em></em></span>
        <p><input type="button" value="确认支付" class="btn btn-primary" id="toPay">
        <div class="select-other">
            <p><span id="bankName"></span> <span class="num">49.00元</span></p>
            
        </div>
        <a href="javascript:;" id="chooseOther">选择其他方式支付&gt;</a>
    </div>
    
</div> -->



    <script src="js/base.min.js"></script>

        <!-- <script type="text/javascript" src="js/buyConfirm.js"></script> -->
   
</div>

 
 <!--订单提交body部分结束-->
    
    
       
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
    
    
    <!-- 底部 -->

</body>
</html>
