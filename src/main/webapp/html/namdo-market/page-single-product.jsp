<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title -->
    <title>E-commerce Single Product Page 4 | Unify - Responsive Website Template</title>

    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/html/favicon.ico">

    <!-- Google Fonts -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700,900">

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/bootstrap/bootstrap.min.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/icon-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/icon-line-pro/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/icon-hs/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/hamburgers/hamburgers.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/hs-megamenu/src/hs.megamenu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/slick-carousel/slick/slick.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">

    <!-- CSS Unify Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/namdo-market/assets/css/styles.e-commerce.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/css/custom.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    
      $(function(){
    	  $("a[id='1']").text("??????");
    	  $("a[id='2']").text("?????????");
    	  $("a[id='3']").text("???/?????????");
    	  $("a[id='4']").text("?????????/?????????");
    	  $("a[id='5']").text("??????");
    	  $("a[id='6']").text("????????? ??????");
    	  
    	  
    	  if(${sellerDTO!=null}) {
    		  $("#cart").text("????????????");
    	  };
    	  
    	  
    	  $("#cart").click(function(){
    		
    		  var count = $("#orderCount").val();
    		  var uri = ""
    		  
    		  
    		  //?????? ????????? ???????????????
     		  if(${customerDTO!=null}) {
    			  uri = "${pageContext.request.contextPath}/front?key=cart&methodName=add&itemNo=${item.itemNo}&itemCount="+count;
     			  location.href = uri;
        		  return;
    		  } 
    		  
    		  else if(${sellerDTO!=null}){
    			  var sellerNo1 = "${item.sellerNo}";
    			  var sellerNo2 = "${sellerDTO.sellerNo}";
    			  
    			  if(sellerNo1 != sellerNo2) 
    			      alert("????????? ????????????.");
    			  else{
    				  uri = "${pageContext.request.contextPath}/front?key=item&methodName=checkUpdate&itemNo=${item.itemNo}";
    				  location.href = uri;
    			  }
    			  return;
    		  }
    		  
    		  else if(${adminDTO!=null}) {
    			  alert("????????? ????????????.");
    		  }
    		  
    		  else{
    			  location.href = "${pageContext.request.contextPath}/html/namdo-market/page-login-customer.jsp";
    			  return;
    		  }
    		  
    	  })
    	  
    	  
    	  
      });
    </script>
    
    
    <!-- <script type="text/javascript">
      $(function(){
    	 $("#reviewBtn").click(function(){
    		//alert(${item.itemNo});
 			
 			$.ajax({
 				url: "${pageContext.request.contextPath}/reviewServlet",
 				type: "post",
 				dataType: "json",
 				data:{itemNo:${item.itemNo}},
 				
 				success: function(result){
 					alert(result);
 					let atr="";
 					
 				},
 				error: function(err){
 					alert("?????? ??????");
 				}
 			});
    			
    	 });
      }); 

    </script> -->
    
    <script type="text/javascript">
      $(function(){
    	 $("#reviewBtn").click(function(){
    		 //alert("${item.itemNo}");
    		 $("#nav-1-2-accordion-default-hor-left-underline--1").remove();
    		let params = {itemNo: ${item.itemNo}}; 
    		
    		$("#reviewDisplay").load("${pageContext.request.contextPath}/front?key=item&methodName=selectReviewByItemNo&itemNo=${item.itemNo}", params);
    	 }); 
      });
    </script>
  </head>

  <body>
    <main>
      <!-- Header -->
      <c:if test="${sessionScope.customerDTO==null && sessionScope.sellerDTO==null && sessionScope.adminDTO==null}">
        <jsp:include page="common/header.jsp"/>
      </c:if>

      <c:if test="${sessionScope.customerDTO!=null}">
        <jsp:include page="common/customer-header.jsp"/>
      </c:if>

      <c:if test="${sessionScope.sellerDTO!=null}">
        <jsp:include page="common/seller-header.jsp"/>
      </c:if>

      <c:if test="${sessionScope.adminDTO!=null}">
        <jsp:include page="common/admin-header-main.jsp"/>
      </c:if>
      
      
      <!-- Breadcrumbs -->
      <section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
        <div class="container">
          <ul class="u-list-inline">
            <li class="list-inline-item g-mr-5">
              <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/html/namdo-market/home-page.jsp">?????? ????????????????</a>
              <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
            </li>
            <li class="list-inline-item g-mr-5">
              <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/front?key=item&methodName=selectByCategoryNo&categoryNo=${item.categoryNo}" id="${item.categoryNo}">  </a>
              <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
            </li>
            <li class="list-inline-item g-color-primary">
              <span>${item.itemName}</span>
              
            </li>
          </ul>
        </div>
      </section>
      <!-- End Breadcrumbs -->
 
      

      <!-- Product Description -->
      <div class="container g-py-50">
        <div class="row">
          <div class="col-lg-7">
            <!-- Carousel -->
            <div id="carouselCus1" class="js-carousel g-pt-10 g-mb-10"
                 data-infinite="true">
              <div class="js-slide g-bg-cover g-bg-black-opacity-0_1--after">
                <img class="img-fluid w-100 g-height-600" src="${pageContext.request.contextPath}/save/${item.mainImg}" alt="Image Description">
              </div>
              
            </div>

            
            <!-- End Carousel -->
          </div>
       <div class="col-lg-5">
            <div class="g-px-40--lg g-pt-70">
              <!-- Product Info -->
              <div class="g-mb-30">
                <h1 class="g-font-weight-300 mb-4">${item.itemName}</h1>
                <p><!-- Dress is the "rain mac" version of our beloved essential the Unify Parka. Crafted from a water resistant fluid memory fabric to create an elegant draped effect when thrown on, this lightweight shell will take you from season to season and protect you from that unexpected shower. --></p>
              </div>
              <!-- End Product Info -->

              <!-- Price -->
              <div class="g-mb-30">
                <h2 class="g-color-gray-dark-v5 g-font-weight-400 g-font-size-12 text-uppercase mb-2">?????????</h2>
                <span class="g-color-black g-font-weight-500 g-font-size-30 mr-2">
                     <fmt:formatNumber value="${item.itemPrice}"/>???
                
                </span>
              </div>
              <!-- End Price -->

              <!-- Accordion -->
              <div id="accordion-01" role="tablist" aria-multiselectable="true">
                <div id="accordion-01-heading-01" class="g-brd-y g-brd-gray-light-v3 py-3" role="tab">
                  <h5 class="g-font-weight-400 g-font-size-default mb-0">
                    <a class="d-block g-color-gray-dark-v5 g-text-underline--none--hover" href="#accordion-01-body-01" data-toggle="collapse" data-parent="#accordion-01" aria-expanded="false" aria-controls="accordion-01-body-01">??????
                      <span class="float-right g-pos-rel g-top-3 mr-1 fa fa-angle-down"></span></a>
                  </h5>
                </div>
                <div id="accordion-01-body-01" class="collapse" role="tabpanel" aria-labelledby="accordion-01-heading-01">
                  <div class="g-py-10">
                    <p class="g-font-size-12 mb-2">?????????: ??????</p>
                    <p class="g-font-size-12 mb-2">?????????: ??????</p>
                    <p class="g-font-size-12 mb-2">?????????: (??????)  ${item.sellerNo}</p>
                    <p class="g-font-size-12 mb-2">????????????: ?????? ??? ????????????????????? ?????????????????? ???????????????.</p>
                  </div>
                </div>
              </div>
              <!-- End Accordion -->

              <!-- Colour -->
              
              <!-- <div class="d-flex justify-content-between align-items-center g-brd-bottom g-brd-gray-light-v3 py-3" role="tab">
                <h5 class="g-color-gray-dark-v5 g-font-weight-400 g-font-size-default mb-0">Colour</h5> -->

                <!-- Checkbox -->
                <!-- <label class="form-check-inline u-check mb-0 ml-auto g-mr-10">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio">
                  <span class="d-block u-check-icon-checkbox-v4 g-brd-transparent g-brd-gray-dark-v4--checked rounded-circle">
                    <i class="d-block g-absolute-centered g-width-12 g-height-12 g-bg-primary rounded-circle"></i>
                  </span>
                </label>
                <label class="form-check-inline u-check mb-0 g-mx-10">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio">
                  <span class="d-block u-check-icon-checkbox-v4 g-brd-transparent g-brd-gray-dark-v4--checked rounded-circle">
                    <i class="d-block g-absolute-centered g-width-12 g-height-12 g-bg-beige rounded-circle"></i>
                  </span>
                </label>
                <label class="form-check-inline u-check mb-0 g-mx-10">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio">
                  <span class="d-block u-check-icon-checkbox-v4 g-brd-transparent g-brd-gray-dark-v4--checked rounded-circle">
                    <i class="d-block g-absolute-centered g-width-12 g-height-12 g-bg-black rounded-circle"></i>
                  </span>
                </label>
                <label class="form-check-inline u-check mb-0 g-ml-10 mr-0">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio">
                  <span class="d-block u-check-icon-checkbox-v4 g-brd-transparent g-brd-gray-dark-v4--checked rounded-circle">
                    <i class="d-block g-absolute-centered g-width-12 g-height-12 g-bg-gray-dark-v4 rounded-circle"></i>
                  </span>
                </label> -->
                <!-- End Checkbox -->
             <!--  </div> -->
               

              <!-- Size -->
              
              <!-- End Size -->

              <!-- Quantity -->
              <div class="d-flex justify-content-between align-items-center g-brd-bottom g-brd-gray-light-v3 py-3 g-mb-30" role="tab">
                <h5 class="g-color-gray-dark-v5 g-font-weight-400 g-font-size-default mb-0">??????</h5>

                <div class="js-quantity input-group u-quantity-v1 g-width-80 g-brd-primary--focus">
                  <input id="orderCount" class="js-result form-control text-center g-font-size-13 rounded-0" type="text" value="1" readonly>

                  <div class="input-group-addon d-flex align-items-center g-brd-gray-light-v2 g-width-30 g-bg-white g-font-size-13 rounded-0 g-pa-5">
                    <i class="js-plus g-color-gray g-color-primary--hover fa fa-angle-up"></i>
                    <i class="js-minus g-color-gray g-color-primary--hover fa fa-angle-down"></i>
                  </div>
                </div>
              </div>
              <!-- End Quantity -->

              <!-- Buttons -->
              <div class="row g-mx-minus-5 g-mb-20">
                <div class="col g-px-5 g-mb-10">
                  <button id="cart" class="btn btn-block u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25" type="button">
                    ???????????? ?????? <i class="align-middle ml-2 icon-finance-100 u-line-icon-pro"></i>
                  </button>
                </div>
              </div>
              <!-- End Buttons -->

              <!-- Nav Tabs -->
              <ul class="nav d-flex justify-content-between g-font-size-12 text-uppercase" role="tablist" data-target="nav-1-1-default-hor-left">
                <li class="nav-item g-brd-bottom g-brd-gray-dark-v4">
                  <a class="nav-link active g-color-primary--parent-active g-pa-0 g-pb-1" data-toggle="tab" href="#nav-1-1-default-hor-left--3" role="tab">??????????????????</a>
                </li>
                <li class="nav-item g-brd-bottom g-brd-gray-dark-v4">
                  <a class="nav-link g-color-primary--parent-active g-pa-0 g-pb-1" data-toggle="tab" href="#nav-1-1-default-hor-left--1" role="tab">????????????</a>
                </li>
                <li class="nav-item g-brd-bottom g-brd-gray-dark-v4">
                  <a class="nav-link g-color-primary--parent-active g-pa-0 g-pb-1" data-toggle="tab" href="#nav-1-1-default-hor-left--2" role="tab">?????? ??? ????????????</a>
                </li>
              </ul>
              <!-- End Nav Tabs -->

              <!-- Tab Panes -->
              <div id="nav-1-1-default-hor-left" class="tab-content">
                <div class="tab-pane fade show active g-pt-30" id="nav-1-1-default-hor-left--3" role="tabpanel">
                  <p class="g-color-gray-dark-v4 g-font-size-12 mb-0">??????????????? ?????? ????????? ?????? ??????????????? ??????????????? ?????? ?????? ????????????. ?????????????????? ?????? ????????? ???????????? ?????? ????????? ????????? ???????????? ????????? ???????????? ????????? ?????? ????????? ????????? ?????? ?????? ????????? ??? ????????????.<br>
                  <br>????????? ????????? ?????? ?????? ????????? PC??????, ???????????????, ???????????? ?????? ????????? ???????????? ?????? ??????????????? ?????????. 
                  ????????? ????????? ??????????????? ?????????????????? ????????? ????????? ??????????????? ??????, 7??? ????????? ????????? ????????? ?????? ???????????? ?????? ????????? ???????????? ?????????.
                    <a href="#">FAQ</a>.</p>
                </div>

                <div class="tab-pane fade g-pt-30" id="nav-1-1-default-hor-left--1" role="tabpanel">
                  <!-- <h4 class="g-font-size-15 mb-3">General Clothing Size Guide</h4> -->

                  <!-- ???????????? -->
                  <table>
                    <tbody>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">?????? ??????: ??????</td>
               
                        <!-- <td class="align-top g-width-50 g-py-5">M</td>
                        <td class="align-top g-width-50 g-py-5">L</td>
                        <td class="align-top g-width-50 g-py-5">XL</td>
                        <td class="align-top g-width-50 g-py-5">XXL</td> -->
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">?????? ??????: ????????????</td>
                      </tr>
                      
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">?????? ??????: ??????</td>
                      </tr>
                      
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">?????? ??????: 3??? ~ 7???</td>
                      </tr>
                      
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">?????? ??????: ??????????????? ??????????????? ????????? ??????????????? ??????????????? ?????? ????????? ????????????.</td>
                      </tr>
                      
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">??????????????? ???????????? ????????? ?????? ????????? ????????? ????????????. ??????, ??????????????? ????????? ????????? ????????? ?????? ????????? ??? ????????????.</td>
                      </tr>
                    </tbody>
                  </table>
                  <!-- ???????????? -->
                </div>

                <div class="tab-pane fade g-pt-30" id="nav-1-1-default-hor-left--2" role="tabpanel">
                <h5 class="g-font-size-13 mb-3"> - ?????? ??? ????????? ????????? ??????</h5>
                  <!-- Shipping Mehtod -->
                  <table>
          
                    <tbody>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">1. ????????? ???????????? ???????????? 7?????????, ????????? ????????? ?????? ??? ?????? ???????????? / ??????????????? ?????? ??????????????? ?????? ??????????????????.</td>
               
                        <!-- <td class="align-top g-width-50 g-py-5">M</td>
                        <td class="align-top g-width-50 g-py-5">L</td>
                        <td class="align-top g-width-50 g-py-5">XL</td>
                        <td class="align-top g-width-50 g-py-5">XXL</td> -->
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">2. ??????????????? ?????? ??? ????????? ????????? ??????.?????? ????????? ???????????? ????????? ????????? ???????????? ???????????? ???????????? 3?????????, ???????????? ?????? ??? ???????????? 30?????????</td>
                      </tr>
                    </table>
                    <br>
                    <h5 class="g-font-size-13 mb-3"> - ?????? ??? ????????? ???????????? ??????</h5>
                   <table>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">1. ???????????? ?????? ?????? ????????? ???????????? ?????? ?????? ????????? ??????. ???, ????????? ????????? ???????????? ????????? ?????? ?????? ????????? ????????? ??????</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">2. ????????? ?????????????????? ????????? ???????????? ??????????????? ????????? ?????? (???: ?????? ???)</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">3. ???????????? ?????? ?????? ?????? ????????? ????????? ????????? ????????? ????????? ????????? ??????</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">4. ????????? ????????? ????????? ???????????? ????????? ????????? ???????????? ????????? ????????? ????????? ??????</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">5. ????????? ????????? ???????????? ????????? ????????? ??????</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">6. ???????????? ?????? ??? ??????????????? ???????????? ??????????????????</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">7. ????????? ????????? ????????? ?????? ????????? ???????????????.</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">??? ???????????? ????????? ????????? ??????, ????????? ?????? ?????? ???????????? ????????? ??????????????? ??????????????? ?????????.</td>
                      </tr>
                    </tbody>
                  </table>
                  <!-- End Shipping Mehtod -->
                </div>
              </div>
              <!-- End Tab Panes -->
            </div>
          </div>
        </div>
      </div>
      <!-- End Product Description -->
	  <br>
	  <!-- Features -->
	      <div class="g-brd-y g-brd-gray-light-v4">
	        <div class="container g-py-30">
	          <div class="row justify-content-center">
	            <div class="col-md-4 mx-auto g-py-15">
	              <div class="media g-px-50--lg">
	                <i class="d-flex g-color-black g-font-size-30 g-pos-rel g-top-3 mr-4 icon-real-estate-048 u-line-icon-pro"></i>
	                <div class="media-body">
	                  <span class="d-block g-font-weight-400 g-font-size-default text-uppercase">?????? ??????</span>
	                  <span class="d-block g-color-gray-dark-v4">2-3??? ??????</span>
	                </div>
	              </div>
	            </div>
	
	            <div class="col-md-4 mx-auto g-brd-x--md g-brd-gray-light-v3 g-py-15">
	              <div class="media g-px-50--lg">
	                <i class="d-flex g-color-black g-font-size-30 g-pos-rel g-top-3 mr-4 icon-real-estate-040 u-line-icon-pro"></i>
	                <div class="media-body">
	                  <span class="d-block g-font-weight-400 g-font-size-default text-uppercase">?????? ??? ??????</span>
	                  <span class="d-block g-color-gray-dark-v4">?????? ??? 7??? ??????</span>
	                </div>
	              </div>
	            </div>
	
	            <div class="col-md-4 mx-auto g-py-15">
	              <div class="media g-px-50--lg">
	                <i class="d-flex g-color-black g-font-size-30 g-pos-rel g-top-3 mr-4 icon-hotel-restaurant-062 u-line-icon-pro"></i>
	                <div class="media-body text-left">
	                  <span class="d-block g-font-weight-400 g-font-size-default text-uppercase">24??? ??????</span>
	                  <span class="d-block g-color-gray-dark-v4">?????? ?????? ?????? ?????????</span>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	      <!-- End Features -->
	      
	      <!-- Description & Review -->
	      <div class="container">
	        <div class="g-brd-y g-brd-gray-light-v3 g-py-100">
	          <!-- Nav tabs -->
	          <ul class="nav g-max-width-200 text-center mx-auto" role="tablist" data-target="nav-1-2-accordion-default-hor-left-underline" data-tabs-mobile-type="accordion" data-btn-classes="btn btn-md btn-block rounded-0 u-btn-outline-primary g-mb-20">
	            <li class="nav-item text-center mx-auto g-pb-10">
	              <a class="nav-link active g-brd-around g-brd-primary--active g-color-text g-color-primary--parent-active g-font-size-16 rounded" data-toggle="tab" href="#nav-1-2-accordion-default-hor-left-underline--1" role="tab">????????????</a>
	            </li>
	            <li class="nav-item text-center mx-auto g-pb-10">
	              <a class="nav-link g-brd-around g-brd-primary--active g-color-text g-color-primary--parent-active g-font-size-16 rounded" data-toggle="tab" id="reviewBtn" href="" role="tab">????????????</a>
	            </li>
	          </ul>
	          <!-- End Nav tabs -->
	
	          <!-- Tab panes -->
	          <div id="nav-1-2-accordion-default-hor-left-underline" class="tab-content">
	            <div class="tab-pane fade show active g-pt-50" id="nav-1-2-accordion-default-hor-left-underline--1" role="tabpanel">
	              <h2 class="h4 mb-3" style="text-align: center">????????????</h2>
	
	                <div class="col-md-20 g-mb-30">
	                  ${item.itemDescription}
	                </div>
				</div>
			
	      <!-- Reviews -->
           
              <div class="row justify-content-center">
                <div class="col-lg-9">
				  <!-- Review -->
	              <div id="reviewDisplay" class="g-brd-bottom g-brd-gray-light-v4 g-pb-30 g-mb-50">
	              </div>
	              <!-- End Review -->

                </div>
              </div>
            </div>
          </div>
          <!-- End Tab panes -->
        </div>

      <!-- End Description & Review -->
	
      <!-- Products -->
         <img class="img-fluid" src="${pageContext.request.contextPath}/save/${item.detailImg}" alt="namdo insa" style="display: block; margin-left: auto; margin-right: auto;">
      
      <!-- End Products -->

      <!-- Footer -->
      <jsp:include page="common/footer.jsp"/>

      <a class="js-go-to u-go-to-v2" href="#"
         data-type="fixed"
         data-position='{
           "bottom": 15,
           "right": 15
         }'
         data-offset-top="400"
         data-compensation="#js-header"
         data-show-effect="zoomIn">
        <i class="hs-icon hs-icon-arrow-top"></i>
      </a>
    </main>

    <div class="u-outer-spaces-helper"></div>

    <!-- JS Global Compulsory -->
    <script src="${pageContext.request.contextPath}/html/assets/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/jquery-migrate/jquery-migrate.min.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/popper.js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/bootstrap/bootstrap.min.js"></script>

    <!-- JS Implementing Plugins -->
    <script src="${pageContext.request.contextPath}/html/assets/vendor/slick-carousel/slick/slick.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- JS Unify -->
    <script src="${pageContext.request.contextPath}/html/assets/js/hs.core.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.header.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.countdown.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.carousel.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.tabs.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.count-qty.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.go-to.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/helpers/hs.rating.js"></script>

    <!-- JS Customization -->
    <script src="${pageContext.request.contextPath}/html/assets/js/custom.js"></script>

    <!-- JS Plugins Init. -->
    <script>
      $(document).on('ready', function () {
        // initialization of carousel
        $.HSCore.components.HSCarousel.init('.js-carousel');

        // initialization of header
        $.HSCore.components.HSHeader.init($('#js-header'));
        $.HSCore.helpers.HSHamburgers.init('.hamburger');

        // initialization of HSMegaMenu plugin
        $('.js-mega-menu').HSMegaMenu({
          event: 'hover',
          pageContainer: $('.container'),
          breakpoint: 991
        });

        // initialization of HSDropdown component
        $.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
          afterOpen: function () {
            $(this).find('input[type="search"]').focus();
          }
        });

        // initialization of go to
        $.HSCore.components.HSGoTo.init('.js-go-to');

        // initialization of HSScrollBar component
        $.HSCore.components.HSScrollBar.init($('.js-scrollbar'));

        // initialization of quantity counter
        $.HSCore.components.HSCountQty.init('.js-quantity');

        // initialization of tabs
        $.HSCore.components.HSTabs.init('[role="tablist"]');

        // initialization of rating
        $.HSCore.helpers.HSRating.init();
      });

      $(window).on('resize', function () {
        setTimeout(function () {
          $.HSCore.components.HSTabs.init('[role="tablist"]');
        }, 200);
      });
    </script>
  </body>
</html>
