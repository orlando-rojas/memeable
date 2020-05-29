class MemesController < ApplicationController
  def show
    @meme = Meme.find(params[:id])
    @comments = @meme.comments
    @comment = Comment.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
