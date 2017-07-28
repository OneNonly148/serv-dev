name = "empty"
phone = "empty"
email = "empty"
make = "empty"
model = "empty"
region = "empty"
location = "empty"
date = "empty"
transfer = 0
cash = 0
service = "empty"
@test_first = ()->
    name = $("#name")
    phone = $("#phone")
    email = $("#email")
    $(".test_one").hide()
    $(".make").hide()
    $(".model").hide()
    $(".location").hide()
    $(".test_two").show()
    $( "#date" ).datepicker()
    $.ajax
      url: '/test/load_pack.json'
      type: 'get'
      success: (pack)->
        $("#service").empty()
        $.each pack, (key, value) ->
          $("#service").append("<option value='"+value.id+"'>"+value.name+"</option>")
          return
        return
      error: (error) ->
        return
    $.ajax
      url: '/test/load_region.json'
      type: 'get'
      success: (region)->
        $("#region").empty()
        $("#region").append("<option>Select Region</option>")
        $.each region, (key, value) ->
          $("#region").append("<option value='"+value.id+"'>"+value.name+"</option>")
          return
        return
      error: (error) ->
        return
@test_second = ()->
    console.log servicen
    model = $("#model")
    make = $("#make")
    service =  $("#service")
    region = $("#region")
    location = $("#location")
    date = $("#date")
    $(".test_two").hide()
    $(".test_three").show()
@test_final = ()->
    #console.log "Pass: " +service+ " | " +make+ " | " +model+ " | " +region+ " | " +location+ " | " +date
    $.ajax
      url: 'test/save.json'
      data:
        name: name.val()
        phone: phone.val()
        email: email.val()
        make: make.val()
        model: model.val()
        service: service.val()
        region: region.val()
        location: location.val()
        date: date.val()
        transfer: transfer
        cash: cash
      type: 'get'
      success: (serv)->
        $(".test_three").hide()
        $(".page").append "<h1>Thank You! "+name.val()+"</h1>"
        return
      error: (error)->
        return
@findme = () ->
  console.log "Where's waldo?"
@checktrigger = (id)->
  if id == 1 && transfer == 0
    transfer = 1
  else if id == 1
    transfer = 0
  else if id == 2 && cash == 0
    cash = 1
  else if id == 2
    cash = 0
  #console.log cash+ " | " +transfer

@date_select = () ->
  date = $( "#date" ).datepicker('getDate')
  date = JSON.stringify date
  return
@load_locate = () ->
  region = $("#region")
  $.ajax
    url: '/test/load_locate.json'
    data: region: region.val()
    type: 'get'
    success: (loca)->
      $(".location").show()
      $("#location").empty()
      $("#location").append("<option>Select Location</option>")
      $.each loca, (key, value) ->
        $("#location").append("<option value='"+value.id+"'>"+value.name+"</option>")
        return
      return
    error: (error) ->
      return
@load_car_makes = ()->
  service = $("#service")
  $.ajax
    url: '/test/load_car_makes.json'
    data: option_no: service.val()
    type: 'get'
    success: (mak)->
        $(".make").show()
        $("#make").empty()
        $("#make").append("<option>Select Car Make</option>")
        $.each mak, (key, value) ->
          $("#make").append("<option value='"+value.id+"'>"+value.name+"</option>")
          return
        return
    error: (error)->
      console.log "There was an error"
      return
@load_car_models = ()->
  make = $("#make")
  $.ajax
    url: '/test/load_car_models.json'
    data: make_no: make.val()
    type: 'get'
    success: (mod)->
      $(".model").show()
      $("#model").empty()
      $("#model").append("<option>Select Car Model</option>")
      $.each mod, (key, value) ->
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
