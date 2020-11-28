<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Toy shop - Ecommerce Bootstrap 4 HTML Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/client/images/logo2.png"
	type="image/x-icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/client/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/client/css/style2.css">
<!-- Responsive CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/client/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/client/css/custom.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/client/search/jquery-ui.css">

<script
	src="${pageContext.request.contextPath }/resources/client/search/jquery-1.12.4.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/client/search/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/toastr/toastr.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/toastr/toastr.min.css">
<script
	src="${pageContext.request.contextPath }/resources/client/js/ajax/ajaxClient.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/client/js/ajax/ajaxClient.js"></script>
<script>
	toastr.options = {
		  "closeButton": true,
		  "debug": true,
		  "newestOnTop": true,
		  "progressBar": true,
		  "positionClass": "toast-bottom-right",
		  "preventDuplicates": false,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "5000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "show",
		  "hideMethod": "hide"
		}
		function myFunction(x){
			$.ajax({
				url : 'http://localhost:9596/client/addCartJson/'+x,
				success : function(responseText) {
						toastr["success"]("thêm thành công");
						$('#ajaxGetUserServletResponse').html(responseText);
						$.ajax({
							url : 'http://localhost:9596/client/addCartDanhSachDaDat/'+x,
							success : function(responseText) {
									$('#danhSachSanPhamDat').html(responseText);
							}
						});
						$.ajax({
							url : 'http://localhost:9596/client/showSoLuongGioHang',
							success : function(responseText) {
									$('#showSoLuong').html(responseText);
							}
						});
				},
				statusCode: {
				    400: function() {
				    	toastr["error"]("Không đủ hàng");
				    }
				}
			});
		}
	function lowMyCartFunction(x){
		$.ajax({
			url : 'http://localhost:9596/client/lowMyCartJson/'+x,
			success : function(responseText) {
					$('#ajaxGetUserServletResponse').html(responseText);
					$.ajax({
						url : 'http://localhost:9596/client/addCartDanhSachDaDat/'+x,
						success : function(responseText) {
								$('#danhSachSanPhamDat').html(responseText);
						}
					});
					$.ajax({
						url : 'http://localhost:9596/client/showSoLuongGioHang',
						success : function(responseText) {
								$('#showSoLuong').html(responseText);
						}
					});
			}
		});
	}
	function deleteMyCartFunction(x,y) {
		$.ajax({
			url : 'http://localhost:9596/client/deleteMyCartJson/'+x,
			success : function(responseText) {
					$('#ajaxGetUserServletResponse').html(responseText);
					$.ajax({
						url : 'http://localhost:9596/client/addCartDanhSachDaDat/'+x,
						success : function(responseText) {
								$('#danhSachSanPhamDat').html(responseText);
						}
					});
					$.ajax({
						url : 'http://localhost:9596/client/showSoLuongGioHang',
						success : function(responseText) {
								$('#showSoLuong').html(responseText);
						}
					});
			},
		});
	} 
	

