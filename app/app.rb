 ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
class Bookmark < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/create_link' do
    erb(:creating_link)
  end

  post '/links' do
    link_name = params[:link_name]
    link_url = params[:link_url]
    link_tag = params[:link_tag]
    link = Link.first_or_create(name: link_name, url: link_url)
    link_tag.delete! ' '
    link_tag.split(',').each { |tag|
      link.tags << Tag.first_or_create(name: tag)
      link.save
      }
    redirect '/links'
  end

  get '/tags/:name' do
    tag = params[:name]
    @links = Tag.all(:name=>tag).links
    erb(:links)
  end

  post '/sign-up' do
    user_name = params[:user_name]
    password = params[:password]
    user = User.first_or_create(user_name: user_name, password: password)
    session[:user_id] = user.id
    redirect '/links'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

 run! if app_file == $0

end
