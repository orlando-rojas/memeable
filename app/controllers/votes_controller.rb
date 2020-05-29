class VotesController < ApplicationController
  def create
    meme = find_meme
    @vote = meme.votes.create(user: current_user)
    if @vote.save
      redirect_to meme_path(meme)
    else
      flash[:alert] = "Could not vote"
    end
  end

  def destroy
    @vote = find_vote
    if @vote.destroy
      redirect_to meme_path(params[:meme_id])
    else
      flash[:alert] = "Could not delete vote"
    end
  end

  private

  def find_meme
    Meme.find(params[:meme_id])
  end

  def find_vote
    Vote.find(params[:id])
  end


end
