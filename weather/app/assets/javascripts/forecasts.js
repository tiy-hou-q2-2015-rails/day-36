$(window).ready(function(){
  $("#search-form").on("submit", function(event){
    $("#forecast").html("");
    $("#spin").show();
  });
});
