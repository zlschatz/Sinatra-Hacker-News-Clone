get '/' do
  redirect '/news'
end

get '/news' do
  @posts = Post.all
  @users = User.all
  erb :index
end

get '/submit' do
  if logged_in?
    erb :submit
  else
    erb :login
  end
end

post '/submit' do
  @post = Post.new(params[:post])
  if @post.save
    redirect '/news'
  else
    @errors = @post.errors.full_messages
    erb :submit
  end
end

get '/news/:id' do
  @post = Post.find_by(id: params[:id])
  # require 'pry'; binding.pry
  @comments = @post.comments
  erb :show
end

post '/news/:id' do
  @post = Post.find_by(id: params[:id])
  @comment = Comment.new(params[:comment])
  # require 'pry'; binding.pry
  if @comment.save
    redirect "/news/#{@post.id}"
  else
    @errors = @comment.errors.full_messages
    erb :show
  end
end

delete '/news/:id' do
  post = Post.find(params[:id])
  post.comments.destroy
  post.destroy
  redirect '/news'
end