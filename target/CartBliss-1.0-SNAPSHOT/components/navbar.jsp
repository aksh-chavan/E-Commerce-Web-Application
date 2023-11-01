<%@page import="com.akshay.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");


%>

    <style>
    .custom-bg{
        background: #673ab7!important;
    }
</style>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg text-white">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">CartBliss</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a style="color: white" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
<!--                <li class="nav-item">
                    <a style="color: white" class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </li>-->
            </ul>

            
            <ul class ="navbar-nav ml-auto">
                
                <li class="nav-item">
                    <a class="nav-link disabled" href="#!" data-toggle="modal" data-target="#cart" > <i class="fa fa-cart-plus" style="font-size: 20px; color: white"> </i> <span class="ml-0 cart-items" style="color: white">( 3 )</span> </a>
                </li>
                
                <%                 if (user1 == null) {

                %>
                <li class="nav-item">
                    <a style="color: white" class="nav-link disabled" href="login.jsp" >Login</a>
                </li>
                <li class="nav-item">
                    <a style="color: white" class="nav-link disabled" href="register.jsp" >Register</a>
                </li>
                <%                    
                    } 
                    else {
                        %>
                        <li class="nav-item">
                            <a style="color: white" class="nav-link disabled" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp" %>" ><%= user1.getUserName() %></a>
                </li>
                <li class="nav-item">
                    <a style="color: white" class="nav-link disabled" href="LogoutServlet">Logout</a>
                </li>
                        <%
                    }

 
                %>
            </ul>

        </div>
    </div>
</nav>


