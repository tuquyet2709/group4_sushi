Rails.application.routes.draw do
  devise_for :companies, {
      session: "companies/sessions"
  }
  devise_for :admins, controllers:
      {
          sessions: "admins/sessions"
      }
  devise_for :students,
             controllers: {
                 registrations: "students/registrations",
                 sessions: "students/sessions"
             }
  scope "(:locale)", locale: /ja|en/ do
    root "static_pages#home"
    get "static_pages/home"
  end
end
