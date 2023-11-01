<%--<%@page import="com.sun.tools.attach.VirtualMachine"%>
<%@page import="java.rmi.Naming"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.util.Enumeration"%>--%>

<%@page import="com.akshay.helper.descHelper"%>
<%@page import="com.akshay.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.akshay.entities.Product"%>
<%@page import="com.akshay.dao.ProductDao"%>
<%@page import="com.akshay.dao.CategoryDao"%>
<%@page import="com.akshay.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CartBliss Home</title>
        <%@include file="components/common_css_js.jsp" %>
        

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/script.js">  </script>


        
        
        
        <style>
            .list-group-item.active{
                background: #673ab7!important;
                border-color: #673ab7!important;
            }
            .discount-lable{
                font-size: 13px;
                font-style: italic;
            }
            .product-card:hover{
                background: #e2e2e2;
                cursor: pointer;
            }
            .cat-card:hover{
                background: #e2e2e2;
                cursor: pointer;
            }
        </style>
    </head>
    <body>

<!--        <script src="js/script.js"> 
        </script>-->
        
        
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">
        <!--//// one row and two column-->
        <div class="row mt-3 mx-2">

            <%                
                String cat = request.getParameter("category");
//                out.println(cat);             
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                
                List<Product> list = null;
                
//                List<Product> list = dao.getAllProducts();
                if(cat==null)
                {
                    list = dao.getAllProducts();
                }
                else if(cat.trim().equals("all")) 
                {
//                        cat = "all";
                     list = dao.getAllProducts();
                }else{
                    int cid = Integer.parseInt(cat.trim());
                    list = dao.getAllProductsById(cid);
                    }
                
                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cDao.getCategories();
            %>

            <!--column 1 need 2 greeds  in this col we r going to show all categories-->
            <div class="col-md-2">

                <div class="list-goup mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Categories
                    </a>

                    <%
                        for (Category category : clist) {
                    %>

                    <a href="index.jsp?category=<%= category.getCategoryId() %>" class="list-group-item list-group-item-action cat-card"> <%= category.getCategoryTitle()%> </a>
                    <%
                        }
                    %>
                </div>
            </div>
            <!--col 2 need 8 greeds in this column we are going to show all products--> 
            <div class="col-md-10">

                <div class="row mt-4">

                    <!--col - 12-->
                    <div class="col md-12">

                        <div class="card-columns">

                            <%
//                                List<Product> list = null;
                                for(Product p : list ) {
                            %>

                                <!--product card-->
                            <div class="card product-card">
                                
                                <div class="container text-center">
                                <img src="images/products_imgs/<%= p.getpPhoto() %>" style="max-height: 200px; max-width: 100; width: auto" class="card-img-top" alt="nahi aari na">
                                </div>
                                <div class="card-body">                              
                                    
                                    <h5 class="card-titles"> <%= p.getpName()%> </h5>
                                    <p class="card-text">
                                        <%= descHelper.get10Words(p.getpDesc())%> 
                                    </p>
                                </div>

                                <div class="card-footer text-center">
                                    <button class="btn custom-bg text-white"  onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName() %>', <%= p.getPriceAfterApplyingDiscount() %>)"> Add To Cart  </button>
                                    <button class="btn btn-outline-success">&#8377; <%= p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-lable">&#8377; <%= p.getpPrice() %> , <%= p.getpDiscount() %> % Off </span> </button>

                                </div>    

                            </div>

                            <%
                                }

                                if(list.size() == 0)
                                {
                                        out.println("No item in this catgeory");
                                }
                                
                            %>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        </div>
                            <%@include  file="components/common_modals.jsp" %>
    </body>
</html>
