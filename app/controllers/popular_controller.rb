class PopularController < ApplicationController
  def index
    @memes = Meme.order(votes_count: :desc)
  end
end
