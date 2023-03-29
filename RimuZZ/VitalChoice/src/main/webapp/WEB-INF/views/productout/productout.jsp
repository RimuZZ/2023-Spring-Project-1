<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script>

$(function() {
	// 마우스 오버할때 다른 이미지 보이기
	$(".thumbimg_list").hover(function(){ 
		console.log($(this).attr('src'));
		$("#thumbimg_main").attr("src", $(this).attr('src')); 
	});
	
	// 상품수량 '-' 클릭
	var totalprice = "<c:out value='${productdto.product_price}'/>"; 
	$("#cnt_minus").click(function () {
		var cnt = parseInt($("#productcnt").attr('value'));
		if(cnt>1){
			$("#productcnt").attr('value', cnt-1);
			$("#productcnt").val(cnt-1);
			$("#totalprice").html(totalprice*(cnt-1)+ ' 원');
		}
	});
	// 상품수량 '+' 클릭
	$("#cnt_plus").click(function () {
		var cnt = parseInt($("#productcnt").attr('value'));
		if(cnt<999){
			$("#productcnt").val(cnt+1);
			$("#productcnt").attr('value', cnt+1);
			$("#totalprice").html(totalprice*(cnt+1)+ ' 원');
		}
	});
	// 수량이 변하면 총 금액도 변하는 
	$("#productcnt").keyup(function () {
		var cnt = parseInt($(this).val());
		$(this).attr('value', cnt);
		$("#totalprice").html(totalprice*cnt + ' 원');
	});
	
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container-fluid" style="width: 1200px;">
  <div class="row"> 
    <div class="col-sm-6" align="right" style="width: 600px; background-color: yellow; padding-left: 0px;">
    	<div class="product">
			<!-- 상품이미지 -->
			<div id="thumb_img" style="width: 600px; text-align: left;">
				<div id="thumb_img_first" style="text-align: left; ">
					<img src="thumb_img/${thumblist[0].stored_file_name }" height="600" width="600" id="thumbimg_main">
				</div>
				<!-- 마우스 오버시 다른사진도 크게 볼 수 있게. -->
				<div id="thumb_img_list" style="text-align: left;">
					<c:forEach begin="0" end="${fn:length(thumblist)-1 }" step="1" var="i">
					
						<img src="thumb_img/${thumblist[i].stored_file_name }" height="120" width="120" class="thumbimg_list">
					</c:forEach>
				</div>
				<!-- 사진 밑에 고객 리뷰 별점 -->
				<div class="review_star" style="margin-top: 25px; font-size: 25px">
					<c:set value="${productdto.product_grade }" var="grade"/>
					<span style="text-align: left; padding-left: 30px;">고객 리뷰</span>
					<c:choose>
						<c:when test="${grade>=0.5&&grade<1.5 }">
							<span>★☆☆☆☆ ${grade}</span><span><!-- 리뷰 개수가 들어가야 한다. 리뷰 테이블 만들고 다시 넣자. --></span>
						</c:when>
						<c:when test="${grade>=1.5&&grade<2.5 }">
							<span>★★☆☆☆ ${grade}</span><span><!-- 리뷰 개수가 들어가야 한다. 리뷰 테이블 만들고 다시 넣자. --></span>
						</c:when>
						<c:when test="${grade>=2.5&&grade<3.5 }">
							<span>★★★☆☆ ${grade}</span><span><!-- 리뷰 개수가 들어가야 한다. 리뷰 테이블 만들고 다시 넣자. --></span>
						</c:when>
						<c:when test="${grade>=3.5&&grade<4.5 }">
							<span>★★★★☆ ${grade}</span><span><!-- 리뷰 개수가 들어가야 한다. 리뷰 테이블 만들고 다시 넣자. --></span>
						</c:when>
						<c:when test="${grade>=4.5}">
							<span>★★★★★ ${grade}</span><span><!-- 리뷰 개수가 들어가야 한다. 리뷰 테이블 만들고 다시 넣자. --></span>
						</c:when>
						<c:otherwise>
							<span>☆☆☆☆☆ ${grade}</span><span><!-- 리뷰 개수가 들어가야 한다. 리뷰 테이블 만들고 다시 넣자. --></span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
    </div>
    <div class="col-sm-6" style="background-color:lavenderblush; width: 600px; padding-right: 0px;">
    	<div class="product">
    		<div class="product_info" style="padding-left: 30px; text-align: left;">
    			<div class="product_category">
    				<span>${categorydto.category_main }&ensp;>&ensp;${categorydto.category_detail }</span>
    			</div>
    			<br>
    			<br>
    			<div class="product_detail">
    				<div style="font-size: 20px; color: gray;">${store_sname }</div>
    				<div style="font-size: 30px; ">${productdto.product_name }</div>
    				<div style="font-size: 18px; color: gray;">${productdto.product_name }</div>
    				<br>
    				<br>
    				<br>
    				<br>
    				<div style="font-size: 30px; ">${productdto.product_price}원</div>
    			</div>
    			<br>
    			<br>
    			<div class="product_order">
    				<form action="productorder" method="post" >
    				<div class="product_cnt" style="position: relative; min-height: 60px; border: 1px solid #e9e9e9; background: #f9f9f9; border-radius: 5px; ">
    					<span style="line-height: 60px; float: left; padding-left: 10px; ">구매수량</span>
    					<span style="line-height: 60px; float: right; padding-right: 10px;">
    						<button type="button" id="cnt_minus" style=" line-height: 20px; vertical-align: middle;">-</button>
    						<input type="text" value="1" id="productcnt" size=1 maxlength=3 style="text-align: center; height: 25px;">
    						<button type="button" id="cnt_plus" value="+" style="  line-height: 20px; vertical-align: middle; " >+</button>
    					</span>
    				</div>
    				<br>
    				<br>
    				<div class="product_totalprice">
    					<span style="text-align: left; padding-left: 5px; font-size: 25px; color: red; float: left;">상품금액 합계</span>
    					<span id="totalprice" style="text-align: right; padding-right: 5px; font-size: 25px; color: red; float: right;">${productdto.product_price} 원</span>
    				</div>
    				<!-- 장바구니, 결제 버튼 -->
    				<div class="order_btn" style="margin-top: 50px;">
	    				<button type="button" id="go_cart" style="height: 65px; margin-left: 0;font-size: 20px; font-weight: 500;">♡</button>
    					<button type="button" id="go_cart" style="height: 65px; margin-left: 0;font-size: 20px; font-weight: 500;">장바구니</button>
    					<button type="button" id="go_payment" style="height: 65px; margin-left: 0;font-size: 20px; font-weight: 500;">바로구매</button>
    				</div>
    				<!-- 구독버튼 -->
    				<div class="subscription_btn">
    					<span>한 달에 한 번! 구독으로 이용하세요</span>
    					<br>
    					<button type="button" id="go_cart" style="height: 65px; margin-left: 0;font-size: 20px; font-weight: 500;">구독하기</button>
    				</div>
    				</form>
    			</div>
    		</div>
    	</div>
    </div>
  </div>
  <div class="row" style="background-color:lavenderblush;">
  	<div class="col-sm-12">
  		<div style="height: 50px;"></div>
  		<ul class="nav nav-tabs">
		  <li class="active" style="float: left; width: 25%;"><a data-toggle="tab" href="#menu1">상품설명</a></li>
		  <li style="float: left; width: 25%;"><a data-toggle="tab" href="#menu2">판매정보</a></li>
		  <li style="float: left; width: 25%;"><a data-toggle="tab" href="#menu3">리뷰</a></li>
		  <li style="float: left; width: 25%;"><a data-toggle="tab" href="#menu4">Q&A</a></li>
		</ul>
		
		<div class="tab-content">
			<div id="menu1" class="tab-pane fade in active">
				<c:forEach items="${detaillist}" var="dl">
  					<img src="detail_img/${dl.stored_file_name }" width="1000" style="">
  				</c:forEach>
			</div>
			<div id="menu2" class="tab-pane fade">
		  		<h3>Menu 1</h3>
		  		<p>Some content in menu 1.</p>
			</div>
			<div id="menu3" class="tab-pane fade">
		  		<h3>Menu 2</h3>
		  		<p>Some content in menu 2.</p>
			</div>
			<div id="menu4" class="tab-pane fade">
		    	<h3>Menu 2</h3>
		    	<p>Some content in menu 2.</p>
			</div>
		</div>
  	</div>
</div>

</body>
</html>