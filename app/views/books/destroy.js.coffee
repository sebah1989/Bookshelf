$(document).ready -> 
  $("#book_<%= @id_deleted %>").remove()
  alert "Book has been destroyed!"