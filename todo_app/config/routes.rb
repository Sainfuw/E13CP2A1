Rails.application.routes.draw do
  get 'todos/list'
  resources :todos
  get 'todos/:id/complete', to: 'todos#complete', as: 'complete_todo'
  root 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
