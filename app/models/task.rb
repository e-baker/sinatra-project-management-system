class Task < ActiveRecord::Base
  belongs_to :project
  has_many :users
  belongs_to :category
end