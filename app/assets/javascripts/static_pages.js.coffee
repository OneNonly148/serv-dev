name = "empty"
phone = "empty"
email = "empty"
make = "empty"
makea = []
maken = ""
model = "empty"
modela = []
modeln = ""
region = "empty"
regiona = []
regionn = ""
location = "empty"
locationa = []
locationn = ""
date = "empty"
transfer = "No"
cash = "No"
service = "empty"
servicea = []
servicen = ""
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
        i = 1
        $.each pack, (key, value) ->
          servicea[i++] = value.name
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
        i = 1
        $.each region, (key, value) ->
          regiona[i++] = value.name
          $("#region").append("<option value='"+value.id+"'>"+value.name+"</option>")
          return
        return
      error: (error) ->
        return
@test_second = ()->
    model = $("#model")
    make = $("#make")
    service =  $("#service")
    region = $("#region")
    location = $("#location")
    date = $("#date")
    $(".test_two").hide()
    $(".test_three").show()
    servicen = servicea[service.val()]
    maken = makea[make.val()]
    modeln = modela[model.val()]
    regionn = regiona[region.val()]
    locationn = locationa[location.val()]
    #console.log ": " +model.val()+ " | " +modela+ " | " +modeln
    #console.log ": " +location.val()+ " | " +locationa+ " | " +locationn
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
        servicen: servicen
        maken: maken
        modeln:modeln
        regionn: regionn
        locationn: locationn
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
  if id == 1 && transfer == "No"
    transfer = "Yes"
  else if id == 1
    transfer = "No"
  else if id == 2 && cash == "No"
    cash = "Yes"
  else if id == 2
    cash = "No"
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
      i = 1
      $.each loca, (key, value) ->
        locationa[i++] = value.name
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
        i = 1
        $.each mak, (key, value) ->
          makea[i++] = value.name
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
      i = 1
      $.each mod, (key, value) ->
        modela[i++] = value.name
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
