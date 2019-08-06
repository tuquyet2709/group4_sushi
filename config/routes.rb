Rails.application.routes.draw do

  get '/login', to: 'session#new'

  post '/login', to: 'session#create'

  delete '/logout', to: 'session#destroy'

  get 'companies/cpn_page'

  get 'students/std_page'

  get 'students/new'

  get 'companies/new'

  scope "(:locale)", locale:/ja|en/ do
    root "static_pages#home"
    get "static_pages/home"
  end

  resources :students
  resources :companies
end
