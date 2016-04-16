require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "sinatra_pms" 
  end

  get '/' do
    if session[:id]
      redirect to '/tasks/user'
    else
      erb :index
    end
  end

end