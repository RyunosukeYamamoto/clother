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
  var url = "//api.openweathermap.org/data/2.5/weather?q=Tokyo&units=metric&APPID=b1ae0b538e2e8087bcf3a4c05acb3e15";
  $.getJSON(url, function(data) {
      $("#weather_data").append(
        "<span>"
        + data.main.temp + '°C'
        + "</span>");
      $("#degree_form").val(Math.round(data.main.temp));
      $('#wicon').attr('src', "http://openweathermap.org/img/w/" + data.weather[0].icon + ".png");
  });
});
});
