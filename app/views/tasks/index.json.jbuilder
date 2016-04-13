json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :progress, :estimated_progress, :complete
  json.url task_url(task, format: :json)
end
