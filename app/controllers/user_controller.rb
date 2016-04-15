class UserController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      "Logged In."
    else
      "Error logging in."
    end
  end

  post '/signup' do
    if User.exists?(params[:email])
      "Email taken."
    elsif !params.any? { |key, value| value.empty? }
      @user = User.create(params)
      "Signed Up & Logged In."
    else
      "Error Signing up"
    end
  end


end