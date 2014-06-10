class BooksController < ApplicationController
  expose(:books) { Book.order(:title).page params[:page] }
  expose(:book, attributes: :book_params)
  expose(:bookcase) { Bookcase.find(params[:bookcase_id]) if params[:bookcase_id] }
  expose(:bookcase_book) { Book.find(params[:id]) }
  def new
  end

  def create
    respond_to do |format|
      if bookcase && book.save
        bookcase.books << book
        bookcase.save
        format.js
        format.html { redirect_to book }
      elsif book.save
        format.js
        format.html { redirect_to book }
      else
        format.html { render :new }
      end
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
    @id_deleted = book.id
    book.delete
    respond_to do |format|
      format.html { redirect_to books_path }
      format.js
    end
  end

  def add_to_bookshelf
    #two variables for coffescript
    @saved = false
    @already_exists = false
    respond_to do |format|
      if !bookcase.books.include?(bookcase_book)
        bookcase.books << bookcase_book
          if bookcase.save
            @saved = true
            format.html { redirect_to bookcase }
            format.js
          else
            format.html { redirect_to books_path }
            format.js
          end
      else
        @already_exists = true
        format.html { redirect_to books_path }
        format.js
      end
    end
  end

  def remove_from_bookshelf
    #variable for coffescript
    @removed_book_id = nil
    respond_to do |format|
      if bookcase.books.include?(bookcase_book)
        @removed_book_id = bookcase_book.id
        bookcase.books.delete(bookcase_book)
      end
      format.html { redirect_to bookcase }
      format.js
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :cover_photo, :cover_photo_cache, :boocase_id)
  end
end