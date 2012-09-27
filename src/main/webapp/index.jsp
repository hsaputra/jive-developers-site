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
			<jsp:param name="parentPage" value="home" />
		</jsp:include>
	</div>
	
	<div id="main" class="j-main j-sidebarRight clearfix">
	    <div id="contentArea" class="j-contentArea">
	        <div class="j-leftcol">
	            <div class="j-content j-welcome">
	                <h1 class="deco">Brew up something <span class="awesome">AWESOME!</span></h1>
	                <a href="gettingstarted.jsp" id="getstartedbutton" class="j-btn">Get Started Now <span class="j-icon-med j-icon-arrowright"></span></a>
	                <p>
	                    Developing for the Jive Platform can help you reach your enterprise audience.
	                </p>
	            </div>
	            <div class="beerMe">
	                <div class="taps">
	                    <a href="gettingstarted.jsp" class="tap">
	                        <span class="apptap"></span>
	                    </a>
	                    <a href="https://community.jivesoftware.com/community/developer/api/content?filterID=content~choose&filterID=content~objecttype~objecttype%5Bdocument%5D&filterID=content~tag%5Bdocumentation%5D" class="tap">
	                        <span class="doctap"></span>
	                    </a>
	                    <a href="https://devcenter.apps.jivesoftware.com/api/rest/" class="tap">
	                        <span class="apitap"></span>
	                    </a>
	                    <a href="ipas.jsp" class="tap">
	                        <span class="ipatap"></span>
	                    </a>
	                </div>
	                <div class="shelf"></div>
	            </div>
	        </div>
	        <div class="j-rightcol">
	            <div id="quickLinks" class="j-quickLinks j-sidebar">
	                <h2 class="deco">Quick Links</h2>
	                <ul>
	                    <li>
	                        <a href="https://devcenter.apps.jivesoftware.com/api/rest/">
	                            <span class="j-icon-med j-icon-arrowright"></span>
	                            Jive REST API
	                        </a>
	                    </li>
	                    <li>
	                        <a href="https://devcenter.apps.jivesoftware.com/api/js/">
	                            <span class="j-icon-med j-icon-arrowright"></span>
	                            Jive JavaScript API
	                        </a>
	                    </li>
	                    <li>
	                        <a href="/devcenter#myappqueue">
	                            <span class="j-icon-med j-icon-arrowright"></span>
	                            Jive Apps Submission
	                        </a>
	                    </li>
	                </ul>
	            </div>
	            <div id="jiveworld12">
	                <h3>JiveWorld 2012</h3>
	                Hang out with Jive engineers and other developers. Ask your questions and give us your feedback in person!
	            </div>
	        </div>
	    </div>
	</div>
	
	<div id="bottomwrapper" class="j-belowcontent clearfix">
	    <div class="j-bottom">
	        <div class="j-contentArea clearfix">
	            <div id="blog" class="j-leftcol">
	                <h3>Jive Developer Blog</h3>
					<ul id="blog-list"></ul>
	            </div>
	            <div id="rightcolumn" class="j-rightcol j-recentContent">
	                <div class="j-sidebar">
	                    <h3>Recent Discussions</h3>
	                    <ul id="recent-discussions"></ul>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

</body>
</html>
