class BookcasesController < ApplicationController
  expose(:bookcase) 
  expose(:bookcase_books) { bookcase.books.order(:title).page params[:page] }
  def show
  end
end