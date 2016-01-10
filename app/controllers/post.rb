get '/post/:id/post_vote' do
  @posts = Post.all
  @users = User.all
  erb :index
end

post '/post/:id/post_vote' do
    @post = Post.find_by(id: params[:id])
  if logged_in?
    @posts = Post.all
    @post_vote = PostVote.new(post_id: @post.id, user_id: current_user.id)
    if @post_vote && request.xhr? && !@post.post_votes.find_by(user_id: current_user.id)
      @post.post_votes << @post_vote
      @post.save
      erb :_vote_partial, locals: {post: @post}, layout: false
    end
  end
end
