class BooksController < ApplicationController
  expose(:book, attributes: :book_params)
  def new
    
  end

  def create
    if book.save
      redirect_to book
    else
      render :new
    end
  end

  def index
    
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :cover_photo)
  end
end