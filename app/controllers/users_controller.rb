class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @book = Book.new
    @books = @user.books
  end

  def index
    @users = User.all
  end

  def edit
  end





end
