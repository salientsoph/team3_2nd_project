<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title -->
    <title>E-commerce Password Recovery Page | Unify - Responsive Website Template</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/icon-line/css/simple-line-icons.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/icon-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/icon-line-pro/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/icon-hs/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/hamburgers/hamburgers.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/hs-megamenu/src/hs.megamenu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">

    <!-- CSS Unify Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/namdo-market/assets/css/styles.e-commerce.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/html/assets/css/custom.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	if("${requestScope.pwdInfo}"=="" || "${requestScope.pwdInfo}"==null) {
    		alert("????????? ??? ????????????.");
    		history.back();
    	}
    	
    	if("${requestScope.pwdInfo}"=="seller") {
    		$("[name=key]").attr("value", "seller");
    	}
    	
    	
    });
    </script>
    <script type="text/javascript">
    
    function form_check() {
  	  //????????? ????????????
  	  
  	  var Pwd = document.getElementById("Pwd");
  	  var PwdCheck = document.getElementById("PwdCheck");
  	  
  	  /*
  	  alert(customerName.value);
  	  alert(customerMonth.val());

  	  alert(customerDay.value);
  	  alert(customerYear.value);
  	  
  	  alert(customerId.value);
  	  alert(customerAddr.value)
  	  alert(customerDetailAddr.value)
  	  alert(customerEmail.value);
  	  alert(customerContact.value);
  	  alert(customerPwd.value);
  	  alert(customerPwdCheck.value);
  	  */
  	  
	  var reg_pwd = /^[a-z0-9_-]{6,18}$/; // ?????? 6~18??????

  	 
    	  
   	  if (Pwd.value == "" || !reg_pwd.test(Pwd.value)) { //?????? ???????????? ?????? ?????? ?????????: if(!uid.value)
   	    alert("??????????????? ???????????????.");
   	    Pwd.focus(); //focus(): ????????? ???????????? ??????, blur(): ????????? ???????????? ??????
   	    return false; //return: ???????????? return false:  ???????????? ???????????? ????????? ?????? ???????????? ???????????? ???????????? ??????
   	  };
   	  
   	  if (PwdCheck.value == "" || !reg_pwd.test(PwdCheck.value)) { //?????? ???????????? ?????? ?????? ?????????: if(!uid.value)
   	    alert("????????????(??????)??? ???????????????.");
   	    PwdCheck.focus(); //focus(): ????????? ???????????? ??????, blur(): ????????? ???????????? ??????
   	    return false; //return: ???????????? return false:  ???????????? ???????????? ????????? ?????? ???????????? ???????????? ???????????? ??????
   	  };
   	  
   	  if(Pwd.value != PwdCheck.value) {
   		  alert("??????????????? ???????????? ????????????.")
   		  PwdCheck.value = "";
   		  PwdCheck.focus();
   		  return false;
   	  }
    	  
  	  

  	  //?????? ??? ??????
  	  document.password_form.submit(); //????????? ????????? ????????? 
  	  
  	}

    	
  
  
    </script>
  </head>

  <body>
    <main>
      <!-- Header -->
      <c:if test="${sessionScope.customerDTO==null && sessionScope.sellerDTO==null}">
        <jsp:include page="common/header.jsp"/>
      </c:if>

      <c:if test="${sessionScope.customerDTO!=null}">
        <jsp:include page="common/customer-header.jsp"/>
      </c:if>

      <c:if test="${sessionScope.sellerDTO!=null}">
        <jsp:include page="common/seller-header.jsp"/>
      </c:if>


      <!-- Breadcrumbs -->
      <section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
        <div class="container">
          <ul class="u-list-inline">
            <li class="list-inline-item g-mr-5">
              <a class="u-link-v5 g-color-text" href="#">Home</a>
              <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
            </li>
            <li class="list-inline-item g-mr-5">
              <a class="u-link-v5 g-color-text" href="#">Pages</a>
              <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
            </li>
            <li class="list-inline-item g-color-primary">
              <span>???????????? ??????</span>
            </li>
          </ul>
        </div>
      </section>
      <!-- End Breadcrumbs -->

      <!-- Login -->
      <section class="container g-py-100">
        <div class="row justify-content-center">
          
          
          <div class="col-sm-9 col-md-7 col-lg-5">
          
            <div class="g-brd-around g-brd-gray-light-v3 g-bg-white rounded g-px-30 g-py-50 mb-4">
              <header class="text-center mb-4">
                <h1 class="h4 g-color-black g-font-weight-400">???????????? ??????</h1>
              </header>

              <!-- Form -->
              <form name="password_form" class="g-py-15" action="${pageContext.request.contextPath}/front">
			      <input type="hidden" name="key" value = "customer" /> <!-- Controller??? ?????? ?????? -->
			      <input type="hidden" name="methodName" value = "setPwd" />  <!-- ??????????????? -->
			      <input type="hidden" name="id" value = "${requestScope.searchId}"/>
                <div class="mb-4">
                  <div class="input-group g-rounded-left-5">
                    <input name="Pwd" id="Pwd" name="customerPwd" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-rounded-left-0 g-rounded-right-5 g-py-15 g-px-15" type="password" placeholder="????????????(6~18??????)">
                  </div>
                  
                  <br>
                  
                  <div class="input-group g-rounded-left-5">
                    <input id="PwdCheck" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-rounded-left-0 g-rounded-right-5 g-py-15 g-px-15" type="password" placeholder="??????????????????(6~18??????)">
                  </div>
                                    
                </div>

                <button class="btn btn-block u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25" type="button" onclick="form_check()">??????</button>
              </form>
              
              <!-- End Form -->
            </div>
            

          </div>
        </div>
      </section>
      <!-- End Login -->

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
    <script src="${pageContext.request.contextPath}/html/assets/vendor/appear.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/chosen/chosen.jquery.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/image-select/src/ImageSelect.jquery.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- JS Unify -->
    <script src="${pageContext.request.contextPath}/html/assets/js/hs.core.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.header.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.select.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.counter.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.go-to.js"></script>

    <!-- JS Customization -->
    <script src="${pageContext.request.contextPath}/html/assets/js/custom.js"></script>

    <!-- JS Plugins Init. -->
    <script>
      $(document).on('ready', function () {
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

        // initialization of HSScrollBar component
        $.HSCore.components.HSScrollBar.init($('.js-scrollbar'));

        // initialization of go to
        $.HSCore.components.HSGoTo.init('.js-go-to');

        // initialization of custom select
        $.HSCore.components.HSSelect.init('.js-custom-select');

        // initialization of counters
        var counters = $.HSCore.components.HSCounter.init('[class*="js-counter"]');
      });
    </script>
  </body>
</html>