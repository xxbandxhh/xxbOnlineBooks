package com.shop.web;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.shop.utils.MailUtils;

public class SendSMSServlet extends HttpServlet {

	//智能匹配模版发送接口的http地址
	private static String URI_SEND_SMS = "https://sms.yunpian.com/v2/sms/single_send.json";

	//编码格式。发送编码格式统一用UTF-8
	private static String ENCODING = "UTF-8";

	//haohao
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//获取手机号码
			String phone = request.getParameter("phone");
			//获取src下的sms.properties文件
			ResourceBundle rb = ResourceBundle.getBundle("sms");
			//获得第三方短信平台 给与标识
			String apikey = rb.getString("apiKey");
			//对手机号进行编码
			String mobile = URLEncoder.encode(phone,ENCODING);
			//产生随机的验证码
			String smsCode = (""+Math.random()*1000000).substring(0,6);
			//拼接短信信息
			String text = "【传智黑马】您的验证码是"+smsCode;
			//短信发送
			String sendSms = sendSms(apikey, text, mobile);
			//将验证码存到session域中
			request.getSession().setAttribute("smsCode", smsCode);
	}

	/**
	 * 智能匹配模版接口发短信
	 *
	 * @param apikey apikey
	 * @param text   　短信内容
	 * @param mobile 　接受的手机号
	 * @return json格式字符串
	 * @throws IOException
	 */

	public String sendSms(String apikey, String text, String mobile) throws IOException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("apikey", apikey);
		params.put("text", text);
		params.put("mobile", mobile);
		return post(URI_SEND_SMS, params);
	}


	/**
	 * 基于HttpClient 4.3的通用POST方法
	 *
	 * @param url       提交的URL
	 * @param paramsMap 提交<参数，值>Map
	 * @return 提交响应
	 */

	public String post(String url, Map<String, String> paramsMap) {
		CloseableHttpClient client = HttpClients.createDefault();
		String responseText = "";
		CloseableHttpResponse response = null;
		try {
			HttpPost method = new HttpPost(url);
			if (paramsMap != null) {
				List<NameValuePair> paramList = new ArrayList<NameValuePair>();
				for (Map.Entry<String, String> param : paramsMap.entrySet()) {
					NameValuePair pair = new BasicNameValuePair(param.getKey(), param.getValue());
					paramList.add(pair);
				}
				method.setEntity(new UrlEncodedFormEntity(paramList, ENCODING));
			}
			response = client.execute(method);
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				responseText = EntityUtils.toString(entity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				response.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return responseText;
	}


}
