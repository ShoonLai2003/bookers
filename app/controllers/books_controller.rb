class BooksController < ApplicationController
  def index
    @books = Book.all #登録されている本の一覧
    @book = Book.new  #新規投稿フォーム用
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id]) # 編集する本を取得
  end
  
  def update
    @book = Book.find(params[:id]) # 更新する本を取得
  
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      @books = Book.all
      render :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end