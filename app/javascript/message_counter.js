$(document).on('turbolinks:load', function(){
  $("#js-text").on("keyup", function() {
    let countNum = String($(this).val().length);
    $("#js-counter").text(countNum + "文字");
  });
});
