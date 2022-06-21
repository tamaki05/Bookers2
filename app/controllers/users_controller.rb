class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to books_path, notice: "Welcome! You have signed up successfully."
    else
      render :root_path
    end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
