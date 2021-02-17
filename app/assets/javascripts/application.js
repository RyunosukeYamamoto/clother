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

console.log("hoge");

$(document).ready(function() {
  var url = "//marinesnow.sakura.ne.jp/2019/sample.php";
  $.getJSON(url, function(data) {
    for (var i in data) {
      $("#weather_data").append(
        "<li>"
        + data[i].subject
        + ":" + data[i].score + " "
        + "(" + data[i].result + ")"
        + "</li>");
    }
  });
});

