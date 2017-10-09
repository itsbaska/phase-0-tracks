#  RESTFUL ROUTING

# display all the things
get '/restaurants/:restaurant_id/reviews' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  erb :"reviews/index"
end

# display new thing form
get '/restaurants/:restaurant_id/reviews/new' do
  authenticate!
  @restaurant = Restaurant.find(params[:restaurant_id])
  erb :"reviews/new"
end

# create the new thing
post '/restaurants/:restaurant_id/reviews' do
  authenticate!
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.new(params[:review])

  if @review.save
    current_user.reviews << @review
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @review.errors.full_messages
    erb :"reviews/new"
  end
end

# display a thing
get '/restaurants/:restaurant_id/reviews/:id' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  erb :"reviews/show"
end

# edit the thing form
get '/restaurants/:restaurant_id/reviews/:id/edit' do
  authenticate!
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.find(params[:id])
  authorize!(@review.user)
  erb :"reviews/edit"
end

# actually update the thing
put '/restaurants/:restaurant_id/reviews/:id' do
  authenticate!
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.find(params[:id])
  authorize!(@review.user)
  if @review.update(params[:review])
    redirect "/restaurants/#{@restaurant.id}/reviews"
  else
    @errors = @restaurant.errors.full_messages
    erb :"reviews/edit"
  end
end

# delete
delete '/restaurants/:restaurant_id/reviews/:id' do
  authenticate!
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.find(params[:id])
  authorize!(@review.user)
  @review.destroy
  redirect "/restaurants/#{@restaurant.id}/reviews"
end

