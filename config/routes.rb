EcomShop::Application.routes.draw do
  
  match "order/to_cart" => "order#to_cart", as: :to_cart
  match "store/category/:id" => "store#category", as: :category
  match "store/search/" => "store#search", as: :search, via: :post
  match "order/checkout" => "order#checkout", as: :checkout

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root to: "store#index"

end
