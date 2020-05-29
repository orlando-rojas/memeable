class HomeController < ApplicationController
  def index
    @memes_by_date = Meme.all.group_by {|meme| meme.created_at.to_date}
  end
end
