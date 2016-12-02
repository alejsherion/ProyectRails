Rails.application.routes.draw do

  get 'tasks/new'

  get 'tasks/index'

  get 'tasks/edit'

  get 'tasks/show'

  get 'tasks/update'

  get 'tasks/delete'

  root to: 'static_pages#welcome'
   devise_for :users, controllers: {
     sessions: 'users/sessions',
     passwords: 'users/passwords',
     registrations: 'users/registrations'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
