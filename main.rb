
require 'sinatra'
require 'active_record'
# require 'sinatra/reloader'
require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/item'
require_relative 'models/purchase'
require 'pg'

enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
  def logged_in?
    !!current_user
  end
end

# chronological order
get '/' do
  @items = Item.where(sold: false)
  erb :items
end

# closest to me
get '/items' do
  @items = Item.where(sold: false)
  erb :items
end

post '/items' do
  redirect '/' unless logged_in?
  item = Item.new
  item.user_id = current_user.id
  item.add_params params
  item.save
  redirect '/items'
end

get '/items/new' do
  redirect '/' unless logged_in?
  erb :new
end

get '/items/:id' do
  @item = Item.find(params[:id])
  erb :item
end

delete '/items/:id' do
  item = Item.find(params[:id])
  if item.user.id == current_user.id
    item.destroy
  end
  redirect '/'
end

get '/items/:id/edit' do
  @item = Item.find(params[:id])
  redirect '/' unless logged_in? && @item.user.id == current_user.id
  erb :edit
end

get '/items/:id/buy' do
  redirect '/' unless logged_in?
  @item = Item.find(params[:id])
  erb:confirmbuy
end

get '/items/:id/collect' do
  redirect '/login' unless logged_in?
  item = Item.find(params[:id])
  item.collected = true
  item.save
  redirect '/me'
end

post '/items/:id/buy' do
  redirect '/' unless logged_in?
  @item = Item.find(params[:id])
  @item.sold = true
  @item.save
  purchase = Purchase.new
  purchase.item_id = @item.id
  purchase.user_id = current_user.id
  purchase.save
  # do the purchase
  redirect '/'
end

put '/items/:id' do
  item = Item.find(params[:id])
  item.title = params[:title]
  item.description = params[:description]
  item.condition = params[:condition]
  item.price = params[:price]
  item.life_span = params[:life_span]
  item.latitude = params[:latitude]
  item.longitude = params[:longitude]
  item.save
  redirect '/items'
end


# current user's page
get '/me' do
  redirect '/' unless logged_in?
  # but not sold
  @selling = Item.where(user_id: current_user.id, sold: false)
  @sold = Item.where(user_id: current_user.id, sold: true)
  @bought = Purchase.where(user_id: current_user.id)
  erb :me

end

# logging in
get '/login' do
  erb :login
end

get '/signup' do
  @user = User.new
  @message = ""
  erb :signup
end

post '/signup' do
  # form validation here, go back to signup with
  # message if there's a problem
  @user = User.new
  @user.name = params[:name]
  @user.email = params[:email]
  @user.phone_number = params[:phone_number]
  if User.find_by(name: params[:name])
    @message = "That username is already taken, please choose another."
    erb :signup
  else
    @user.password = params[:password]
    @user.save
    session[:user_id] = @user.id
    redirect '/items'
  end
end

post '/session' do
  user = User.find_by(name: params[:username])
  if user && user.authenticate(params[:password])
    # authenticated
    session[:user_id] = user.id
    redirect '/'
  else 
    @message = 'Incorrect username or password'
    erb :login
  end
end

# logging out
delete '/session' do
  session[:user_id] = nil
  redirect '/'
end





