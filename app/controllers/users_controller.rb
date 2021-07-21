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




end
