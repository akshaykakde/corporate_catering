<<<<<<< HEAD
$ ->
  $(document).on 'click', '.activate', (e)->
    element = $(this)
    e.preventDefault()
    $.ajax({
      url: element.attr('href'),
      type: 'PATCH'
    }).done (html)->
      tr = element.parents("tr");
      tr.replaceWith(html);

 
=======
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
>>>>>>> 2111a5a29443cc2dd7af7cd2f19c3434eeeb5ec5
