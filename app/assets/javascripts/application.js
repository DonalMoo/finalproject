// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// modified code from http://jsfiddle.net/Barzi/Jzs6B/9/. @author Maziar Barzi [Accessed 12 July 2016]
$(function() {
    $("#playlist li").on("click", function() {
        $("#videoarea").attr({
            "src": $(this).attr("videourl"),
            "autoplay": "autoplay"
        })
    })
    $("#videoarea").attr({
        "src": $("#playlist li").eq(0).attr("videourl")
    })
})


$(function() {

    if(screen.width < 479) { 
    // do any 480 width stuff here, or simply do nothing

    } 

    else {

    var $videoarea   = $("#videoarea"), 
        $window    = $(window),
        offset     = $videoarea.offset(),
        topPadding = 30;

    $window.scroll(function() {
        if ($window.scrollTop() > offset.top) {
            $videoarea.stop().animate({
                marginTop: $window.scrollTop() - offset.top + topPadding
            });
        } else {
            $videoarea.stop().animate({
                marginTop: 0
            });
        }
    });

}
    
});




