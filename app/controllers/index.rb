get '/' do
  redirect '/news'
end

get '/news' do
  @posts = Post.all
  @users = User.all
  erb :index
end

get '/news/:id' do
  @post = Post.find_by(id: params[:id])
  @comments = @post.comments
  erb :show
end

post '/news/:id' do
  @post = Post.find_by(id: params[:id])
  @comment = Comment.new(params[:comment])
  binding.pry
  if request.xhr? && @comment.save
    # @comments = @post.comments
    binding.pry
    erb :_add_comment, locals: {comment: comment}, layout: false
  end
end

delete '/news/:id' do
  post = Post.find(params[:id])
  post.comments.destroy
  post.destroy
  redirect '/news'
end