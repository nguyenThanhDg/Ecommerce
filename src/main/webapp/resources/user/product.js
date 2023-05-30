/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/* global fetch, moment */
function loadComments(endpoint) {
    fetch(endpoint).then(function(res) {
        return res.json();
    }).then(function(data) {
        let c = document.getElementById("comments");
        let h = '';
        for (let d of data) {
            h += `
                <li class="list-group-item"><strong>${d.content}</strong> được bình luận bởi <strong>${d.customerId.lastName}</strong> vào lúc <strong>${moment(d.createdDate).locale("vi").fromNow()}</strong></li>
            `;
    }
        c.innerHTML = h;
    });
} 

function addComment(endpoint, proId) {
    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "content": document.getElementById("contentId").value,
            "productId": proId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function(res) {
        return res.json();
    }).then(function(data) {
        let d = document.querySelector("#comments li:first-child");
        let h = `
                <li class="list-group-item"><strong>${data.content}</strong> được bình luận bởi <strong>${data.customerId.lastName}</strong> vào <strong>${moment(data.createDate).locale("vi").fromNow()}</strong></li>
            `;
        d.insertAdjacentHTML("beforebegin", h);
        document.getElementById("contentId").value = "";
    });
}

function addRating(endpoint, productId) {
    var selectedSize;
    const radioB = document.querySelectorAll('input[name="myrating"]');
    for (const radioButton of radioB) {
        if (radioButton.checked) {
            selectedSize = radioButton.value;
        }
    }
    console.log(productId)
    fetch(endpoint, {
        method: 'post',
        body: JSON.stringify({
            "rate": selectedSize,
            "productId": productId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function(res) {
        
        return res.json();
    }).then(function(data) {
       console.log('Success:', data);
    });
}