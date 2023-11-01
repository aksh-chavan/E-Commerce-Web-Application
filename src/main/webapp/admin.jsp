<%@page import="com.akshay.helper.descHelper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.akshay.entities.Category"%>
<%@page import="com.akshay.dao.CategoryDao"%>
<%@page import="com.akshay.helper.FactoryProvider"%>
<%@page import="com.akshay.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login First!");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin!! You do not access this page:");
            response.sendRedirect("login.jsp");
        }
    }

%>

<% 
            CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> list = cDao.getCategories();
            
              Map<String,Long> m = descHelper.getCounts(FactoryProvider.getFactory());
          
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
           <%@include  file="components/common_modals.jsp" %>

        <!--Internal CSS-->
        <style>
            .admin .card{
                border: 1px solid #673ab7;
            }
            .admin .card:hover{
                background: #e2e2e2;
                cursor: pointer;
            }

        </style>


    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container admin"> 

            <div class="container-fluid mt-3">

                <%@include file="components/message.jsp"  %>

            </div>

            <div class="row mt-3">

                <!-- first column -->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card"> 
                        <div class="card-body text-center">

                            <div class="container">
                                <img  style="max-width: 70px" class="img-fluid rounded-circle" src="images/seo-web.png" alt="user_icon"/>
                            </div>
                            <h1> <%= m.get("userCount") %> </h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>

                </div>

                <!-- second column -->
                <div class="col-md-4">

                    <!--second box-->
                    <div class="card">
                        <div class="card-body text-center"> 
                            <div class="container">
                                <img  style="max-width: 70px" class="img-fluid rounded-circle" src="images/list.png" alt="user_icon"/>
                            </div>
                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>

                <!-- third column -->
                <div class="col-md-4">

                    <!--third box-->
                    <div class="card">
                        <div class="card-body text-center"> 
                            <div class="container">
                                <img  style="max-width: 70px" class="img-fluid rounded-circle" src="images/product.png" alt="user_icon"/>
                            </div>
                            <h1><%= m.get("productCount")%> </h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>


            </div>

            <!--second row-->
            <div class="row mt-3">

                <!--second row first-column-->
                <div class="col-md-6" data-toggle="modal" data-target="#add-category-modal">
                    <div class="card">
                        <div class="card-body text-center"> 
                            <div class="container">
                                <img  style="max-width: 70px" class="img-fluid rounded-circle" src="images/keys.png" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click here to add category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>

                <!--second row second-column-->
                <div class="col-md-6" data-toggle="modal" data-target="#add-product-modal">
                    <div class="card">
                        <div class="card-body text-center"> 
                            <div class="container">
                                <img  style="max-width: 70px" class="img-fluid rounded-circle" src="images/add.png" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click here to add categoryt</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                </div> 

            </div>

        </div>

        <!--adding category model-->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter title here" required />
                            </div>

                            <div class="form-group">
                                <textarea style= "height: 250px"; class="form-control" placeholder="Enter category description here" name="catDescription" required></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success"> Add Category </button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>

                        </form>


                    </div>
                </div>
            </div>
        </div>
        <!--end category model-->


        <!--product modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <!--start form-->
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct" />
                            
                            <!--product title-->
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter product title here" name="pTitle" required />
                            </div>

                            <!--product description-->
                             <div class="form-group">
                                <textarea style= "height: 120px"; class="form-control" placeholder="Enter product description here" name="pDescription" required></textarea>
                            </div>
                            

                            <!--product price-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter price of product " name="pPrice" required />
                            </div>

                            <!--product discount-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter discount on product " name="pDiscount" required />
                            </div>

                            <!--product quantity-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter quantity of product " name="pQty" required />
                            </div>

                            <!--product category-->

                            

                            <div class="form-group">
                                <select name="catId" class="form-control" id="">

                                    <%
                                        for (Category c : list) {
                                    %>

                                    <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%> </option>

                                    <%
                                        }
                                    %>

                                </select>
                            </div>

                            <!--product file // image-->
                            <div class="form-group">
                                <label for="pPic"> Select picture of product </label>
                                <br>
                                <input type="file" id="pPic" name="pImage" required />
                            </div>

                            <!--product button-->
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                            </div>

                        </form>
                        <!--end form-->

                        <div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!--end product modal-->

            
    </body>
</html>
