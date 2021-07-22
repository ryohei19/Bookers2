class BooksController < ApplicationController
  def index
    @new_book = Book.new
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
       redirect_to book_path(@new_book)
       flash[:notice] = "You have created book successfully."
    else
       @user = User.find(current_user.id)
       @books = Book.all
       render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_path(@user)
    flash[:notice] = "You have updated book successfully."
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
       redirect_to books_path
    else
      render book_path(@book)
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end