get '/login' do
  @user = User.new
  erb :login
end

post '/login' do
  @user = User.find_by(name: params[:user][:name])

  if @user && @user.password_hash == (params[:user][:password_hash])
    session[:user_id] = @user.id
    redirect '/news'
  else
    @errors =["Either the username or password is incorrect"]
    erb :login
  end
end

post '/login/new' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/news'
  else
    @errors = user.errors.fullmessages
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end