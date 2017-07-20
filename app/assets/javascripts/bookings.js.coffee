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
  #console.log make_no
  $.ajax
    url: '/book/load_car_models.json'
    data: make_no: make_no
    type: 'get'
    success: (make_no)->
      $(".car_models").show()
      $("#booking_booking_ses").empty()
      $("#booking_booking_ses").append("<option>Select Car Model</option>")
      $.each make_no, (key, value) ->
        $("#booking_booking_ses").append("<option value='"+value.name+"'>"+value.name+"</option>")
        return
      return
    error: (error)->
      return
jQuery ->
  $(".car_makes").hide()
  $(".car_models").hide()
