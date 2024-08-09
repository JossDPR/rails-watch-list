class ListsController < ApplicationController

  before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @new_list = List.new
  end

  def create
    @new_list = List.create!(params_list)
    if @new_list
      redirect_to lists_path
    else
      render :new
    end

  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def params_list
    params.require(:list).permit(:name, :image)
  end
end
