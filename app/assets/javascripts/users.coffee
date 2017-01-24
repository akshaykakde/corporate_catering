$ ->
  $('.activate').on 'click', (e)->
    element = $(this)
    alert("helooo!!")
    e.preventDefault()
    $.ajax({
      url: element.attr('href'),
      type: 'PATCH'
    }).done (html)->
      tr = element.parents("tr");
      alert("buffeelo!!")
      tr.replaceWith(html);

 
