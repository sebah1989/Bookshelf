class BooksController < ApplicationController
  expose(:books) { Book.page params[:page] }
  expose(:book, attributes: :book_params)
  expose(:bookcase) { Bookcase.find(params[:bookcase_id]) if params[:bookcase_id] } 
  expose(:bookcase_book) { Book.find(params[:id]) }
  
  def new
    
  end

  def create
    if bookcase && book.save
      bookcase.books << book
      bookcase.save
      redirect_to book
    elsif book.save
      redirect_to book
    else
      render :new
    end
  end

  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if book.update_attributes(book_params)
      redirect_to book
    else
      render :edit
    end
  end
  def destroy
    book.delete
    redirect_to books_path
  end
  def add_to_bookshelf
    if !bookcase.books.include?(bookcase_book)
      bookcase.books << bookcase_book
      if bookcase.save
        redirect_to bookcase
      else
        redirect_to books_path
      end
    else
      redirect_to books_path
    end
  end

  def remove_from_bookshelf
    bookcase.books.delete(bookcase_book)
    redirect_to bookcase
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :cover_photo, :cover_photo_cache)
  end
end