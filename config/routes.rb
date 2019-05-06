Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :candidatures
    resources :jobs
    resources :users
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
