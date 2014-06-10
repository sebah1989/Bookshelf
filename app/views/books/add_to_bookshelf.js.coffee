$(document).ready ->
  if <%= @saved %>
    alert "Book has been added to your bookshelf!"
  else if <%= @already_exists %>
    alert "Book already exists in your bookshelf!"
  else
    alert "Something went wrong..."