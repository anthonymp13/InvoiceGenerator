$(document).ready(function() {
    let max_fields      = 10;
    let wrapper         = $("#table");
    let add_button      = $(".add_form_field");
    let submit_button   = $("#submit");



    let x = 1;

    $(document).on("change", function(e){
        let tr = $(".descriptionRow");

        let price    =  Array.prototype.slice.call(document.querySelectorAll(".unitPrice"));
        let quantity =  Array.prototype.slice.call(document.querySelectorAll(".quantity"));
        let amount   = Array.prototype.slice.call(document.querySelectorAll(".amount"));

        console.log(amount);

        // Get that rows price & quantity
        for (i = 0; i < tr.length; i++) {
            // let total = "0";

            // if (price[i].value == "" && quantity[i].value != "") {
            //     total = price[i].value;
            // }

            // if (price[i].value != "" && quantity[i].value == "") {
            //     total = price[i].value;
            // }

            let total = price[i].value * quantity[i].value;


            // console.log(total);
            amount[i].innerHTML = total;
        }

    });




    $(submit_button).click(function(e){
        let descriptionNodes = $(".description");
        let descriptions     = Array.prototype.slice.call(descriptionNodes);

        descriptions.map(x => x.value);

        console.log(descriptions.map(x => x.value));
    });


    $(add_button).click(function(e){
        e.preventDefault();
        if(x < max_fields){
            x++;1
            $(wrapper).append('<tr class="descriptionRow"><td><input type="text" class="description" name="mytext[]"/></td><td><input class="quantity" type="text" name="mytext[]"/></td><td><input type="text" class="unitPrice" name="mytext[]"/></td><td><p class="amount"></p></td><td><a href="#" class="delete">Delete</a><td></tr>'); //add input box
        } else {
            alert('You Reached the limits')
        }
    });

    $(wrapper).on("click",".delete", function(e){
        let td = $(this).parent("td");
        e.preventDefault(); td.parent("tr").remove(); x--;
    });

    $().on("change")
});