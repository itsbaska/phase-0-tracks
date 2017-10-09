get "/posts" do
  @posts = Post.order("created_at DESC")
  if request.xhr?
    erb :'posts/_post'
  else
    erb :'posts/index'
  end
end

post "/posts" do
  @post = Post.new(params[:post])

  if request.xhr?
    if @post.save
      erb :'posts/_post', layout:false, locals: { post: @post }
    else
      status 422
      "Oopsies! Something went wrong..."
    end
  else
    if @post.save
      redirect "posts/#{@post.id}"
    else
      @errors = @post.errors.full_messages
      erb :"posts/new"
    end
  end
end

get "/posts/new" do
  @post = Post.new
  if request.xhr?
    erb :'/post/_form'
  else
    erb :'posts/new'
  end
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  erb :'posts/show'
end

put "/posts/:id/like" do
  @post = Post.find(params[:id])
  if request.xhr?
    @post.increment!(:likes_count)
    @post.likes_count.to_s
  else
    @post.increment!(:likes_count)
    redirect "/posts/#{@post.id}"
  end
end
