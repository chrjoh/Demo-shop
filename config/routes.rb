Shop::Application.routes.draw do
  resources :products

  resources :store, :only =>%w[index] do
    post 'add_to_cart', :on => :member
    delete 'empty_cart', :on => :collection
  end

 root :to => "store#index"
end
