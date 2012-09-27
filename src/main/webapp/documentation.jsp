<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Jive Developers</title>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1" />
<meta http-equiv="imagetoolbar" content="no" />

<link rel="stylesheet" href="assets/css/main.css" type="text/css" media="screen" />
</head>
<body>
	<div id="siteHeader" class="j-siteHeader">
		<jsp:include page="includes/site-header.jsp">
			<jsp:param name="parentPage" value="documentation" />
		</jsp:include>
	</div>

	<div id="main" class="j-main j-sidebarRight clearfix">
	
		<div id="contentArea" class="j-contentArea">
		    <div class="j-leftcol">
		    	<div class="j-content documentation">
	                <h1 class="deco">Documentation</h1>
                    <ul id="getting-started">
                        <li>
                            <p><a href="https://developers.jivesoftware.com/community/docs/DOC-1459">I'm new here! How do I get started?</a></p>
                            <p>You've come to the right place. Now all you need is to get started! This doc will show you how to set up your account and point out the links and references to get you started building your first Jive App!</p>
                        </li>
                        <li>
                            <p><a href="https://developers.jivesoftware.com/community/docs/DOC-1494">An introduction to the Jive Apps Market</a></p>
                            <p>This overview of Jive Apps and the Jive Apps Market will give you a basic understanding of Jive, Apps and the Apps Market.</p>
                        </li>
                        <li>
                            <p><a href="https://developers.jivesoftware.com/community/docs/DOC-1479">Learn more about building a social app</a></p>
                            <p>Get an overview of what it means to give your app a social life. Social apps are much more than just iFrames on a page. This article will talk about how the best practices for differentiating your application by adding social capabilities and integrating with the Jive platform.</p>
                        </li>
                        <li>
                            <p><a href="https://developers.jivesoftware.com/community/docs/DOC-1114">Jive Apps Tutorial</a></p>
                            <p>Jump right in! Use this tutorial to learn the basics of developing an app for Jive. It starts with a quicl "hello world" app and then opens the door to all the main APIs: OpenSocial, Jive Core, Jive Application Gateway, and Jive Connects.</p>
                        </li>
                    </ul>
	            </div>
		    </div>
		
		    <div class="j-rightcol">
		        <div class="j-featured j-sidebar">
		            <h2>API References</h2>
		            <ul id="api-references"></ul>
		            <h2>Code Examples</h2>
		            <ul id="code-examples"></ul>
		            <h2>Featured Docs</h2>
		            <ul id="featured-docs"></ul>
		        </div>
		    </div>
		</div>
	</div>
	
	<div id="bottomwrapper" class="j-belowcontent clearfix">
	    <div class="j-bottom">
	        <div class="j-contentArea clearfix">
	            <div id="howto" class="j-leftcol">
	                <h3>How-Tos</h3>
	                <ul id="how-to-docs"></ul>
	            </div>
	
	            <div id="rightcolumn" class="j-rightcol">
	                <div class="j-sidebar j-doclist">
	                    <h3>Most viewed</h3>
	                    <ul id="most-visited-docs"></ul>
						<h3>Highest Rated Documents</h3>
						<ul id="highest-rated-docs"></ul>
	                </div>
	            </div>
	
	        </div>
	   </div>
	</div>

</body>
</html>
