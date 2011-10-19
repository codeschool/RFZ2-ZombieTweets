$(document).ready ->
  $('div#reload_form form').submit (event) -> 
    event.preventDefault()
    url = this.action
    ammo = $('#ammo_to_reload')[0].value

  $.ajax
    type: 'put'
    url: url
    data: {ammo_to_reload: ammo}
    dataType: 'json'
    success: (json) ->
      $('#ammo').text(json.ammo)
      $('#reload_form').fadeOut() if json.ammo >= 30