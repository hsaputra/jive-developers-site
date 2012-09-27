<%@ page import="com.jiveapps.trust.jam.impl.*" %>
<%@ page import="com.jiveapps.trust.jam.sso.*" %>
<html>
<body>
<B>You are now logged out!</B>
</body>
</html>
<%
    Cookie cookie = CookieUtils.getCookie(request, "jamSSO");
    if(cookie!=null) {
        CookieUtils.deleteCookie(request, response, cookie);
%>
<b>and cookie has been deleted!!!!</b>
<%
    }
%>