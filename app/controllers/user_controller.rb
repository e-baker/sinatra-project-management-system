class UserController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  get '/signup' do
    erb :'users/signup'
  end

  get '/logout' do
    session.clear
    redirect to '/login'
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect to '/projects'
    else
      erb :'/users/login', locals: {message: "Wrong Email or Password."}
    end
  end

  post '/signup' do
    if User.exists?(params[:email])
      erb :'users/signup', locals: {message: "That email is taken."}
    elsif !params.any? { |key, value| value.empty? }
      @user = User.create(params)
      session[:id] = @user.id
      redirect to '/projects'
    else
      erb :'users/signup', locals: {message: "There was an error."}
    end
  end


end