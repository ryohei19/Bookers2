class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books
  end

  def index
    @user = User.find(current_user.id)
    @new_book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to books_path
    end

  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
    flash[:notice] = "You have updated user successfully."
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
