class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]

  # GET /books
  def index
    @books = Book.all

    render json: @books.to_json(include: %i[comments categories])
  end

  # GET /books/1
  def show
    render json: @book.to_json(include: %i[comments categories])
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      @book.append_categories(categories_params) unless categories_params.empty?
      render json: @book.to_json(include: %i[categories]), status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # TODO: add possibility to update the categories based on the categories_params
  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book.to_json(include: %i[categories])
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy

    render json: @book
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.require(:book).permit(:title, :author, :percent, :current_chapter)
  end

  def categories_params
    params.required(:categories)
  end
end
