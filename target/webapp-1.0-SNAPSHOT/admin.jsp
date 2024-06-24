<%@page import="java.util.List"%>
<%@page import="com.mycompany.webapp.entities.Category"%>
<%@page import="com.mycompany.webapp.dao.CategoryDao"%>
<%@page import="com.mycompany.webapp.helper.FactoryProvider"%>
<%@page import="com.mycompany.webapp.entities.User"%>
<% 

    User user =(User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in!! Log in first");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(user.getUserType().equals("normal")){
            session.setAttribute("message", "You are not admin!!You can't access this page");
            response.sendRedirect("login.jsp");   
        }
    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <title>Admin Page</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div>
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-4">
               
                <div  class="col-md-4">
                    <div style="background-color: #e8ebf5" class="card">
                       
                        <div  class="card-body text-center">
                            <div  class="container">
                                <img style="max-width: 80px;" class="img-fluid" src="img/icon/multiple-users-silhouette.png">
                            </div>
                            <h1 style="font-size: 30px">435</h1>
                             <h1 style="font-size: 30px;color: #af440a" class="text-uppercase " >Users</h1>
                        </div>
                    </div>
                </div>
                
                 <div class="col-md-4">
                     <div style="background-color: #f0eff5" class="card">

                         <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 80px;" class="img-fluid" src="img/icon/application.png">
                            </div>
                             <h1 style="font-size: 30px">6347</h1>
                             <h1 style="font-size: 30px;color: #af440a" class="text-uppercase">Category</h1>
                         </div>
                     </div>
                </div>
            
                 <div class="col-md-4">
                    <div style="background-color: #e8ebf5" class="card">
                        
                         <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 80px;" class="img-fluid" src="img/icon/order.png">
                            </div>
                             <h1 style="font-size: 30px">435</h1>
                             <h1 style="font-size: 30px;color: #af440a" class="text-uppercase " >Products</h1>
                         </div>
                     </div>       
                </div>
            </div>
            <div class="row mt-3" >
                <div class="col-md-6" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                     <div style="background-color: #f0eff5" class="card" >
                        
                         <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 80px;" class="img-fluid" src="img/icon/category.png">
                            </div>
                             <p>click here to add new category</p>
                             <h1 style="font-size: 30px;color: #af440a" class="text-uppercase " >Add category</h1>
                         </div>
                     </div>
                </div>
                
                <div class="col-md-6" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                     <div style="background-color: #e8ebf5" class="card">
                         <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 80px;" class="img-fluid" src="img/icon/add-product.png">
                            </div>
                             <p>click here to add new products</p>
                             <h1 style="font-size: 30px; color: #af440a" class="text-uppercase " >Add Products</h1>
                         </div>
                     </div>
                </div>
            </div>
        </div>
        
        <!--Add category model-->
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                  <form action="ProductOperationServlet" method="post">
                      <input type="hidden" name="operation" value="addcategory"/>
                      <div class="form-group">
                          <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />
                                                    
                      </div>
                      <div class="form-group">
                          <textarea style="height:250px;" class="form-control" name="catDescription" placeholder="Enter category description" required></textarea>
                      </div>
                      
                      <div class="container text-center">
                          <button class="btn btn-outline-success">Add category</button>
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      </div>
                  </form>
              </div>

            </div>
          </div>
        </div>
        
        <!--End of category model-->

        <!-- add-product-form -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog model-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <!--form-->
                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                        
                        <input type="hidden" name="operation" value="addproduct"/>
                        <!-- product-title -->
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required>
                        </div>
                        <!-- product-details -->
                        <div class="form-group">
                            <textarea style="height:150px;" class="form-control" placeholder="Enter product details" name="pDesc"></textarea>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Enter product Discount" name="pDiscount" required>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Enter product Quantity" name="pQuantity" required>
                        </div>
                        <% 
                            CategoryDao cDao= new CategoryDao(FactoryProvider.getFactory());
                            List<Category> list=cDao.getCategories();
                        %>
                        <div class="form-group">
                            <select name="catId" class="form-control">
                                <% 
                                    for(Category c: list){
                                %>
                                <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                <%} %>

                            </select>
                        </div>
                        <div class="form-group">
                            <label for="pPic">Select Picture of Product</label>
                            <br>
                            <input type="file" id="pPic" name="pPic" required/>
                        </div>
                        <div class="container text-center">
                            <button class="btn-btn-outline-success">Add Product</button>
                        </div>
                    </form>


                    <!--form-end -->
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>


        
        
    </body>
</html>
