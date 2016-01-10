post '/vote/:id' do
  @posts = Post.all
  @post = Post.find_by(id: params[:id])
  @post_vote = PostVote.new(post_id: @post.id, user_id: @post.user.id)
  if logged_in? && request.xhr? && @post_vote
    @post.post_votes << @post_vote
    @post.save
    erb :_vote_partial, locals: {post: @post}, layout: false
  else
    # alert("You must login to vote!")
    redirect '/login'
  end
end
