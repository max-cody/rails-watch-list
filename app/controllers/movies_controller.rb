# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
  end

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
