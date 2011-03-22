Shop::Application.routes.draw do

  match "/images/uploads/*path" => "gridfs#serve"
  resources :upload_datas

  resources :images

  resources :session do
    get 'logout', :on => :collection
  end
  resources :users

  resources :line_items

  resources :orders

  resources :products

  resources :store, :only =>%w[index] do
    post 'add_to_cart', :on => :member
    delete 'empty_cart', :on => :collection
  end

  root :to => "store#index"
end
