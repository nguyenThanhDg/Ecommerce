/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function delProduct(endpoint) {
    if (confirm("Ban chac chan xoa san pham nay khong?") === true) {
        fetch(endpoint, {
            method: "delete"
        }).then(function (res) {
            if (res.status === 204)
                location.reload();
        }).catch(function (err) {
            console.error(err);
        });
    }
}

function pauseProduct(endpoint) {
    if (confirm("Ban chac chan tam ngung ban san pham nay khong?") === true) {
        fetch(endpoint, {
            method: "post"
        }).then(function (res) {
            
            if (res.status === 200)
                location.reload();
        }).catch(function (err) {
            console.error(err);
        });
    }
}
