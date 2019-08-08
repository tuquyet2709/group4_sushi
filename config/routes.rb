Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'works/show'

  get '/login', to: 'session#new'

  post '/login', to: 'session#create'

  delete '/logout', to: 'session#destroy'

  scope "(:locale)", locale: /ja|en/ do
    root "static_pages#home"
    get "static_pages/home"
  end

  resources :students do
    member do
      get :works
    end
  end
  resources :companies do
    member do
      get :works
    end
  end
  resources :works

  get "/apply", to: "student_work_statuses#apply"
  get "/update_work", to: "student_work_statuses#update"
  get "/reply_request_work", to: "student_work_statuses#reply_request"

end
