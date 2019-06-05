class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @bookn = Book.new
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @bookn = Book.new
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
  else
    render :edit
  end
  end

  def about
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "successfully"
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  def correct_user
  book = Book.find(params[:id])
  if book.user != current_user
    redirect_to books_path
  end
  end
end
