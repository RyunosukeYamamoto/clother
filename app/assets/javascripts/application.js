// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load', function() {
$(document).ready(function() {
  var hoge = $("#city_name").text();
  if(!hoge){
    var url = "//api.openweathermap.org/data/2.5/weather?q=Tokyo&units=metric&APPID=b1ae0b538e2e8087bcf3a4c05acb3e15";
  } else{
    var url = "//api.openweathermap.org/data/2.5/weather?q=" + hoge + "&units=metric&APPID=b1ae0b538e2e8087bcf3a4c05acb3e15";
  }
  $.getJSON(url, function(data) {
      $("#now_temp").text(data.main.temp + '°C');
      $("#degree_form").val(Math.round(data.main.temp));
      $('#wicon').attr('src', "http://openweathermap.org/img/w/" + data.weather[0].icon + ".png");
  });
});
});
