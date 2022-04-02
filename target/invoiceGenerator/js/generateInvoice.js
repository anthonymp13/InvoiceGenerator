$(document).ready(function() {
    let max_fields      = 10;
    let wrapper         = $("#items");
    let add_button      = $("#saveChanges");
    let submit_button   = $("#submit");
    let product         = $(".product");
    let x               = 0;


    $(product).click(function(e){
        console.log("Working");
        let selected = document.querySelectorAll(".selected");
        console.log(selected);
        if(selected[0]) selected[0].classList.remove("selected");
        e.target.parentNode.classList.add("selected");


    });


    $(document).on("change", function(e){
        let tr = $(".descriptionRow");

        let price    =  Array.prototype.slice.call(document.querySelectorAll(".unitPrice"));
        let quantity =  Array.prototype.slice.call(document.querySelectorAll(".quantity"));
        let amount   =  Array.prototype.slice.call(document.querySelectorAll(".amount"));

        console.log(amount);

        // Get that rows price & quantity
        for (i = 0; i < tr.length; i++) {

            let total = price[i].value * quantity[i].value;

            // console.log(total);
            amount[i].innerHTML = total;
        }

    });


    $(submit_button).click(function(e){
        select();
        let descriptionNodes = $(".description");
        let descriptions     = Array.prototype.slice.call(descriptionNodes);

        descriptions.map(x => x.value);

        console.log(descriptions.map(x => x.value));
    });


    $(add_button).click(function(e){

        e.preventDefault();
        if(x < max_fields){
            x++;

            let description = document.querySelector("#description").value;
            let quantity = document.querySelector("#quantity").value;
            let unitPrice = document.querySelector("#unitPrice").value;


            $(wrapper).append(`<tr class="product">` +
                                `<td><input type="text" class="description" name="description" value="${description}"/></td>` +
                                `<td><input class="quantity" type="text" name="quantity" value="${quantity}"/></td>` +
                                `<td><input type="text" class="unitPrice" name="unitPrice" value="${unitPrice}"/></td>` +
                                // '<td><p class="amount"></p></td>' +
                                `<td><a href="#" class="delete">Delete</a><td>` +
                               `</tr>`);


            // $(wrapper).append('<tr class="descriptionRow">' +
            //     '<td class="description"></td>' +
            //     '<td class="quantity"></td>' +
            //     '<td class="unitPrice"></td>' +
            //     '</tr>');

        } else {
            alert('Maximum number of products added');
        }
    });

    $(wrapper).on("click",".delete", function(e){
        let td = $(this).parent("td");
        e.preventDefault(); td.parent("tr").remove(); x--;
    });


    $().on("change")
});





