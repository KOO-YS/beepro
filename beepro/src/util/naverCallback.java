package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


@WebServlet("/naverCallback")
public class naverCallback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public naverCallback() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		response.getWriter().append("Served at: ").append(request.getContextPath());
			String clientId = "6_0y_JSbbHBEJdCySL56";
			String clientSecret = "Iqb_iGKhYd";
			String code = request.getParameter("code");
			String state = request.getParameter("state");
			String redirectURI; 
			System.out.println("code:"+code);
			try {
				redirectURI = URLEncoder.encode("http://192.168.130.217:8787/beepro/matching/index.jsp","UTF-8");
				String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
				apiURL += "client_id=" + clientId;
				apiURL += "&client_secret=" + clientSecret;
				apiURL += "&redirect_uri=" + redirectURI;
				apiURL += "&code=" + code;
				apiURL+= "&state=" + state;
				System.out.println(apiURL);
				String access_token = "";
				String refresh_token = ""; //나중에 이용합시다
						
				try { 
					  System.out.println("try 입장");
					  URL url = new URL(apiURL);
				      HttpURLConnection con = (HttpURLConnection)url.openConnection();
				      con.setRequestMethod("GET");
				      int responseCode = con.getResponseCode();
				      BufferedReader br;
				      System.out.print("responseCode="+responseCode);
				      
				      if(responseCode==200) { // 정상 호출
				        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				        System.out.println("네이버 정상 호출 완료 200");
				      } else {  // 에러 발생
				        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				        System.out.println("naver error");
				      }
				      String inputLine;
				      StringBuffer res = new StringBuffer();
				      while ((inputLine = br.readLine()) != null) {
				        res.append(inputLine);
				      }
				      
				      br.close();
				      
				      if(responseCode==200) {
				    	  	System.out.println("res.toString()"+ res.toString());
				    		JSONParser parsing = new JSONParser();
				    		Object obj = parsing.parse(res.toString());
				    		JSONObject jsonObj = (JSONObject)obj;
				    			        
				    		access_token = (String)jsonObj.get("access_token");
				    		refresh_token = (String)jsonObj.get("refresh_token");
				      }
						if(access_token != null) { // access_token을 잘 받아왔다면
							try {
								String token = access_token;
								System.out.println("어쎄스 토큰 ");
								 String header = "Bearer " + token; 
								String apiurl = "https://openapi.naver.com/v1/nid/me";
								url = new URL(apiurl);
								con = (HttpURLConnection)url.openConnection();
								con.setRequestMethod("GET");
								con.setRequestProperty("Authorization", header);
								responseCode = con.getResponseCode();
								//BufferedReader br;
								if(responseCode==200) { // 정상 호출
								 br = new BufferedReader(new InputStreamReader(con.getInputStream()));
								} else {  // 에러 발생
								br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
								}
						/*
						 * String inputLine; StringBuffer
						 */     res = new StringBuffer();
								 while ((inputLine = br.readLine()) != null) {
								res.append(inputLine);
								}
								br.close();
								
								//왼쪽 변수 이름은 원하는 대로 정하면 된다. 
								//단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
								JSONParser parsing = new JSONParser();
								Object obj = parsing.parse(res.toString());
								JSONObject jsonObj = (JSONObject)obj;
								JSONObject resObj = (JSONObject)jsonObj.get("response");
								System.out.println("[resObj]"+resObj);
								String u_id = (String)resObj.get("id");
								String u_email = (String)resObj.get("email");
								String u_name = (String)resObj.get("name");
								
								System.out.println("네이버 이메일은 :"+u_email+"\nname : "+u_name);
								
								HttpSession session = request.getSession();
								session.setAttribute("u_id", u_id);
								session.setAttribute("u_email", u_email);
								session.setAttribute("u_name", u_name);
								
								RequestDispatcher Dispatch = request.getRequestDispatcher("user?command=naverLogin");
								Dispatch.forward(request, response);

								
						    } catch (Exception e) {
						    	e.printStackTrace();
						    }
						}
						
				    } catch (Exception e) {
				      System.out.println(e);
				      e.printStackTrace();
				    }
				
			} catch (UnsupportedEncodingException e1) {
				System.out.println("URLEncoder.encode 오류");
				e1.printStackTrace();
			}
					
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		doGet(request, response);
		
	}

}