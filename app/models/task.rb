class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.get_project_tasks(project_id)
    tasks = []
    self.all.collect { |task| tasks << task if task.project_id == project_id }
    tasks
  end

  def self.get_user_tasks(user_id)
    tasks = []
    self.all.collect { |task| tasks << task if task.user_id == user_id }
    tasks
  end

  def self.delete_project_tasks(project_id)
    tasks = Task.find_by(project_id: project_id)
    tasks.each { |task| task.delete }
  end

end