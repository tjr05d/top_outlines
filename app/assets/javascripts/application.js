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
$(function() {
  $(".button-collapse").sideNav();
  
  $("#school_outlines th a, #school_outlines .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#school_outlines_search input").keyup(function() {
    $.get($("#school_outlines_search").attr("action"), $("#school_outlines_search").serialize(), null, "script");
    return false;
  });
});

$(function() {
  $("#all_outlines th a, #all_outlines .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#all_outlines_search input").keyup(function() {
    $.get($("#all_outlines_search").attr("action"), $("#all_outlines_search").serialize(), null, "script");
    return false;
  });
});
