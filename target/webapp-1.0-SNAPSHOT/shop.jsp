
<%@page import="com.mycompany.webapp.entities.Category"%>
<%@page import="com.mycompany.webapp.dao.CategoryDao"%>
<%@page import="com.mycompany.webapp.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.webapp.dao.ProductDao"%>
<%@page import="com.mycompany.webapp.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap" rel="stylesheet">
        <title>Main Page</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="row">
            <% 
                String cat=request.getParameter("category");
                if(cat==null){
                    cat="all";
                }
                ProductDao dao=new ProductDao(FactoryProvider.getFactory());
                List<Product> list=null;
                if(cat.trim().equals("all")){
                    list=dao.getAllProducts();
                }else{
                    int cid=Integer.parseInt(cat.trim());
                    list=dao.getAllProductsById(cid);
                }
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist=cdao.getCategories();

            %>
            <div class="col-lg-3 p-5">
                <div class="shop__sidebar">
                    <div class="shop__sidebar__accordion">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-heading">
                                    <a href="shop.jsp?category=all">Categories</a>
                                </div>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__categories">
                                            <ul class="nice-scroll">
                                                <% 
                                                    for(Category category:clist){
                                                %>

                                                <li><a href="shop.jsp?category=<%=category.getCategoryId() %>"><%= category.getCategoryTitle()%></a></li><br>
                                                <%
                                                        }
                                                %>
  
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 p-5">
                <div class="row">
                    <% 
                        for(Product product:list){
                    %>
                    <div class="col-lg-4 col-md-6 col-sm-6">
 
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/<%=product.getpPhoto() %>">
                                    <ul class="product__hover">
                                        <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                        <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a>
                                        </li>
                                        <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><%= product.getpName() %></h6>
                                    <a href="AddToCartServlet?id=<%=product.getpId()%>" class="add-cart">+ Add To Cart</a>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <h5>&#8377;<%= product.getPriceAfterApplyingDiscount()%><span style="font-size: 12px !important; font-style: italic !important; color: grey;text-decoration: line-through!important"><%= product.getpPrice() %> <%=product.getpDiscount() %>% off</span></h5>
                                </div>
                            </div>

                        </div>
                    <%
                        }
                        if(list.size()==0){
                            out.println("<h3>No items in this category</h3>");
                        }
                    %>
                </div>
                
            </div>
        </div>
            
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