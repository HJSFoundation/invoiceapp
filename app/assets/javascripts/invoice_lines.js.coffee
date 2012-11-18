# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#function updatesum() {
#	document.field.line_total.value = (document.field.rate.value -0) * (document.field.quantity.value -0);
#}
$(document).ready ->
  $("select#invoice_line_biller_id").change ->
    id_value_string = $(this).val()
    if id_value_string is ""
      
      # if the id is empty set rate to blank and disable
      id_line_rate = $("input#invoice_line_rate")
      id_line_rate.val ""
      id_line_rate.attr("disabled", "disabled")
      id_line_rate
      
    else
      
      # Send the request and get the info related to the biller
      $.ajax
          dataType: "json"
          cache: false
          url: "/billers/" + id_value_string
          timeout: 2000
          error: (XMLHttpRequest, errorTextStatus, error) ->
            alert "Failed to submit : " + errorTextStatus + " ;" + error


        success: (data) ->
          
          # Enable the field and set the value equal to the biller's current rate
            id_line_rate = $("input#invoice_line_rate")
            id_line_rate.removeAttr "disabled"
            id_line_rate.val data.rate
            id_line_rate
