class ProjectController < ApplicationController

  get '/projects' do
    if User.is_logged_in?(session)
      @projects = Project.all
      erb :'projects/index'
    else
      redirect to '/login'
    end
  end

  get '/projects/new' do
    if User.is_logged_in?(session)
      erb :'projects/new'
    else
      redirect to '/login'
    end
  end

  get '/projects/:slug' do
    if User.is_logged_in?(session)
      @project = Project.find_by_slug(params[:slug])
      @tasks = Task.get_project_tasks(@project.id)
      erb :'projects/show'
    else
      redirect to '/login'
    end
  end

  get '/projects/:slug/edit' do
    if User.is_logged_in?(session)
      @project = Project.find_by_slug(params[:slug])
      erb :'projects/edit'
    else
      redirect to '/login'
    end
  end

  post '/projects' do
    if User.is_logged_in?(session)
      @project = Project.create(name: params[:project][:name])
      redirect to "/projects/#{@project.slug}"
    else
      redirect to '/login'
    end
  end

  patch '/projects/:slug' do
    if User.is_logged_in?(session)
      @project = Project.find_by_slug(params[:slug])
      @project.update(params[:project])
      @project.save
      redirect to "/projects/#{@project.slug}"
    else
      redirect to '/login'
    end
  end

end