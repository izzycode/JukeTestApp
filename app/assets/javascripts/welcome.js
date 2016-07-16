
$(function(){
console.log("first level");
$.ajax({
      url: "/autofill",
      // dataType: "html",
      success:  function(){
                  // Izzy: Don't know why it always trows error but it is working now. Must ask this or figure it out.
                  // $('#search').autocomplete({source: arr});
                },
      error: function() {// When Service call fails
              console.log();
              $('#search').autocomplete({source: arr});
              }
  });
})
