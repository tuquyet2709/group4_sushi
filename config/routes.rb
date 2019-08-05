Rails.application.routes.draw do
  scope "(:locale)", locale: /ja|en/ do
    root "static_pages#home"
    get "static_pages/home"
  end
end
