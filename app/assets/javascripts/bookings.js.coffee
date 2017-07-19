jQuery ->
  $('#booking_model_id').parent().hide()
  states = $('#booking_make_id').html()
  $('#booking_make_id').change ->
    country = $('#booking_make_id :selected').text()
    escaped_model = make.replace(/([ #;&,+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_model}']").html()
    if options
      $('#booking_model_id').html(options)
      $('#booking_model_id').parent().show()
    else
      $('#booking_model_id').empty()
      $('#booking_model_id').parent().hide()
