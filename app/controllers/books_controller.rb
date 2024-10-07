class BooksController < ApplicationController
  def new
    @book = Book.new  # モデル名は大文字の単数形
  end

  def create
    @book = Book.new(book_params) # データを受け取り新規登録するためのインスタンス作成
    @books = Book.all
    if @book.save  # 3. データをデータベースに保存するためのsaveメソッド実行
      flash[:success] = "done successfully"
      redirect_to book_path(@book.id)
    else
      render 'index'
    end
  end

  def index
    @book = Book.new   #indexに新規の投稿するからこの記述が必要
    @books = Book.all  #コントローラーやビューは自作の名前で複数形にすることが多い
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.all
    if @book.save  # 3. データをデータベースに保存するためのsaveメソッド実行
      flash[:success] = "done successfully"
      redirect_to book_path(@book.id)
    else
      render 'edit'
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:success] = "done successfully"
      redirect_to book_path(params[:id])  #showアクションにredirect [:id]の意味
    else render 'edit'
   end
  end
  
  def destroy
    book = Book.find(params[:id])  
    book.destroy
    redirect_to'/books'
  end

  private     # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
