class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit]

  def index
    @lists = List.all
  end

  def show
    # raise
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
    @movies = Movie.all
  end

  def create
    list = List.new(list_params)
    if list.save
      redirect_to list_path(list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
