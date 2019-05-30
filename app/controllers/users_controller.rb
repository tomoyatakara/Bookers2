class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:log]
  before_action :correct_user, only: [:edit, :update]
  def new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to '/users'
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def log
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def correct_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(current_user.id)
    end
  end

end
