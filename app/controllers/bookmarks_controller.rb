class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:content)
  end
end
