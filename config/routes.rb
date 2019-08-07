Rails.application.routes.draw do

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

end