</script>
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- Start Main Top -->
	<div class="main-top">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

					<div class="right-phone-box">
						<p>
							Hotline :- <a href="#"> +0708821227</a>
						</p>
					</div>
					<div class="our-link">
						<c:if test="${empty customer.firstName}">
							<ul>
								<li><a
									href="${pageContext.request.contextPath}/client/login"><i
										class="fa fa-user s_color"></i> Đăng nhập</a></li>
							</ul>
						</c:if>
						<c:if test="${!empty customer.firstName}">
							<ul>
								<li><a href="#"><i class="fa fa-user s_color"></i>
										Account: ${customer.firstName} ${customer.lastName}</a></li>
								<li><a
									href="${pageContext.request.contextPath }/client/lichSuGiaoDich"><i
										class="fas fa-headset"></i>Lịch sử giao dịch</a></li>
							</ul>
						</c:if>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="login-box">
						<c:if test="${empty customer.firstName}">
							<a href="${pageContext.request.contextPath}/client/dangKy"
								style="color: white;">Đăng ký</a>
						</c:if>
						<c:if test="${!empty customer.firstName}">
							<a href="${pageContext.request.contextPath}/client/dangXuat"
								style="color: white;">Đăng xuất</a>
						</c:if>
					</div>
					<div class="text-slid-box">
						<div id="offer-box" class="carouselTicker">
							<ul class="offer-box">
								<li><i class="fab fa-opencart"></i>Cửa hàng giày</li>
								<li><i class="fab fa-opencart"></i>Hàng ngàn sản phẩm đa
									dạng</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Main Top -->

	<!-- Start Main Top -->
	<header class="main-header">
		<!-- Start Navigation -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
			<div class="container">
				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbar-menu" aria-controls="navbars-rs-food"
						aria-expanded="false" aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/client"><img
						src="${pageContext.request.contextPath }/resources/client/images/logo2.png"
						width="100px;" class="logo" alt=""></a>
				</div>
				<!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav ml-auto" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li class="nav-item active"><a class="nav-link"
							href="${pageContext.request.contextPath}/client">Trang chủ</a></li>
						<li class="dropdown "><a
							href="${pageContext.request.contextPath}/client/shop"
							class="nav-link dropdown-toggle" data-toggle="dropdown">Cửa
								hàng</a>
							<ul class="dropdown-menu">
								<c:forEach var="category" items="${listMatHang}">
									<li><a style="color: white;"
										href="${pageContext.request.contextPath}/client/shop/${category.categoryID}">${category.categoryName }</a></li>
								</c:forEach>
							</ul></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/client/lienHe">Liên
								hệ</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->

				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
						<li class="side-menu">
							<a href="#" onclick="clickMyCart()">
								<i class="fa fa-shopping-bag"></i> <span class="badge" id="showSoLuong">
									<c:if
										test="${empty countCart}">
                            		0
                            	</c:if> ${countCart}
									
								 </span>
								<p>Xem giỏ hàng</p>
							</a>
						</li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->
			</div>
			<!-- Start Side Menu -->
			<div class="side" id="startSide">
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>
				<li class="cart-box">
					<ul class="cart-list" id="ajaxGetUserServletResponse">
						<c:forEach var="productX" items="${listPro}">
							<li><a href="#" class="photo"> <img
									src="data:image/png;base64,${productX.picture }"
									class="cart-thumb" alt="Image">
							</a>
								<p>${productX.productName}</p> <br> <a
								style="color: black;"
								href="${pageContext.request.contextPath}/client/chiTietSanPham/${productX.productID}">Chi
									tiết</a> |
								<button class="cart btn hvr-hover"
									style="margin-top: -10px; color: white;"
									onclick="myFunction(this.value)" value="${productX.productID}">+
								</button> |
								<button class="cart btn hvr-hover"
									style="margin-top: -10px; color: white;"
									onclick="lowMyCartFunction(this.value,this.value)"
									value="${productX.productID}">-</button>
								<button class="cart btn"
									style="background-color: red; width: 100%; margin-top: 10px; color: white;"
									onclick="deleteMyCartFunction(this.value,this.value)"
									value="${productX.productID}">Xóa</button>
								</h6>
								<p>
									${productX.quatityInStock }x - <span class="price"><fmt:formatNumber
											type="number" maxFractionDigits="3"
											value="${productX.unitPrrice }" /> đ</span>
								</p></li>
						</c:forEach>
						<c:if test="${empty listPro}">
							<li>Chưa có sản phẩm nào</li>
						</c:if>
						<li class="total"><c:if test="${!empty countCart}">
								<a href="${pageContext.request.contextPath }/client/thanhToan"
									class="btn btn-default hvr-hover btn-cart">Thanh toán</a>
								<span class="float-right"><strong>Tổng</strong>:<fmt:formatNumber
										type="number" maxFractionDigits="3" value="${tong}" /> đ</span>
							</c:if></li>

					</ul>
				</li>
			</div>
			<!-- End Side Menu -->
		</nav>
		<!-- End Navigation -->
	</header>
	<!-- End Main Top -->

	<!-- Start Top Search -->
	<div class="top-search">
		<div class="container">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-search"></i></span>
				<input type="text" class="form-control" placeholder="Search">
				<span class="input-group-addon close-search"><i
					class="fa fa-times"></i></span>
			</div>
		</div>
	</div>
	<!-- End Top Search -->

	<!-- Start All Title Box -->
	<div class="all-title-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>Đặt hàng</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="${pageContext.request.contextPath}/client">Trang chủ</a></li>
						<li class="breadcrumb-item active">Đặt hàng</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->

	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-6 mb-3">
					<div class="checkout-address">
						<div class="title-left">
							<h3>Thông tin cá nhân</h3>
						</div>
						<form class="needs-validation" novalidate>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="firstName">First name *</label> <input
										value="${customer.firstName }" type="text"
										class="form-control" id="firstName" readonly="true">
									<div class="invalid-feedback">Valid first name is
										required.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="lastName">Last name *</label> <input type="text"
										class="form-control" id="lastName" placeholder=""
										value="${customer.lastName}" readonly="true">
									<div class="invalid-feedback">Valid last name is
										required.</div>
								</div>
							</div>
							<div class="mb-3">
								<label for="username">tên tài khoản đặt *</label>
								<div class="input-group">
									<input type="text" class="form-control" id="username"
										placeholder="" value="${customer.userName.userName}"
										readonly="true">
									<div class="invalid-feedback" style="width: 100%;">Your
										username is required.</div>
								</div>
							</div>
							<div class="mb-3">
								<label for="email">Địa chỉ *</label> <input type="email"
									class="form-control" id="email" placeholder=""
									value="${customer.address}" readonly="true">
								<div class="invalid-feedback">Please enter a valid email
									address for shipping updates.</div>
							</div>
							<div class="mb-3">
								<label for="address">thành phố *</label> <input type="text"
									value="${customer.city}" class="form-control" id="address"
									placeholder="" required readonly="true">
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>

						</form>
						<div class="row">
							<div class="col-md-12 col-lg-12">
								<div class="shipping-method-box">
									<div class="title-left">
										<h3>Hình thức giao</h3>
									</div>
									<div class="mb-4">
										<div class="custom-control custom-radio">
											<input id="shippingOption1" name="shipping-option"
												class="custom-control-input" checked="checked" type="radio">
											<label class="custom-control-label" for="shippingOption1">Giao
												tiêu chuẩn</label> <span class="float-right font-weight-bold">Miễn
												phí ship</span>
										</div>
										<div class="ml-4 mb-2 small">(1-2 ngày)</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-lg-6 mb-3" id="danhSachSanPhamDat">
					<div class="table-main table-responsive">
						<div class="title-left">
							<h3>Danh sách sản phẩm đã đặt</h3>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th>Hình</th>
									<th>tên sản phẩm</th>
									<th>giá</th>
									<th>số lượng</th>
									<th>tùy chọn</th>
									<th>xóa</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty listPro}">
									<td>
										<p>Chưa có sản phẩm nào</p>
									</td>
								</c:if>
								<c:if test="${!empty listPro}">
									<c:forEach var="productX" items="${listPro }">
										<tr>
											<td class="thumbnail-img"><a href="#"> <img
													class="img-fluid"
													src="data:image/png;base64,${productX.picture}"
													width="40px;" alt="" />
											</a></td>
											<td class="name-pr"><a href="#">
													${productX.productName} </a></td>
											<td class="price-pr">
												<p>
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${productX.unitPrrice }" />
													đ
												</p>
											</td>
											<td class="quantity-box"><input type="number" size="4"
												value="${productX.quatityInStock}" min="0"
												class="c-input-text qty text" readonly="true"></td>
											<td><button value="${productX.productID}"
												onclick='myFunction(this.value)' class="cart btn hvr-hover" style="margin-top: -10px; color: white;"
												>+</button>
												<button value="${productX.productID}"
												onclick='lowMyCartFunction(this.value)' class="cart btn hvr-hover" style="margin-top: -10px; color: white;"
												>-</button>
											<td class="remove-pr">
										<button value="${productX.productID}"
												onclick='deleteMyCartFunction(this.value,this.value)' class="cart btn hvr-hover" style="margin-top: -10px; color: white;"
												>Xóa</button>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<div class="order-box">
							<div class="d-flex">
								<div class="font-weight-bold">Sản phẩm</div>
								<div class="ml-auto font-weight-bold">Tổng</div>
							</div>
							<hr class="my-1">
							<div class="d-flex">
								<h4>Tổng cộng sản phẩm</h4>
								<div class="ml-auto font-weight-bold">
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${tong }" />
									đ
								</div>
							</div>
							<hr class="my-1">

							<div class="d-flex">
								<h4>Phí ship</h4>
								<div class="ml-auto font-weight-bold">miễn phí</div>
							</div>
							<hr>
							<div class="d-flex gr-total">
								<h5>Tổng tất cả</h5>
								<div class="ml-auto h5">
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${tong }" />
									đ
								</div>
							</div>
							<hr>
						</div>
					</div>
					<c:if test="${!empty listPro}">
						<div class="col-12 d-flex shopping-box">
							<a href="${pageContext.request.contextPath}/client/huyMua"
								class="ml-auto btn hvr-hover">Hủy mua hàng</a> <a
								href="${pageContext.request.contextPath}/client/shop"
								class="ml-auto btn hvr-hover">Tiếp tục mua</a> <a
								href="${pageContext.request.contextPath}/client/datHang"
								class="ml-auto btn hvr-hover">Thanh toán</a>
						</div>
					</c:if>
					</div>
			</div>
		</div>

	</div>
	<!-- End Cart -->
	<!-- Start Instagram Feed  -->
	<div class="instagram-box">
		<div class="main-instagram owl-carousel owl-theme">
			<div class="item">
				<div class="ins-inner-box">
					<img
						src="${pageContext.request.contextPath }/resources/client/images/d1.png"
						alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img
						src="${pageContext.request.contextPath }/resources/client/images/d2.png"
						alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img
						src="${pageContext.request.contextPath }/resources/client/images/d3.png"
						alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img
						src="${pageContext.request.contextPath }/resources/client/images/d4.png"
						alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img
						src="${pageContext.request.contextPath }/resources/client/images/d6.png"
						alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img
						src="${pageContext.request.contextPath }/resources/client/images/d7.png"
						alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Instagram Feed  -->


	<!-- Start Footer  -->
	<footer>
		<div class="footer-main">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Giờ hành chính</h3>
							<ul class="list-time">
								<li>Thứ 2 - Thứ 6: 08.00am to 05.00pm</li>
								<li>Thứ bảy: 10.00am to 08.00pm</li>
								<li>Chủ nhật: <span>mở cà ngày</span></li>
							</ul>
						</div>
					</div>

					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Liên hệ</h3>
							<ul>
								<li><a href="#"><i class="fab fa-facebook"
										aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-widget">
							<h4>Về cửa hàng chúng tôi</h4>
							<p>✓Chuyên giày</p>
							<p>✓ Đổi trả 3 ngày</p>
							<p>✓ Giao hàng tận nơi.</p>
							<p>✓ 100% Gòn Trắng</p>
							<p>✓ Bảo hành Vĩnh Viễn</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-widget">
							<h4>Thông tin</h4>
							<ul>
								<li><a style="color: white;" href="#">Về chế độ bảo
										hành</a></li>
								<li><a style="color: white;" href="#">Địa chỉ</a></li>
								<li><a style="color: white;" href="#">Chính sách giao
										hàng</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link-contact">
							<h4>Địa chỉ</h4>
							<ul>
								<li>
									<p>
										<i class="fas fa-map-marker-alt"></i>Địa chỉ: Michael I. Days
										3756 <br>Huỳnh văn nghệ,<br> KS 67213
									</p>
								</li>
								<li>
									<p>
										<i class="fas fa-phone-square"></i>Số điện thoại: <a
											href="tel:+1-888705770">+1-888 705 770</a>
									</p>
								</li>
								<li>
									<p>
										<i class="fas fa-envelope"></i>Email: <a
											href="mailto:contactinfo@gmail.com">hopTacTeddyShop@gmail.com</a>
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer  -->



	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
	<!-- End copyright  -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script
		src="${pageContext.request.contextPath }/resources/client/js/jquery.superslides.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/bootstrap-select.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/inewsticker.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/bootsnav.js."></script>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/images-loded.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/isotope.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/baguetteBox.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/form-validator.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/contact-form-script.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/client/js/custom.js"></script>
</body>
</html>