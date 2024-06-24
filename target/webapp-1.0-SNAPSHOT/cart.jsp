
<%@page import="com.mycompany.webapp.helper.FactoryProvider"%>
<%@page import="com.mycompany.webapp.dao.ProductDao"%>
<%@page import="com.mycompany.webapp.entities.Cart"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User auth = (User) request.getSession().getAttribute("current-user");
    if (auth != null) {
        request.setAttribute("person", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    double total=0;
    if (cart_list != null) {
            ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
            cartProduct = pDao.getCartProducts(cart_list);
            total = pDao.getTotalCartPrice(cart_list);
            request.setAttribute("total", total);
            request.setAttribute("cart_list", cart_list);
    }   
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap" rel="stylesheet">
        <title>Shopping Cart</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <!-- Shopping Cart Section Begin -->
        <section class="shopping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="shopping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    if (cart_list != null) {  
					for (Cart c : cartProduct) {                                           
                                    %>
                                    <tr>
                                        <td class="product__cart__item">
                                            <div class="product__cart__item__pic">
                                                <img src="img/product/<%=c.getpPhoto()%>" alt="">
                                            </div>
                                            <div class="product__cart__item__text">
                                                <h6><%= c.getpName() %></h6>
                                                <h5>&#8377;<%=c.getPriceAfterApplyingDiscount() %></h5>
                                            </div>
                                        </td>
                                        <td class="quantity__item">
                                            <div class="quantity">
                                                <div class="pro-qty-2">
                                                    <a href="QuantityIncDecServlet?action=dec&id=<%=c.getpId()%>" class="fa fa-angle-left dec qtybtn"></a>
                                                    <input type="text" value="<%=c.getQuantity() %>">
                                                    <a href="QuantityIncDecServlet?action=inc&id=<%=c.getpId()%>" class="fa fa-angle-right inc qtybtn"></a>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="cart__price">&#8377; <%=c.getPriceAfterApplyingDiscount()*c.getQuantity() %></td>
                                        <td class="cart__close"><a href="#"><i class="fa fa-close"></i></a></td>
                                    </tr>
                                    <%
                                    }}%>
                                    
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="continue__btn">
                                    <a href="shop.jsp">Continue Shopping</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart__discount">
                            <h6>Discount codes</h6>
                            <form action="#">
                                <input type="text" placeholder="Coupon code">
                                <button type="submit">Apply</button>
                            </form>
                        </div>
                        <div class="cart__total">
                            <h6>Cart total</h6>
                            <ul>
                                <li>Total <span><%= total %></span></li>
                            </ul>
                            <a href="#" class="primary-btn">Proceed to checkout</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shopping Cart Section End -->
        <%@include file="components/footer.jsp" %>    
        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        </body>
</html>
