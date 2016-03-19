# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

get '/messages/new' do
  @message = Message.new
  erb :'messages/new'
end

get '/messages/:id' do
  @message = Message.find params[:id]
  @messages = Message.where(author: @message.author)
  erb :'messages/show'
end

post '/messages' do
  @message = Message.new(
    # title: params[:title],
    content: params[:content],
    author: params[:author],
    url: params[:url],
    created_at: params[:created_at],
    updated_at: params[:updated_at],
  )

  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end