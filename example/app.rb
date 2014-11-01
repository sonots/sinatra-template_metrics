require 'sinatra/base'
require 'sinatra/template_metrics'

class App < Sinatra::Base
  get '/' do
    erb :index, layout: :base
  end
end
