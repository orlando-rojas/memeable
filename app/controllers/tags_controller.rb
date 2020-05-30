class TagsController < ApplicationController
  def create
    @tag = create_tag
    if @tag
      redirect_to meme_path(params[:meme_id])
    else
      flash[:alert] = "Could not create tag"
    end
  end

  private
  def create_tag
    meme = find_meme
    return meme.tags << Tag.new(tag_params) if meme.owner == current_user
    nil
  end
  def tag_params
    params.require(:tag).permit(:name)
  end

  def find_meme
    Meme.find(params[:meme_id])
  end
end
