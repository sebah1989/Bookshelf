class BookcasesController < ApplicationController
  expose(:bookcase) 
  expose(:bookcase_books) { bookcase.books.page params[:page] }
  def show
  end
end