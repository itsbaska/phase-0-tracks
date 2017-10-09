#  RESTFUL ROUTING

# display all the things
get '/restaurants' do
  @restaurants = Restaurant.all
  erb :"restaurants/index"
end

# display new thing form
get '/restaurants/new' do
  authenticate!
  @restaurant = Restaurant.new
  erb :"restaurants/new"
end

# create the new thing
post '/restaurants' do
  authenticate!
  @restaurant = Restaurant.new(params[:restaurant])

  if @restaurant.save
    current_user.restaurants << @restaurant
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @restaurant.errors.full_messages
    erb :"restaurants/new"
  end
end

# display a thing
get '/restaurants/:id' do
  @restaurant = Restaurant.find_by(id: params[:id])
  erb :"restaurants/show"
end

# edit the thing form
get '/restaurants/:id/edit' do
  authenticate!
  @restaurant = Restaurant.find_by(id: params[:id])
  authorize!(@restaurant.user)
  erb :"restaurants/edit"
end

# actually update the thing
put '/restaurants/:id' do
  authenticate!
  @restaurant = Restaurant.find_by(id: params[:id])
  authorize!(@restaurant.user)

  if @restaurant.update(params[:restaurant])
    redirect '/restaurants'
  else
    @errors = @restaurant.errors.full_messages
    erb :"restaurants/edit"
  end
end

# delete
delete '/restaurants/:id' do
  authenticate!
  @restaurant = Restaurant.find_by(id: params[:id])
  authorize!(@restaurant.user)
  @restaurant.destroy
  redirect '/restaurants'
end

