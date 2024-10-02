class BooksController < ApplicationController
  def new
    @book = Book.new  # @listではない
  end

  def create
    book = Book.new # newの後に(book_params)を記述するとエラー　なぜ？データを受け取り新規登録するためのインスタンス作成
    book.save  # 3. データをデータベースに保存するためのsaveメソッド実行
    redirect_to book_path(book.id)  
  end

  def index
    @book = Book.all
  end

  def show
  end

  def edit
  end

  private     # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)  #require(book)で良い？listじゃなくて？
  end
end
