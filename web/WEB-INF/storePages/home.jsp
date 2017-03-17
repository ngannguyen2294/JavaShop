<%-- 
    Document   : home
    Created on : Mar 14, 2017, 8:44:49 AM
    Author     : luan.nt
--%>
<!DOCTYPE html>
<html lang="en">
    <head>

    </head>
    <body>
        <!--header-->
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="banner.jsp"></jsp:include>
            <div id="undefined-sticky-wrapper" class="sticky-wrapper" style="height: 60px;">
                <div class="mainmenu-area">
                    <div class="container">
                        <div class="row">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div> 
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="http://localhost:8080/J2eeShop/shop.htm">Home</a></li>
                                    <li><a href="http://localhost:8080/J2eeShop/shop.htm">Shop page</a></li>
                                    <li><a href="https://www.freshdesignweb.com/demo/template/ustora/single-product.htm">Single product</a></li>
                                    <li><a href="https://www.freshdesignweb.com/demo/template/ustora/cart.htm">Cart</a></li>
                                    <li><a href="https://www.freshdesignweb.com/demo/template/ustora/checkout.htm">Checkout</a></li>
                                    <li><a href="https://www.freshdesignweb.com/demo/template/ustora/index.htm#">Category</a></li>
                                    <li><a href="https://www.freshdesignweb.com/demo/template/ustora/index.htm#">Others</a></li>
                                    <li><a href="https://www.freshdesignweb.com/demo/template/ustora/index.htm#">Contact</a></li>
                                </ul>
                            </div>  
                        </div>
                    </div>
                </div>
            </div> <!-- End mainmenu area -->

            <div class="slider-area">
                <!-- Slider -->
                <div class="block-slider block-slider4">
                    <ul class="" id="bxslider-home4">
                        <li>
                            <img src="img/h4-slide.png" alt="Slide">
                            <div class="caption-group">
                                <h2 class="caption title">
                                    iPhone <span class="primary">6 <strong>Plus</strong></span>
                                </h2>
                                <h4 class="caption subtitle">Dual SIM</h4>
                                <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            </div>
                        </li>
                        <li><img src="img/h4-slide2.png" alt="Slide">
                            <div class="caption-group">
                                <h2 class="caption title">
                                    by one, get one <span class="primary">50% <strong>off</strong></span>
                                </h2>
                                <h4 class="caption subtitle">school supplies & backpacks.*</h4>
                                <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            </div>
                        </li>
                        <li><img src="img/h4-slide3.png" alt="Slide">
                            <div class="caption-group">
                                <h2 class="caption title">
                                    Apple <span class="primary">Store <strong>Ipod</strong></span>
                                </h2>
                                <h4 class="caption subtitle">Select Item</h4>
                                <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            </div>
                        </li>
                        <li><img src="img/h4-slide4.png" alt="Slide">
                            <div class="caption-group">
                                <h2 class="caption title">
                                    Apple <span class="primary">Store <strong>Ipod</strong></span>
                                </h2>
                                <h4 class="caption subtitle">& Phone</h4>
                                <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- ./Slider -->
            </div> <!-- End slider area -->

            <div class="promo-area">
                <div class="zigzag-bottom"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="single-promo promo1">
                                <i class="fa fa-refresh"></i>
                                <p>30 Days return</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="single-promo promo2">
                                <i class="fa fa-truck"></i>
                                <p>Free shipping</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="single-promo promo3">
                                <i class="fa fa-lock"></i>
                                <p>Secure payments</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="single-promo promo4">
                                <i class="fa fa-gift"></i>
                                <p>New products</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End promo area -->

            <div class="maincontent-area">
                <div class="zigzag-bottom"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="latest-product">
                                <h2 class="section-title">Latest Products</h2>
                                <div class="product-carousel">
                                    <div class="single-product">
                                        <div class="product-f-image">
                                            <img src="img/product-1.jpg" alt="">
                                            <div class="product-hover">
                                                <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                <a href="single-product.htm" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                            </div>
                                        </div>
                                        <h2><a href="single-product.htm">Samsung Galaxy s5- 2015</a></h2>
                                        <div class="product-carousel-price">
                                            <ins>$700.00</ins> <del>$100.00</del>
                                        </div> 
                                    </div>

                                    <div class="single-product">
                                        <div class="product-f-image">
                                            <img src="img/product-2.jpg" alt="">
                                            <div class="product-hover">
                                                <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                <a href="single-product.htm" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                            </div>
                                        </div>

                                        <h2>Nokia Lumia 1320</h2>
                                        <div class="product-carousel-price">
                                            <ins>$899.00</ins> <del>$999.00</del>
                                        </div> 
                                    </div>

                                    <div class="single-product">
                                        <div class="product-f-image">
                                            <img src="img/product-3.jpg" alt="">
                                            <div class="product-hover">
                                                <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                <a href="single-product.htm" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                            </div>
                                        </div>
                                        <h2>LG Leon 2015</h2>
                                        <div class="product-carousel-price">
                                            <ins>$400.00</ins> <del>$425.00</del>
                                        </div>                                 
                                    </div>

                                    <div class="single-product">
                                        <div class="product-f-image">
                                            <img src="img/product-4.jpg" alt="">
                                            <div class="product-hover">
                                                <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                <a href="single-product.htm" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                            </div>
                                        </div>
                                        <h2><a href="single-product.htm">Sony microsoft</a></h2>
                                        <div class="product-carousel-price">
                                            <ins>$200.00</ins> <del>$225.00</del>
                                        </div>                            
                                    </div>

                                    <div class="single-product">
                                        <div class="product-f-image">
                                            <img src="img/product-5.jpg" alt="">
                                            <div class="product-hover">
                                                <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                <a href="single-product.htm" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                            </div>
                                        </div>
                                        <h2>iPhone 6</h2>
                                        <div class="product-carousel-price">
                                            <ins>$1200.00</ins> <del>$1355.00</del>
                                        </div>                                 
                                    </div>

                                    <div class="single-product">
                                        <div class="product-f-image">
                                            <img src="img/product-2.jpg" alt="">
                                            <div class="product-hover">
                                                <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                <a href="single-product.htm" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                            </div>
                                        </div>
                                        <h2><a href="single-product.htm">Samsung gallaxy note 4</a></h2>
                                        <div class="product-carousel-price">
                                            <ins>$400.00</ins>
                                        </div>                            
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End main content area -->

            <div class="brands-area">
                <div class="zigzag-bottom"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="brand-wrapper">
                                <div class="brand-list">
                                    <img src="img/brand1.png" alt="">
                                    <img src="img/brand2.png" alt="">
                                    <img src="img/brand3.png" alt="">
                                    <img src="img/brand4.png" alt="">
                                    <img src="img/brand5.png" alt="">
                                    <img src="img/brand6.png" alt="">
                                    <img src="img/brand1.png" alt="">
                                    <img src="img/brand2.png" alt="">                            
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End brands area -->

            <div class="product-widget-area">
                <div class="zigzag-bottom"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="single-product-widget">
                                <h2 class="product-wid-title">Top Sellers</h2>
                                <a href="" class="wid-view-more">View All</a>
                                <div class="single-wid-product">
                                    <a href="single-product.htm"><img src="img/product-thumb-1.jpg" alt="" class="product-thumb"></a>
                                    <h2><a href="single-product.htm">Sony Smart TV - 2015</a></h2>
                                    <div class="product-wid-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-wid-price">
                                        <ins>$400.00</ins> <del>$425.00</del>
                                    </div>                            
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="single-product-widget">
                                <h2 class="product-wid-title">Recently Viewed</h2>
                                <a href="#" class="wid-view-more">View All</a>
                                <div class="single-wid-product">
                                    <a href="single-product.htm"><img src="img/product-thumb-4.jpg" alt="" class="product-thumb"></a>
                                    <h2><a href="single-product.htm">Sony playstation microsoft</a></h2>
                                    <div class="product-wid-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-wid-price">
                                        <ins>$400.00</ins> <del>$425.00</del>
                                    </div>                            
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="single-product-widget">
                                <h2 class="product-wid-title">Top New</h2>
                                <a href="#" class="wid-view-more">View All</a>
                                <div class="single-wid-product">
                                    <a href="single-product.htm"><img src="img/product-thumb-3.jpg" alt="" class="product-thumb"></a>
                                    <h2><a href="single-product.htm">Apple new i phone 6</a></h2>
                                    <div class="product-wid-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-wid-price">
                                        <ins>$400.00</ins> <del>$425.00</del>
                                    </div>                            
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End product widget area -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
