class BooksController < ApplicationController
  def index
    @books  = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = 'successfully'
    # 本の作成後、本の詳細ページに飛ばしている、bookpathはbookのshow
    redirect_to book_path(@book)
    else flash[:notice] = "can't be blank"

# レンダーで戻しているため、INDEXのコントローラ内の情報を再定義する必要がある
    @books  = Book.all
    @book = Book.new
    render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    book = Book.find(params[:id])	
    book.update(book_params)
    flash[:notice] = 'Book was successfully updated'
    redirect_to book_path(book.id)
   end

  def destroy
    book = Book.find(params[:id])
      book.destroy
      flash[:notice] = 'Book was successfully destroyed'
      redirect_to '/books'

  end

  private
    def book_params
      params.require(:book).permit(:title, :body)

    end
end
