SuperZapatos::Application.routes.draw do
  resources :articles

  resources :stores

  namespace :services do
    get 'stores', to: 'stores#index', as: :stores_list
    get 'articles', to: 'articles#index', as: :articles_list
    get 'articles/stores/:id', to: 'stores#articles_by_store', as: :articles_by_store
  end

  # root :to => 'welcome#index'
end
