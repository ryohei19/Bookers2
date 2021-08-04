class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to user_path(current_user)
    end

  end

  def update
    @user = current_user
    if @user.update(user_params)
       redirect_to user_path(@user)
       flash[:notice] = "You have updated user successfully."
    else
       render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
