class Project < ActiveRecord::Base
  has_many :tasks

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.detect { |project| project.slug == slug }
  end
  
end