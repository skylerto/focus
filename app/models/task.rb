class Task < ActiveRecord::Base
  belongs_to :user
  has_many :sub_tasks
end
