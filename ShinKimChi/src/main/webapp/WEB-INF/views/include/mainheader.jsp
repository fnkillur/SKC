<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.skc.member.MemberVO" %>
<!DOCTYPE html>
<html ng-app="ionicApp">
  <head>
  	<meta charset='UTF-8'><meta name="robots" content="noindex">
	
	<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
	<script src='//assets.codepen.io/assets/common/stopExecutionOnTimeout.js?t=1'></script>
	<script type="text/javascript" src="/resources/dist/js/hm/navigateScript.js"></script>
	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  	<script src='//codepen.io/assets/editor/live/css_live_reload_init.js'></script>
	<script src='//assets.codepen.io/assets/common/stopExecutionOnTimeout.js?t=1'></script>
    <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    <script src="\resources\dist\js\hm\navigateScript.js" type="text/javascript"></script>
     
	<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css" />
	<link href="/resources/dist/css/hm/navigatebar.css" rel="stylesheet" type="text/css">
	<link rel="canonical" href="http://codepen.io/jasondavis/pen/IqsGm" />
	<link rel="canonical" href="http://codepen.io/codyhouse/pen/pIrbg" />
	<link href="\resources\dist\css\hm\logbar.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/148866/reset.css">
    <link rel='stylesheet prefetch' href='//codepen.io/assets/reset/reset.css'>
    <style>
    </style></head>
    <body>
    <% MemberVO vo = (MemberVO)session.getAttribute("sessionLogin"); %>
<header role="banner">
    <a href="#0"><img style="position: absolute; width: 200px; left:0px; top:0px; height: 80px;" src="\resources\dist\img\main\SKC_logo.png" alt="Logo"></a>

    <nav class="main-nav">
        <ul>
        	<c:set var="name" value="HYUN" />
        	<c:choose>
        	<c:when test="${name eq 'HYUN'}">
            	<li><a class="cd-signin" href="#0">Sign in</a></li>
            	<li><a class="cd-signup" href="#0">Sign up</a></li>
            </c:when>
            <c:otherwise>
            	<li><img style="height: 80px;" src="\resources\dist\img\profile\1432391023147-01.jpeg"></li>
            	<li style="color: white;"></li>
            </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</header>

<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
    <div class="cd-user-modal-container"> <!-- this is the container wrapper -->
        <ul class="cd-switcher">
            <li><a href="#0">Sign in</a></li>
            <li><a href="#0">New account</a></li>
        </ul>

        <div id="cd-login"> <!-- log in form -->
            <form id="logForm" action="/skc/member/login" method="post" class="cd-form">
                <p class="fieldset">
                    <label class="image-replace cd-email" for="signin-email">E-mail</label>
                    <input class="full-width has-padding has-border" name="id" id="signin-email" type="email" placeholder="E-mail">
                    <span class="cd-error-message">Error message here!</span>
                </p>

                <p class="fieldset">
                    <label class="image-replace cd-password" for="signin-password">Password</label>
                    <input class="full-width has-padding has-border" name="pw" id="signin-password" type="password"  placeholder="Password">
                    <span class="cd-error-message">Error message here!</span>
                </p>

                <p class="fieldset">
                    <input type="checkbox" id="remember-me" name="rememberMe" checked>
                    <label for="remember-me">Remember me</label>
                </p>

                <p class="fieldset">
                    <input id="loginBtn" class="full-width" type="submit" value="Login">
                </p>
            </form>

            <p class="cd-form-bottom-message"><a href="#0">Forgot your password?</a></p>
            <!-- <a href="#0" class="cd-close-form">Close</a> -->
        </div> <!-- cd-login -->

        <div id="cd-signup"> <!-- sign up form -->
            <form id="regForm" class="cd-form">
                <p class="fieldset">
                    <label class="image-replace cd-username" for="signup-username">Username</label>
                    <input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="Username">
                    <span class="cd-error-message">Error message here!</span>
                </p>
                
                <p class="fieldset">
                    <label class="image-replace cd-username" for="signup-username">Nickname</label>
                    <input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="Nickname">
                    <span class="cd-error-message">Error message here!</span>
                </p>

                <p class="fieldset">
                    <label class="image-replace cd-email" for="signup-email">E-mail</label>
                    <input class="full-width has-padding has-border" id="signup-email" type="email" placeholder="E-mail">
                    <span class="cd-error-message">Error message here!</span>
                </p>

                <p class="fieldset">
                    <label class="image-replace cd-password" for="signup-password">Password</label>
                    <input class="full-width has-padding has-border" id="signup-password" type="password"  placeholder="Password">
                    <span class="cd-error-message">Error message here!</span>
                </p>

                <p class="fieldset">
                    <input type="checkbox" id="accept-terms">
                    <label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
                </p>

                <p class="fieldset">
                    <input class="full-width has-padding" id="regBtn" type="submit" value="Create account">
                </p>
            </form>

            <!-- <a href="#0" class="cd-close-form">Close</a> -->
        </div> <!-- cd-signup -->

        <div id="cd-reset-password"> <!-- reset password form -->
            <p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

            <form class="cd-form">
                <p class="fieldset">
                    <label class="image-replace cd-email" for="reset-email">E-mail</label>
                    <input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
                    <span class="cd-error-message">Error message here!</span>
                </p>

                <p class="fieldset">
                    <input class="full-width has-padding" type="submit" value="Reset password">
                </p>
            </form>

            <p class="cd-form-bottom-message"><a href="#0">Back to log-in</a></p>
        </div> <!-- cd-reset-password -->
        <a href="#0" class="cd-close-form">Close</a>
    </div> <!-- cd-user-modal-container -->
</div> <!-- cd-user-modal -->
</body>
<script src='//assets.codepen.io/assets/common/stopExecutionOnTimeout.js?t=1'></script>
<script>
    $('#loginBtn').on("click", function(e){
    	e.preventDefault();
    	$('#logForm').submit();
    	console.log("dasdasd");
    });
</script>
<script src='//codepen.io/assets/editor/live/css_live_reload_init.js'></script>
</html>
</html>