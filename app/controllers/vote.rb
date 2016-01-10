post '/vote/:id' do
  @posts = Post.all
  @post = Post.find_by(id: params[:id])
  @post_vote = PostVote.new(post_id: @post.id, user_id: current_user.id)
  if logged_in? && @post_vote && request.xhr? && !@post.post_votes.find_by(user_id: current_user.id)
    @post.post_votes << @post_vote
    @post.save
    erb :_vote_partial, locals: {post: @post}, layout: false
  end
end
