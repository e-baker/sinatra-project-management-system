class Project < ActiveRecord::Base
  has_many :tasks

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.detect { |project| project.slug == slug }
  end

  def self.find_by_user(user_id)
    projects = []
    Project.all.each { |project| projects << project if project.user_id == user_id }
    projects
  end

  def self.exists?(project_name)
    self.all.detect { |project| project.name.downcase == project_name.downcase} ? true : false
  end
  
end