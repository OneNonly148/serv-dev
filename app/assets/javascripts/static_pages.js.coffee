$ ->
  packn = $( "#package" )
  car_make = $( "#car_make" )
  allFields = $( [] ).add( packn ).add( car_make )
  addUser = ->
    $('#packli').append '<li>' + packn.val() + '</li>'
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
