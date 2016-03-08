user post '/post/:id/post_vote' do
  @post = Post.find_by(id: params[:id])
  if logged_in?

    @post_vote = PostVote.new(post: @post, user: current_user)
    #ZM: If you  move the "can only be voted on once per user" validation to the
    #PostVote model, the @post.save will handle this.

    # if @post_vote.valid? && request.xhr?
    #else
      #if request.xhr?
        #send error back
      #else
        # redirect '/post/7?error=somethingwentwrong'
      #end
    #
    # binding.pry
    if @post_vote && request.xhr? && !@post.post_votes.find_by(user_id: current_user.id)
      @post.post_votes << @post_vote
      binding.pry
      @post.save
      return {vote_count: @post.post_votes.count}.to_json
    end
  end
end
