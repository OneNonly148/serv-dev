name = ""
phone = ""
email = ""
make = ""
model = ""
location = ""
date = ""
transfer = ""
cash = ""
service = ""
@test_first = ()->
    console.log "Second trigger"
    name = $("#name")
    phone = $("#phone")
    email = $("#email")
    $(".test_one").hide()
    $(".make").hide()
    $(".model").hide()
    $(".test_two").show()
    $( "#test_date" ).datepicker()
    $.ajax
      url: '/test/load_pack.json'
      type: 'get'
      success: (result)->
        $("#service").empty()
        $.each result, (key, value) ->
          $("#service").append("<option value='"+value.id+"'>"+value.name+"</option>")
          return
        return
      error: (error) ->
        return
    $.ajax
      url: '/test/load_region.json'
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
@test_second = ()->
    make = $("#make")
    model = $("#model")
    location = $("#location")
    date = $("#date")
    $(".test_two").hide()
    $(".test_three").show()

@test_final = ()->
    transfer = $("#transfer")
    cash = $("#cash")
    $.ajax
      url: 'test/save.json'
      data:
        name: name.val()
        phone: phone.val()
        email: email.val()
        make: make.val()
        model: model.val()
        service: service.val()
        location: location.val()
        date: date.val()
        transfer: transfer.val()
        cash: cash.val()
      type: 'get'
      success: (result)->
        $(".test_three").hide()
        $(".page").append "<h1>Thank You! " +result+ "</h1>"
        return
      error: (error)->
        return
@date_select = () ->
  date = $( "#date" ).datepicker('getDate')
  date = JSON.stringify date
  return
@load_locate = (region) ->
  $.ajax
    url: '/test/load_locate.json'
    data: region: region
    type: 'get'
    success: (result)->
      $("#location").empty()
      $("#location").append("<option>Select Location</option>")
      $.each result, (key, value) ->
        $("#location").append("<option value='"+value.id+"'>"+value.name+"</option>")
        return
      return
    error: (error) ->
      return
@load_car_makes = ()->
  service = $("#service")
  console.log service.val()
  $.ajax
    url: '/test/load_car_makes.json'
    data: option_no: service.val()
    type: 'get'
    success: (result)->
        $(".make").show()
        $("#make").empty()
        $("#make").append("<option>Select Car Make</option>")
        $.each result, (key, value) ->
          $("#make").append("<option value='"+value.id+"'>"+value.name+"</option>")
          return
        return
    error: (error)->
      console.log "There was an error"
      return
@load_car_models = (make_no)->
  $.ajax
    url: '/test/load_car_models.json'
    data: make_no: make_no
    type: 'get'
    success: (result)->
      $(".model").show()
      $("#model").empty()
      $("#model").append("<option>Select Car Model</option>")
      $.each result, (key, value) ->
        $("#model").append("<option value='"+value.id+"'>"+value.name+"</option>")
        return
      return
    error: (error)->
      console.log "There was an error"
      return
$ ->
  packn = $( "#package" )
  protonv = 0
  produav = 0
  othersv = 0
  @proton_sel = ->
    protonv= 1
    return
  @produa_sel = ->
    produav= 1
    return
  @others_sel = ->
    othersv= 1
    return
  addUser = ->
    $.ajax
      url: '/book/save_pack.json'
      data:
        pack: packn.val()
        proton: protonv
        produa: produav
        others: othersv
      type: 'get'
      dialog.dialog 'close'
    return
  dialog = $('#dialog-form').dialog(
    autoOpen: false
    height: 250
    width: 350
    modal: true
    buttons:
      'Create a package': addUser
      Cancel: ->
        dialog.dialog 'close'
        return
        close: ->
          form[0].reset()
          allFields.removeClass 'ui-state-error'
          return
  )
  form = dialog.find('form').on('submit', (event) ->
    event.preventDefault()
    addUser()
    return
  )

  $('#create-user').button().on 'click', ->
    dialog.dialog 'open'
    return
$ jQuery ->
    $('#dialog-form').hide()
    $(".test_three").hide()
    $(".test_two").hide()
