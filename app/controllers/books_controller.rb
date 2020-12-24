class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render "index"
    end 
  end 

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
  end
  
  def destroy
    @book.destoy
    redirect_to books
  end 
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end 
  
end