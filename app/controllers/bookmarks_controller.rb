class BookmarksController < ApplicationController
  def create
    @new_bookmark = Bookmark.create!(params_bookmark)
    if @new_bookmark
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def new
  end

  def destroy
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:comment)
  end
end
