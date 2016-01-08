get '/vote/:id' do
  @posts = Post.all
  @post = Post.find_by(id: params[:id])
  @post_vote = PostVote.new(post_id: @post.id, user_id: @post.user.id)
  @post.post_votes << @post_vote
  if logged_in? && @post.save
    erb :'_vote_partial.erb', locals: {post: @post}, layout: false
  else
    redirect '/login'
  end
end