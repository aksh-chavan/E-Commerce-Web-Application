function add_to_cart(pId, pName, pPrice)
{
    let cart = localStorage.getItem("cart");
    
    if(cart==null)
    {
        // no cart yet
        let products = [];
        let product = {productId: pId, productName: pName, productQty: 1, productPrice: pPrice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        
//            console.log("Product is added first time!!!");
            showToast("Item is added to cart");
        
    }else{
        // cart is already present
        
        let pCart = JSON.parse(cart);
        
        let oldProduct = pCart.find((item) => item.productId == pId)
        if(oldProduct)
        {
            /// we have to increase quantity
            
            oldProduct.productQty = oldProduct.productQty+1;
            
            pCart.map((item) => {
                
                if(item.productId == oldProduct.productId)
                {
                    item.prouctQty = oldProduct.productQty;
                }
                
                localStorage.setItem("cart", JSON.stringify(pCart));
                
            //console.log("Product quantity is increased!!!");
            showToast(oldProduct.productName + " Quantity is increased , Quantity = " + oldProduct.productQty);
                
            })
            
        }else{
                /// we have to add product
            let product = {productId: pId, productName: pName, productQty: 1, productPrice: pPrice};
            pCart.push(product);
            localStorage.setItem("cart", JSON.stringify(pCart));
            
//            console.log("Product Addes Successfully!!!");
            showToast("Product is added to cart");

        }
    }
    updateCart();
}



/// update cart
function updateCart()
{
    let cartStr = localStorage.getItem("cart");
    let cart = JSON.parse(cartStr);
    
    if(cart==null || cart.length==0)
    {
        console.log("Cart is empty!");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3> Cart does not have items! </h3>");
//        $(".checkout-btn").addClass('disabled');  intead of thi line code we have to use --attr--
        $(".checkout-btn").attr("disabled", true);
    }else{
        
            // there is somthing in cart to show
            console.log(cart);
            $(".cart-items").html(`( ${cart.length} )`);
            
            let totalPrice=0;
            
            let table=`
                        
                 <table class="table">
                 <thead class="table-light">
        
                    <tr>
        
                        <th> Item Name </th>
                        <th> Price </th>
                        <th> Quantity </th>
                        <th> Total Price </th>
                        <th> Action </th>
        
                    </tr>
        
                 </thead>
`;


            cart.map((item) => {
                
                table +=`
                
            <tr>
                    <td> ${item.productName} </td>
                    <td> ${item.productPrice} </td>
                    <td> ${item.productQty} </td>
                    <td> ${item.productQty * item.productPrice} </td>
                    <td> <button onclick="deleteItemFromCart(${item.productId})" class="btn btn-danger btn-sm"> Remove </button> </td>
            </tr>
    `  
            totalPrice += item.productPrice * item.productQty;
            
            })

        table = table + `
            <tr>
                <td colspan='5' class="text-right font-weight-bold m-5"> Total Price : ${totalPrice}  </td>
            </tr>
</table>`
        $(".cart-body").html(table);
                $(".checkout-btn").attr("disabled", false);
                console.log("remove");

    }
    
}


// delete item 
function deleteItemFromCart(pId)
{
    // getting old cart for doing operation on it
    let cart = JSON.parse(localStorage.getItem("cart"));
    
    // this is callback function
    let newcart = cart.filter((item) => item.productId != pId);
    localStorage.setItem("cart", JSON.stringify(newcart));
    updateCart();
                showToast("Item is removed from cart");

    
}


  $(document).ready(function(){
    updateCart();
});

function showToast(content)
{
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 1800);
}

// onclick checkout button operation

function goToCheckOut()
{
    window.location = "checkOut.jsp";
}