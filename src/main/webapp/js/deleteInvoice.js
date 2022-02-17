// Sends POST Request to DeleteInvoice Servlet with invoice id
$(document).ready(function(){
    $("#confirmDelete").click(function(){
        $.post("DeleteInvoice",
            {
                "invoiceId":"38"
            });
    });
});

// Set URL param to local variable
let param = $.urlParam('invoiceId');
console.log(param);


//  Get parameter from url
$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null) {
        return null;
    }
    return decodeURI(results[1]) || 0;
}