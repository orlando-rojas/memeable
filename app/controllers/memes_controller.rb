class MemesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show
    @meme = Meme.find(params[:id])
    @comments = @meme.comments
    @comment = Comment.new
    @tags = @meme.tags
    @tag = Tag.new
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = current_user.memes.new(meme_params) 
    if @meme.save
      redirect_to meme_path(@meme)
    else
      render :new
    end 
  end 

  def edit
  end

  def update
  end

  private 
  def meme_params
    params.require(:meme).permit(:title, :url_source, :type, :category_id)
  end 
end
