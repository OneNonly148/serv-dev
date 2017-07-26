@test_f = ()->
    name = $("#name")
    email = $("#email")
    console.log name.val()
    console.log email.val()
    $.ajax
      url: 'test/save.json'
      data:
        name: name.val()
        email: email.val()
      type: 'get'
      success: (result)->
        console.log "Respond"
        $("#test").hide()
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
