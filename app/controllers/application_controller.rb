
require_relative '../../config/environment'

require 'pry'
class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end
  #model 
  get '/articles' do 
    @articles = Article.all 
    erb :index
  end 

  get '/articles/new' do 

     erb :new
  end 

  post '/articles' do
    #byebug
   @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end 

  # title: params[:title], content: params[:content]
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end 

  get '/articles/:id/edit' do 
    # binding.pry
    @article = Article.find(params[:id])
    # binding.pry
    erb :edit
  end 

  patch '/articles/:id' do
  @article = Article.find(params[:id])
  @article.update(params[:article])
  redirect to "/articles/#{@article.id}"
  end 

  delete '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.delete
    redirect to "/articles"
  end 


end
