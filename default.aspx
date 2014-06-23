<%@ Page Language="vb" AutoEventWireup="false" Inherits="SCLE.User.homecare" CodeFile="default.aspx.vb" %>
<HTML>
	<HEAD>
		<title>Welcome to ViVo</title>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/icons.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
        <script src="js/modernizr.custom.js"></script>
	</HEAD>
	<body>
        <div class="container">
        <!-- Push Wrapper -->
        <div class="mp-pusher" id="mp-pusher">
        <!-- mp-menu -->
        <%
            Response.WriteFile("Navigation.html")
        %>	
        <div class="scroller">
            <!-- this is for emulating position fixed of the nav -->
            <div class="scroller-inner">
                <!-- Top Navigation -->
                <div class="codrops-top clearfix">
                    <a href="#" id="trigger"><span>Menu</span></a>
                    <span class="right"><a href="#"><span><img height="18px" src="imgs/2014_05_28_logo.png" /></span></a></span>
                </div>
                <header class="codrops-header">
                    <h1>VIVO <span>Project Tracking and Analysis Tool</span></h1>
                </header>
            </div><!-- /scroller-inner -->
        </div><!-- /scroller -->
        </div><!-- /pusher -->
    </div><!-- /container -->
<!-- /mp-menu -->
        <script src="js/classie.js"></script>
		<script src="js/mlpushmenu.js"></script>
		<script>
		    new mlPushMenu(document.getElementById('mp-menu'), document.getElementById('trigger'));
		</script>
	</body>
</HTML>
