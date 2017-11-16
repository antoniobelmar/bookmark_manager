 ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
class Bookmark < Sinatra::Base

  get '/' do
    redirect '/create_link'
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
    link = Link.create(name: link_name, url: link_url)
    link_tag.split(',').each { |tag|
      link.tags << Tag.create(name: tag)
      link.save
      }
    redirect '/links'
  end

  get '/tags/bubbles' do
    @links = Tag.all(:name=>"bubbles").links
    erb(:links)
  end

 run! if app_file == $0

end
