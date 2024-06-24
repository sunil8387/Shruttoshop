<%@page import="com.mycompany.webapp.helper.FactoryProvider"%>
<%@page import="com.mycompany.webapp.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.webapp.entities.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.webapp.entities.User"%>
<%
  
       User user1 =(User)session.getAttribute("current-user");
       

    if (user1 != null) {
        request.setAttribute("person", user1);
    }
    ArrayList<Cart> cart_list1 = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct1 = null;
    if (cart_list1 != null) {
            ProductDao pDaoo = new ProductDao(FactoryProvider.getFactory());
            cartProduct1 = pDaoo.getCartProducts(cart_list1);
            request.setAttribute("cart_list", cart_list1);
    }   
    int numberOfCartItem=0;
    if(cartProduct1!=null){
        numberOfCartItem=cartProduct1.size();
    }
%>

<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>Free shipping, 30-day return or refund.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                                <%
                                    if(user1==null){
                                %>
                                <a href="login.jsp">Sign in</a>
                                <a href="register.jsp">Register</a>
                                <%
                                    }else{
                                %>
                                <a href="#"><%= user1.getUsername() %></a>
                                <a href="LogoutServlet">Logout</a>
                                <%
                                    }
                                %>
                                <a href="#">FAQs</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="index.jsp"><img src="img/nlogo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="shop.jsp">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="about_us.jsp">About Us</a></li>
                                    <li><a href="#">Shop Details</a></li>
                                    <li><a href="#">Shopping Cart</a></li>
                                    <li><a href="#">Check Out</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.jsp">Contacts</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#"><img src="img/icon/heart.png" alt=""></a>
                        <a href="cart.jsp"><img src="img/icon/cart.png" alt=""> <span class="cart-items"><%=numberOfCartItem%></span></a>
                        <div class="price">$0.00</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>