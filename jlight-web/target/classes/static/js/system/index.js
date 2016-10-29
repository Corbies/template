 jQuery(document).ready(function(){  
	 
	//初始化宽度、高度    
    $("#main-container").height($(window).height()-76); 
	$("#iframe").height($(window).height()-155); 
	$(".sidebar").height($(window).height()-99); 
	
    //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$("#main-container").height($(window).height()-76); 
	$("#iframe").height($(window).height()-155);
	$(".sidebar").height($(window).height()-99); 
  });
    $(document).on("click",'.iframeurl',function(){
        var cid = $(this).attr("name");
		var cname = $(this).attr("title");
		$(".submenu,#nav_list").find(".active").removeClass("active");
		$(this).parent().addClass("active");
        $("#iframe").attr("src",cid).ready();
		$("#Bcrumbs").attr("href",cid).ready();
		$(".Current_page a").attr('href',cid).ready();	
		$(".Current_page").html(cname).ready();	
		$("#parentIframe").html(""). css("display","none").ready();						
      });  
	  	
});
 
/*********************点击事件*********************/
$( document).ready(function(){
	  $('#nav_list').find('li.home').click(function(){
	  $('#nav_list').find('li.home').removeClass('active');
$(this).addClass('active');
  });	
});
//时间设置
function currentTime(){ 
	var d=new Date(),str=''; 
	str+=d.getFullYear()+'年'; 
	str+=d.getMonth() + 1+'月'; 
	str+=d.getDate()+'日'; 
	str+=d.getHours()+'时'; 
	str+=d.getMinutes()+'分'; 
	str+= d.getSeconds()+'秒'; 
    return str; 
} 

setInterval(function(){$('#time').html(currentTime);},1000); 

