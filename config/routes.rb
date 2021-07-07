Rails.application.routes.draw do
  namespace :reports do
    get "company_assets/show"
  end
end
