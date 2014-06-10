class BookcasesController < ApplicationController
  expose(:bookcase) 
  expose(:bookcase_books) { bookcase.books.order(:title).page params[:page] }
  before_action :bookcase_owner?
  
  def show
  end

  private
  def bookcase_owner?
    if bookcase.id != current_user.bookcase.id
      redirect_to root_path
    end
  end
end