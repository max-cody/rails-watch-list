# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :set_movie, only: %i[new create]

  def index
    @bookmark = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @bookmark = bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark, notice: 'bookmark successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to movie_path(@bookmark.movie), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:content, :rating)
  end

  def set_movie
    @movie = Movie.find_by(id: params[:movie_id])
    return if @movie

    # Handle the case where the movie doesn't exist
    # For example, redirect back with a flash message
    redirect_to movie_path, alert: 'Movie not found'
  end
end
