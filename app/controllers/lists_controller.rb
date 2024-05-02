# frozen_string_literal: true

class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @lists = List.new
  end

  def show
    @lists = List.find(params[:id])
  end

  def create
    @lists = List.new(list_params)
    if @lists.save
      redirect_to @lists, notice: 'list made '
    else
      render :new
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
