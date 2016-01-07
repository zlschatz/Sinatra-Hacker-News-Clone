get '/' do
  redirect '/news'
end

get '/news' do
  erb :index
end

get '/submit' do
  if logged_in?
    erb :submit
  else
    erb :login
  end
end

post 'submit' do

end