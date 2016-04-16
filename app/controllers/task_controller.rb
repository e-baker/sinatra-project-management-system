class TaskController < ApplicationController

  get '/tasks' do
    if User.is_logged_in?(session)
      @tasks = Task.all
      erb :'tasks/index'
    else
      redirect to '/login'
    end
  end

  get '/tasks/new' do
    if User.is_logged_in?(session)
      @projects = Project.all
      erb :'tasks/new'
    else
      redirect to '/login'
    end
  end

  get '/tasks/user' do
    if User.is_logged_in?(session)
      @user = User.find(session[:id])
      @tasks = Task.get_user_tasks(@user.id)
      erb :'tasks/user_tasks'
    else
      redirect to '/login'
    end
  end

  get '/tasks/:id' do
    if User.is_logged_in?(session)
      @task = Task.find(params[:id])
      @project = Project.find(@task.project_id)
      erb :'tasks/show'
    else
      redirect to '/login'
    end
  end

  get '/tasks/:id/edit' do
    @task = Task.find(params[:id])
    if User.is_logged_in?(session)
      if session[:id] == @task.user_id
        erb :'tasks/edit'
      else
        redirect to "/tasks/#{params[:id]}"
      end
    else
      redirect to '/login'
    end
  end

  post '/tasks' do 
    if User.is_logged_in?(session)
      @task = Task.create(params[:task])
      redirect to "/tasks/#{@task.id}"
    else
      redirect to '/login'
    end
  end

  patch '/tasks/:id' do
    @task = Task.find(params[:id])
    if User.is_logged_in?(session)
      if session[:id] == @task.user_id
        @task.update(params[:task])
        @task.save
        redirect to "/tasks/#{@task.id}"
      else
        redirect to "/tasks/#{params[:id]}"
      end
    else
      redirect to '/login'
    end
  end

  delete '/tasks/:id' do 
    @task = Task.find(params[:id])
    if User.is_logged_in?(session) && session[:id] == @task.user_id
      @task.destroy
      redirect to "/tasks"
    else
      redirect to '/login'
    end
  end
end