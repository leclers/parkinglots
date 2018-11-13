// = require rails-ujs
// = require jquery
// = require_tree .
//= require jquery-ui

$("input.datepicker").each(function(input) {
  $(this).datepicker({
    dateFormat: "yy-mm-dd",
    altField: $(this).next()
  })
})
