<%@ tag body-content="empty" dynamic-attributes="dynattrs" %>
<%@ attribute name="container" required="true" %>
<%@ attribute name="content" required="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="rssFetcher" class="com.jivesoftware.developers.feeds.JiveCommunityRssFetcher" />
<c:set target="${rssFetcher}" property="container" value="${container}" />
<c:set target="${rssFetcher}" property="content" value="${content}" />
