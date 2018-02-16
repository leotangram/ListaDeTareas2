require 'sinatra'
require 'make_todo'

get '/' do
  redirect '/tasks'
end

get '/tasks/?' do
  @title = "Home"
  @task  = Tarea.all
  erb :index
end

post '/task/new' do
  Tarea.create(params[:task])
  redirect '/tasks'
end

patch '/task/:id/done' do
  Tarea.update(params[:id].to_i)
  redirect '/tasks'
end

delete '/task/:id/delete' do
  Tarea.destroy(params[:id].to_i)
  redirect '/tasks'
end