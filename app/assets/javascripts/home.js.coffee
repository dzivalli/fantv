$ ->
  $('#text').on 'input', (e) ->
    clearTimeout @timeout
    @timeout = setTimeout(go, 1000)

go = ->
  $.get 'search', {text: $('#text').val()}, success

success = (data) ->
  if data.total_results == 0
    $('.results').hide()
    $('.message').html('Nothing found')
  else
    $('.movies').html(render_template(data.movies))
    $('.shows').html(render_template(data.shows))
    $('.people').html(render_template(data.people))
    $('.message').html('')
    $('.results').show()

render_template = (json_data) ->
  html = ''
  if json_data.length > 0
    $.each json_data, ->
      html += JST['template'](this)
  html


