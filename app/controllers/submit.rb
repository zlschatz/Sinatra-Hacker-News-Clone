get '/submit' do
  if logged_in?
    erb :submit
  else
    redirect '/login'
  end
end

post '/submit' do
  @post = Post.new(params[:post])
  if @post.save
    redirect '/news'
  else
    binding.pry
    redirect '/submit??error=errors.full_messages'
    # @errors = @post.errors.full_messages
    # erb :submit
  end
end