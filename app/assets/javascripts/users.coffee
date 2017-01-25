$ ->
  $(document).on 'click', '.activate', (e)->
    element = $(this)
    e.preventDefault()
    console.log "111"
    $.ajax({
      url: element.attr('href'),
      type: 'PATCH'
    }).done (html)->
      tr = element.parents("tr");
      tr.replaceWith(html);

 
