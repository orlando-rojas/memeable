class CategoryController < ApplicationController
  def index
    @memes_by_category = Meme.all.group_by {|meme| meme.category}
  end
end
