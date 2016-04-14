class Task < ActiveRecord::Base
  belongs_to :project
  has_many :users
  has_many :categories
end