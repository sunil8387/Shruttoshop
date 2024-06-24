function add_to_cart(pid,pname,price){
    let cart=localStorage.getItem("cart");
    
    if(cart==null){
        let products=[];
        let product={productId:pid,productName:pname,productQuantity:1,productPrice:price};
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        console.log("product is added for the first time");
    }
    else{
        let pcart=JSON.parse(cart);
        let oldproduct=pcart.find((item)=>item.productId==pid)
        if(oldproduct){
            oldproduct.productQuantity=oldproduct.productQuantity+1;
            pcart.map((item)=>{
                if(item.productId==oldproduct.productId){
                    item.productQuantity=oldproduct.productQuantity;
                }
            })
             localStorage.setItem("cart",JSON.stringify(pcart));
            console.log("quantity is increased")
        }
        else{
            let product={productId:pid,productName:pname,productQuantity:1,productPrice:price};
            pcart.push(product);
            localStorage.setItem("cart",JSON.stringify(pcart));
            console.log("product is added");
        }
    }
}