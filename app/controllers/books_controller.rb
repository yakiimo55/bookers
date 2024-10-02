class BooksController < ApplicationController
  def new
    @book = Book.new  # モデル名は大文字の単数形
  end
 
  def create
    book = Book.new(book_params) # データを受け取り新規登録するためのインスタンス作成
    book.save  # 3. データをデータベースに保存するためのsaveメソッド実行
    redirect_to book_path(book.id)  
  end

  def index
    @book = Book.new   #indexに新規の投稿するからこの記述が必要
    @books = Book.all  #コントローラーやビューは自作の名前で複数形にすることが多い
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  private     # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)  
  end
end
