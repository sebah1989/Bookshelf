class BookcasesController < ApplicationController
  expose(:bookcase) 
  expose(:bookcase_books) { bookcase.books }
  def show
    
  end

end