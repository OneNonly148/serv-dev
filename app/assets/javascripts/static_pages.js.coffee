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
    name = $("#name")
    phone = $("#phone")
    email = $("#email")
    $("#test_one").hide()
    $("#test_two").show()
@test_second = ()->
    make = $("#make")
    model = $("#model")
    service = $("#service")
    location = $("#location")
    date = $("#date")
    $("#test_two").hide()
    $("#test_three").show()
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
        $("#test_three").hide()
        $(".page").append "<h1>Thank You! " +result+ "</h1>"
        return
      error: (error)->
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
    $("#test_three").hide()
    $("#test_two").hide()
