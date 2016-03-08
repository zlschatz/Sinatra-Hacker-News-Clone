user post '/post/:id/post_vote' do
  @post = Post.find_by(id: params[:id])
  if logged_in?

    @post_vote = PostVote.new(post: @post, user: current_user)
    if @post_vote && request.xhr? && !@post.post_votes.find_by(user_id: current_user.id)
      @post.post_votes << @post_vote
      binding.pry
      @post.save
      return {vote_count: @post.post_votes.count}.to_json
    end
  end
end
