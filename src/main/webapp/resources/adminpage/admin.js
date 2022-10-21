function acceptSeller(endpoint) {
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

function cancelSeller(endpoint) {
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


