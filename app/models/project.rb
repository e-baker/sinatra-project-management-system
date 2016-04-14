class Project < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :users
  belongs_to :category
  has_many :tasks
end