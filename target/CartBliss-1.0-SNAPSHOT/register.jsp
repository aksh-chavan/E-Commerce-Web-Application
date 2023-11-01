<%-- 
    Document   : register
    Created on : 28-Sep-2023, 2:19:19 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-2">
                <div class="col-md-4 offset-md-4">

                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body px-5">
                            <h3 class="text-center my-3"> Sign up here </h3>
                            <form action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter Here" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter Here" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter Here" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input name="user_mobile" type="number" class="form-control" id="phone" placeholder="Enter Here" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="address">User Address</label>
                                    <textarea name="user_address" style="height: 80px" class="form-control" placeholder="Enter your address"> </textarea>>
                                </div>
                                <div class="container text-center" >
                                    <button  class="btn btn-outline-success"> Registration </button>
                                    <button  class="btn btn-outline-warning"> Reset </button>
                                </div>


                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
