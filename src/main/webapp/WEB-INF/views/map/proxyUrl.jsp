<%@page trimDirectiveWhitespaces="true" %>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="java.net.*,java.io.*,java.lang.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="org.springframework.util.StringUtils"%>
<%! 
	private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger("proxyUrl.jsp");
	
	public int copyStream(InputStream in, OutputStream out) throws Exception
	{
		int length;
		byte[] buff = new byte[1024];
	
		while ((length = in.read(buff)) != -1)
		{
			out.write(buff, 0, length);
		}
		out.flush();
		return length;
	}
%>

<%
	String method = request.getMethod();
	String queryString = request.getQueryString();

	if(StringUtils.isEmpty(queryString))
	{
		throw new Exception("no parameters.");
	}
	
	//String url = makeCallUrl(request);
	String url = request.getParameter("url");
	int questionIndex = url.indexOf("?");
	if(questionIndex >= 0) {
		url = url.substring(0, questionIndex);
		url = url + queryString.replaceAll("url=" + url, "");
	} else {
		url = url + "?" + queryString.replaceAll("url=" + url, "");
	}
	
	URL resolved = new URL(url);
	// HTTP Connection 구하기
	HttpURLConnection connection = (HttpURLConnection)resolved.openConnection();
	connection.setRequestMethod("GET"); 
	
	//referer 추가 by freewoo
	String referer = request.getHeader("Referer");
	if(referer != null) {
	// 요청 referer 설정
	connection.setRequestProperty("Referer", referer);
	}
	
	if(method.equals("POST"))
	{
		// 연결된 connection 에서 출력도 하도록 설정
		connection.setDoOutput(true);
		// 요청 방식 설정 ( GET or POST or .. 별도로 설정하지않으면 GET 방식 )
		connection.setRequestMethod(method); 
		// 응답 콘텐츠 유형
		connection.setRequestProperty("Content-type", request.getContentType());
		
		Enumeration params = request.getParameterNames();
		String data = "";
		while (params.hasMoreElements()){
			String name = (String)params.nextElement();
			if(!"url".equals(name)){
				//logger.info(name + " : " +request.getParameter(name));
				data +=URLEncoder.encode(name, "UTF-8") + "=" + URLEncoder.encode(request.getParameter(name), "UTF-8")+"&";
			}
		}
		connection.setRequestProperty("Content-Length","" + Integer.toString(data.getBytes().length));

		//요청 데이터 보내기
		DataOutputStream dataOutputstr = new DataOutputStream(connection.getOutputStream());
		dataOutputstr.writeBytes(data);
		dataOutputstr.flush();
		dataOutputstr.close();
	}
	try{
		response.setStatus(connection.getResponseCode());
		response.setContentType(connection.getContentType());
		copyStream(connection.getInputStream(), response.getOutputStream());
		connection.disconnect();
	}
	catch (Exception e) {
		logger.info("========PROXY_URL_ERROR : "+e.getMessage()+"===========");
	}
%>