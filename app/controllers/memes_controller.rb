class MemesController < ApplicationController
  def show
    @meme = Meme.find(params[:id])
    @comments = @meme.comments
    @comment = Comment.new
    @tags = @meme.tags
    @tag = Tag.new
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
