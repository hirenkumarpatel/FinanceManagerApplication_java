$("document").ready(function () {
    //alert("ajax called");
    var subtotal1=0;
    var subtotal=0;
    var total=0;
    $("#account").click(function (e) {
        // $("#loading").show;
        e.preventDefault();
        $.ajax({
            url: "reports/transactions/account/I",
            method: "get",
            dataType: 'json',
            success: function (data)
            {
                // $("#loading").hide();
                
                console.log(data);
                //$("#ajax-table-body").html("");
                $("#ajax-div").hide();
                $("#ajax-table-head").html("<tr><td>Account</td><td>Category</td><td>Amount</td></tr>");
                $.each(data, function (index, value) {
                    subtotal1=(+subtotal1+ +value.amount);
                    if(value.amount=="")
                    {
                        value.amount="0";
                    }
                    var newData = $("<tr><td>" + value.accountName + "</td><td>" + value.categoryName + "</td><td>$"+value.amount+"</td></tr>");
                    $("#ajax-div").show();
                    $("#ajax-table-body").append(newData);
                });
                $("#ajax-table-body").append("<tr class='active'><th colspan='2'>Total Income</th><th>$"+subtotal1+"</th></tr>");
                total=+subtotal1- +subtotal;
                ("#ajax-table-footer").html("<tr class='active'><th colspan='2'>Net Amount </th ><th>$"+total+"</th></tr>"); 

            }

        });
    });
    
    $("#account").click(function (e) {
        // $("#loading").show;
        e.preventDefault();
        $.ajax({
            url: "reports/transactions/account/E",
            method: "get",
            dataType: 'json',
            success: function (data)
            {
                // $("#loading").hide();
                
                console.log(data);
               // $("#ajax-div").hide();
                $("#ajax-table-head").html("<tr><td>Account</td><td>Category</td><td>Amount</td></tr>");
                $.each(data, function (index, value) {
                    subtotal=(+subtotal+ +value.amount);
                    if(value.amount=="")
                    {
                        value.amount="0";
                    }
                    var newData = $("<tr><td>" + value.accountName + "</td><td>" + value.categoryName + "</td><td>$"+value.amount+"</td></tr>");
                    $("#ajax-div").show();
                    $("#ajax-table-body").append(newData);
                });
                $("#ajax-table-body").append("<tr class='active'><th colspan='2'>Total Expense</th><th>$"+subtotal+"</th></tr>");
                total= +subtotal1- +subtotal; 
            $("#ajax-table-footer").html("<tr class='active'><th colspan='2'>Net Amount </th ><th>$"+total+"</th></tr>"); 

            }

        });
        
        
    });
    
    
    
    // date wise report
    
    $("#date-report").click(function (e) {
        // $("#loading").show;
       var subtotal1=0;
   
        var total=0;
        e.preventDefault();
        $.ajax({
            url: "reports/transactions/date/I",
            method: "get",
            dataType: 'json',
            success: function (data)
            {
                // $("#loading").hide();
                 $("#ajax-table-body").html("");
                console.log(data);
                 $("#ajax-table-head").html("<tr><td>Date</td><td>Account</td><td>Category</td><td>Amount</td></tr>");
                $("#ajax-div").hide();
                $.each(data, function (index, value) {
                    subtotal1=(+subtotal1+ +value.amount);
                    if(value.amount=="")
                    {
                        value.amount="0";
                    }
                    var newData = $("<tr><td>"+value.date+"</td><td>" + value.accountName + "</td><td>" + value.categoryName + "</td><td>$"+value.amount+"</td></tr>");
                    $("#ajax-div").show();
                    $("#ajax-table-body").append(newData);
                });
                $("#ajax-table-body").append("<tr class='active'><th colspan='3'>Total Income</th><th>$"+subtotal1+"</th></tr>");
                total=+subtotal1- +subtotal;
                ("#ajax-table-footer").html("<tr class='active'><th colspan='3'>Net Amount </th ><th>$"+total+"</th></tr>"); 

            }

        });
    });
    
    $("#date-report").click(function (e) {
        // $("#loading").show;
         //var subtotal1=0;
        var subtotal=0;
         var total=0;
        e.preventDefault();
        $.ajax({
            url: "reports/transactions/date/E",
            method: "get",
            dataType: 'json',
            success: function (data)
            {
                // $("#loading").hide();
                
                console.log(data);
                
                $("#ajax-table-head").html("<tr><td>Date</td><td>Account</td><td>Category</td><td>Amount</td></tr>");
               // $("#ajax-div").hide();
                $.each(data, function (index, value) {
                    subtotal=(+subtotal+ +value.amount);
                    if(value.amount=="")
                    {
                        value.amount="0";
                    }
                    var newData = $("<tr><td>"+value.date+"</td><td>" + value.accountName + "</td><td>" + value.categoryName + "</td><td>$"+value.amount+"</td></tr>");
                    $("#ajax-div").show();
                    $("#ajax-table-body").append(newData);
                });
                $("#ajax-table-body").append("<tr class='active'><th colspan='3'>Total Expense</th><th>$"+subtotal+"</th></tr>");
                total= +subtotal1- +subtotal; 
            $("#ajax-table-footer").html("<tr class='active'><th colspan='3'>Net Amount </th ><th>$"+total+"</th></tr>"); 

            }

        });
        
        
    });
    
});




