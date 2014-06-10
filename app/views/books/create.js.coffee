$(document).ready -> 
  if $("nav.pagination").find(".last").length != 0
    $('#book_author').val('')
    $('#book_title').val('')
    alert "Book has been created!"
  else
    $("<%= escape_javascript(render book) %>").appendTo("#books")
    $('#book_author').val('')
    $('#book_title').val('')
    