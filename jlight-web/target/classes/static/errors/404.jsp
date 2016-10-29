<%@ page language="java" contentType="text/html; charset=UTF-8" session="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta name="viewport" content="width=device-width, initial-scale = 1.0, user-scalable = no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>出错了!</title>
<link rel="icon" href="${ctx }/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="${ctx }/css/404.css" media="all">
</head>
<body>
<!--顶部导航-->

<div class="menu"></div>
<!--顶部导航-->
<div class="error_404">
  <div class="container clearfix">
    <div class="error_pic"></div>
    <div class="error_info">
      <h2>
        <p>对不起，您访问的页面不存在！</p>
      </h2>
    </div>
  </div>
</div>
 <script src="${ctx }/js/lib/jquery/jquery-1.8.3.min.js"></script>
 <script type="text/javascript">
	$(function(){
		 $("#back_top > a").click(function(){
			$("html, body").animate({scrollTop:"0px"},1000);
			return false
		});
	})
</script>
<!-- 页脚 -->
<!--[if lte IE 9]>
    <script src="js/html5.min.js"></script>   
<![endif]-->
<!--[if IE 6]>
		<script type="text/javascript" src="js/dd_belatedpng.js"></script>
		<script type="text/javascript">
			DD_belatedPNG.fix('div, ul, img, li, input , a, .png_bg'); 
	  	</script>
 <![endif]-->
</body>
</html>