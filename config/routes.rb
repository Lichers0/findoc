Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :companies, only: :index
      resources :brokers, only: :index
      resources :counterparties, only: :index
      resources :warehouses, only: :index

      namespace :documents do
        resources :goods_receipts, only: :new
      end
    end
  end

  namespace :reports do
    resource :company_assets, only: :show
  end

  namespace :documents do
    resources :goods_receipts
  end
end
