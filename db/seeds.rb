# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

user = User.find_by_email('s@gmail.com')

task = Task.create(user_id: user.id, title: "Study for AI", progress: nil, estimated_progress: 5, complete: false)
Task.create(user_id: user.id, title: "finish focus rails app", progress: nil, estimated_progress: 10, complete: false)
Task.create(user_id: user.id, title: "get coffee", progress: nil, estimated_progress: 1, complete: false)

SubTask.create(task_id: task.id, title: "pickup my assignment", progress: nil, estimated_progress: 1, complete: true)
