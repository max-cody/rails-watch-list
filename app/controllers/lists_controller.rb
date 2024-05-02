# frozen_string_literal: true

class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'list made '
    else
      render :new
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
