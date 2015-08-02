$("document").ready(function(){
    //alert("ajax called");
    $("#account").click(function(e){
       // $("#loading").show;
       e.preventDefault();
        $.ajax({
            
            url:"reports/transactions/account",
            method:"get",
            dataType:'json',
            success:function(data)
            {
               // $("#loading").hide();
                console.log(data);
                $("#ajax-div").hide();
                $.each(data,function(index,value){
                  var newData=$("<tr><td>"+value.amount+"</td><td>"+value.categoryName+"</td></tr>"); 
                  $("#ajax-div").show();
                  $("#ajax-table-body").append(newData);
                });
                
                
            }
        
    });
});
});




