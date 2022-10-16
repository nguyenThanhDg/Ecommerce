/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/* global fetch */



function addToCart(endpoint, productId, productName, price, image) {
    event.preventDefault();
    fetch(endpoint, {
        method: 'post',
        body: JSON.stringify({
            "productId": productId,
            "productName": productName,
            "price": price,
            "image": image,
            "quantity": 1
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        console.log(data);
        let counter = document.getElementById("cartCounter");
        counter.innerText = data.quantity;
        let total = document.getElementById("cartTotal");
        total.innerText = data.total;

    });
}

function updateCart(endpoint, obj, productId) {
    fetch(endpoint, {
        method: "put",
        body: JSON.stringify({
            "productId": productId,
            "productName": "",
            "price": 0,
            "quantity": obj.value
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        let quantity = document.getElementById("cartCounter");
        quantity.innerText = data.quantity;
        let total = document.getElementById("totalCart");
        total.innerText = data.total;
        let total2 = document.getElementById("cartTotal");
        total2.innerText = data.total;
    });
}

function deleteCartItem(productId) {
    if (confirm("Ban chac chan xoa san pham nay khong?") === true) {
        fetch(`/Ecommerce/api/cart/${productId}`, {
            method: "delete"
        }).then(function (res) {
            return res.json();
        }).then(function (data) {
            let quantity = document.getElementById("cartCounter");
            quantity.innerText = data.quantity;
            let total = document.getElementById("totalCart");
            total.innerText = data.total;
            let total2 = document.getElementById("cartTotal");
            total2.innerText = data.total;
            let row = document.getElementById(`productId${productId}`);
            row.style.display = "none";
        });
    }
}

function pay(endpoint) {
    event.preventDefault();
    if (confirm("Ban chac chan thanh toan?") === true) {
        fetch(endpoint, {
            method: "post"
        }).then(function (res) {
            return res;
        }).then(function (code) {
            console.info(code);
            location.reload();
        });
        alert("Bạn đã mua hàng thành công");
    } else
        alert("Bạn chưa đặt hàng!!!");
}

function commitOrder(endpoint) {
    event.preventDefault();
    fetch(endpoint, {
        method: "post"
    }).then(function (res) {
        return res;
    }).then(function (code) {
        console.info(code);
        location.reload();
    })
}

function cancelOrder(endpoint) {
    event.preventDefault();
    fetch(endpoint, {
        method: "post"
    }).then(function (res) {
        return res;
    }).then(function (code) {
        console.info(code);
        location.reload();
    })
}


