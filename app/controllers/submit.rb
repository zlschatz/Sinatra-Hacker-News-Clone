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