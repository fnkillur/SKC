<html ng-app="ionicApp">
  <head>
	<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
	<link rel="stylesheet" type="text/css"
	href="\resources\bootstrap\css\bootstrap.css" />
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
body {
  padding: 2em 5% 0 5%;
  margin: 0 0 0 0;
  font-family: Verdana, sans-serif;
  font-size: 14px;
  line-height: 1.5;
}
@media (max-width: 50em) {
  body {
    font-size: 12px;
  }
}

a {
  color: #1fa866;
}

ul, li {
  list-style: none;
  margin: 0;
  padding: 0;
}

nav {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  
  padding: 10px 10%;
  height: 5%;
  background-color: #21B16B;
  font-family: Helvetica, sans-serif;
  font-weight: 300;
}
nav ul {
  max-width: 50em;
  margin: 0 auto;
}
nav li {
  float: left;
  border-right: 1px solid #23be73;
}
nav li:first-child {
  border-left: 1px solid #23be73;
}
nav a {
  display: inline-block;
  background-color: #1fa866;
  padding: .5em;
  line-height: 1;
  text-decoration: none;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
  color: white;
}
nav iframe{
	position : absolute;
	right: 0; top: 0; width: 30%; top: 10%;
}
nav a:hover {
  border-bottom: 3px solid #e0589a;
}

h1 {
  font-family: Georgia, serif;
  font-weight: 400;
  line-height: 1;
  margin: 1em 0 .4em 0;
  padding: .4em 0 0 0;
  border-top: 2px solid #e8f7f0;
}
h1 span {
  padding: .33em 0 0 0;
  border-top: 2px solid #90d8b5;
}
@media (min-width: 30em) {
  h1 {
    font-size: 3em;
  }
}

nav iframe{
	position : absolute;
	right: 0; top: 0; width: 50px; top: 20px;
}

aside {
  background-color: #f7e8ef;
  overflow: hidden;
  padding: .5em 1em;
  border-top: 2px solid #b12167;
  font-size: .8em;
  margin-top: 3em;
}
aside li {
  border-top: 1px solid white;
  padding: .5em 0;
}
aside li:first-child {
  border: none;
  padding-top: 0;
}

footer {
	position: absolute;
	bottom:0; right:0; width: 100%;
  	clear: both;
  	background-color: #21B16B;
  	padding: 0 0 2em 0;
  	text-align: center;
}
footer a {
  color: white;
}

@media (min-width: 40em) {
  article {
    width: 80%;
    float: left;
    padding-right: 1em;
  }
  
  nav iframe{
	position : absolute;
	right: 0; top: 0; width: 30%; top: 10%;
}
}
</style>
  </head>

  <body>
    
    <nav role='navigation'>
    	<iframe src="/skc/log/login" frameborder=0></iframe>
	</nav>
</html>