$ date_pick = ()->
  $( "#prefered_booking_date" ).datepicker()
@load_car_makes = (option_no)->
  $(".car_models").hide()
  $.ajax
    url: '/book/load_car_makes.json'
    data: option_no: option_no
    type: 'get'
    success: (result)->
        $(".car_makes").show()
        $("#car_makes").empty()
        $("#car_makes").append("<option>Select Car Make</option>")
        $.each result, (key, value) ->
          $("#car_makes").append("<option value='"+value.id+"'>"+value.name+"</option>")
          return
        return
    error: (error)->
      console.log "There was an error"
      return
@load_car_models = (make_no)->
  #console.log "load_car_models"
  $.ajax
    url: '/book/load_car_models.json'
    data: make_no: make_no
    type: 'get'
    success: (result)->

      $(".car_models").show()
      $("#booking_models_id").empty()
      $("#booking_models_id").append("<option>Select Car Model</option>")
      $.each result, (key, value) ->
        $("#booking_models_id").append("<option value='"+value.id+"'>"+value.name+"</option>")
        return
      return
    error: (error)->
      console.log "There was an error"
      return
jQuery ->
  $(".car_makes").hide()
  $(".car_models").hide()
