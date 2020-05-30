module VotesHelper
  def vote_link(meme)
    vote = meme.votes.find_by(user: current_user)
    p vote
    if vote.nil?
      link_to "Vote!", meme_votes_path(@meme), method: :post, class: "memedetail-vote"
    else
      link_to "Delete vote!", meme_vote_path(@meme, vote), method: :delete, class: "memedetail-vote"
    end
  end
end
