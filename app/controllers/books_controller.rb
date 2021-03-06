class BooksController < ApplicationController
  def index
    @book = Book.new
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book)
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
    @abook = Book.new
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @user = User.find(current_user.id)
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book)
       flash[:notice] = "You have updated book successfully."
    else
       render :edit
    end
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