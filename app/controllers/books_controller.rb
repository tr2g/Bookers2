class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def update
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = @book.user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    @user = current_user
    redirect_to books_path
  end
end

private
def book_params
  params.require(:book).permit(:title, :body)
end