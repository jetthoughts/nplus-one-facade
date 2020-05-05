Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :films, to: 'films#index'

  namespace :sql_view, defaults: { format: :json }, constraints: { format: 'json' } do
    get :films, to: 'films#index'
  end

  namespace :facade, defaults: { format: :json }, constraints: { format: 'json' } do
    get :films, to: 'films#index'
  end
end
