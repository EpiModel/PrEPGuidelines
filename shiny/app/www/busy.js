
setInterval(function(){
  if ($('html').attr('class') == 'shiny-busy') {
    setTimeout(function() {
      if ($('html').attr('class') == 'shiny-busy') {
        $('div.busy').show();
      }
    }, 1000);
  } else {
    $('div.busy').hide();
  }
}, 100);


//setInterval will check if shiny is busy every 100ms
//if shiny is busy, setTimeout will display div.busy after 1 second (1000ms)

$(document).ready(function(){

  $("#onemodButton").click(function(){
    $("#onemodButton").toggleClass("active", true);
    $("#twomodButton").toggleClass("active", false);
    $(".paramgroup2").toggleClass("gray", true);
  });

  $("#twomodButton").click(function(){
    $("#onemodButton").toggleClass("active", false);
    $("#twomodButton").toggleClass("active", true);
    $(".paramgroup2").toggleClass("gray", false);
  });

});
