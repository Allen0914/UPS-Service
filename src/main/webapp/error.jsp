<% java.io.StringWriter x = new java.io.StringWriter();
   ((Throwable)request.getAttribute("javax.servlet.error.exception")).printStackTrace(new java.io.PrintWriter(x));
   System.err.println(x.toString());
   request.setAttribute("stacktrace", x.toString());
   com.tradeshift.commons.configuration.ConfigurationLoader l = (com.tradeshift.commons.configuration.ConfigurationLoader) org.springframework.web.context.support.WebApplicationContextUtils.getRequiredWebApplicationContext(application).getBean("configurationLoader");
   if ("true".equals(l.getProperties().getProperty("stacktraces.enabled"))) {
	   String accept = request.getHeader("Accept");
	   if (accept != null && accept.contains("application/json")) {
		   response.setContentType("application/json");
%>["error":"<%= x.toString().replaceAll("\"", "\\\\\"") %>"]<% } else
       if (accept != null && accept.contains("xml")) {
		   response.setContentType("text/xml");
%><?xml version='1.0' encoding="UTF-8"?>
<Exception>
<%= x.toString().replaceAll("<", "&lt;").replaceAll(">", "&gt;") %>
</Exception><% } else {
%><%= x %><%
} }%>