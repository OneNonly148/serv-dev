
$ date_pick = ()->
  $( "#booking_prefered_booking_date" ).datepicker()
@date_select = () ->
  date = $( "#booking_prefered_booking_date" ).datepicker('getDate')
  date = JSON.stringify date
  console.log "Date: " + date
  return
@load_locate = (region) ->
  $(".sloc").show()
  $.ajax
    url: '/book/load_locate.json'
    data: region: region
    type: 'get'
    success: (result)->
      $("#booking_location_id").show()
      $("#booking_location_id").empty()
      $("#booking_location_id").append("<option>Select Location</option>")
      console.log "Result: " + result
      $.each result, (key, value) ->
        $("#booking_location_id").append("<option value='"+value.id+"'>"+value.name+"</option>")
        console.log "ID: " + value.id
        return
      return
    error: (error) ->
      return
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
      $("#booking_model_id").empty()
      $("#booking_model_id").append("<option>Select Car Model</option>")
      $.each result, (key, value) ->
        $("#booking_model_id").append("<option value='"+value.id+"'>"+value.name+"</option>")
        return
      return
    error: (error)->
      console.log "There was an error"
      return
jQuery ->
  $(".sloc").hide()
  $(".car_makes").hide()
  $(".car_models").hide()
window.onload = () ->
  $(".sloc").hide()
  $.ajax
    url: '/book/load_region.json'
    type: 'get'
    success: (result)->
      $("#region").empty()
      $("#region").append("<option>Select Region</option>")
      $.each result, (key, value) ->
        $("#region").append("<option value='"+value.id+"'>"+value.name+"</option>")
        return
      return
    error: (error) ->
      return
