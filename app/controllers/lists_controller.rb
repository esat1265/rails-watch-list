class ListsController < ApplicationController

  def index
    @movies = Movie.all
    @lists = List.all
    @bookmarks = Bookmark.all
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
