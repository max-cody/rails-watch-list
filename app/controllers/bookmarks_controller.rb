# # frozen_string_literal: true

# class BookmarksController < ApplicationController
#   before_action :set_movie, only: %i[new create]

#   # def index
#   #   @bookmarks = Bookmark.all
#   # end

#   def new
#     @bookmark = Bookmark.new
#     @list = List.find(params[:list_id])
#   end

#   def show
#     @bookmark = Bookmark.find(params[:id])
#   end

#   def create
#     @bookmark = Bookmark.new(bookmark_params)
#     @list = List.find(params[:list_id])
#     @bookmark.list = @list

#     if @bookmark.save
#       redirect_to @bookmark, notice: 'bookmark successfully created.'
#     else
#       render :lists/show
#     end
#   end
#  private
#   def destroy
#     @bookmark = Bookmark.find(params[:id])
#     @bookmark.destroy
#     redirect_to movies_new_path(@bookmark.movie), status: :see_other
#   end

#   private

#   def bookmark_params
#     params.require(:bookmark).permit(:comment, :movie_id)
#   end

#   def set_movie
#     @movie = Movie.find_by(id: params[:movie_id])
#     return if @movie

#     # Handle the case where the movie doesn't exist
#     # For example, redirect back with a flash message
#     redirect_to movies_new_path, alert: 'Movie not found'
#   end
# end
class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
