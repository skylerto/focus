# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Task.create(title: "Study for AI", progress: nil, estimated_progress: 5, complete: false)
Task.create(title: "finish focus rails app", progress: nil, estimated_progress: 10, complete: false)
Task.create(title: "get coffee", progress: nil, estimated_progress: 1, complete: false)

SubTask.create(task_id: 1, title: "pickup my assignment", progress: nil, estimated_progress: 1, complete: true)
