post '/comment/:id/comment_vote' do
  @comment = Comment.find_by(id: params[:id])
  @post = Post.find_by(id: @comment.post_id)
  if logged_in?
    @comment_vote = CommentVote.new(comment_id: @comment.id, user_id: current_user.id)
    if @comment_vote && request.xhr? && !@comment.comment_votes.find_by(user_id: current_user.id)
      @comment.comment_votes << @comment_vote
      @comment.save
      return {vote_count: @comment.comment_votes.count}.to_json
    end
  end
end