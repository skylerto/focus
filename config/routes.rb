Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  resources :tasks do
    resources :sub_tasks
  end
  root 'welcome#index'
end
