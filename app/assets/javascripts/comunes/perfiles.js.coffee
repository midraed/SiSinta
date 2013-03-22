jQuery ->

  split = (val) ->
    val.split( /,\s*/ )

  extractLast = (term) ->
    split( term ).pop()

  comun =
    delay:      100
    autoFocus:  true
    minLenght:  2

  autocompletar_varios =
    focus:      ->
      false
    select:     (event, ui) ->
      terms = split( this.value )
      # remove the current input
      terms.pop()
      # add the selected item
      terms.push( ui.item.value )
      # add placeholder to get the comma-and-space at the end
      terms.push( "" )
      this.value = terms.join( ", " )
      false
    source:    (request, response) ->
      request.term = extractLast(request.term)
      # this.element.data se define en las vistas
      $.getJSON(this.element.data('url'), request, (data, status, xhr) ->
        response(data)
      )

  etiquetas = {}

  # extendemos los objetos con las características comunes
  $.extend etiquetas, comun, autocompletar_varios

  $('#perfil_etiquetas').autocomplete etiquetas

  $('.completa').nestedFields()

  $('select.compacto').select2()
  $('.compacto').css('width', '100%')
