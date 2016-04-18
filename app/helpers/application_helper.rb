module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def task_completed(task)
    task.complete ? "complete" : ""
  end
end
