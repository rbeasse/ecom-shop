EcomShop::Application.routes.draw do
  
  match "order/to_cart" => "order#to_cart", as: :to_cart
  match "store/category/:id" => "store#category", as: :category
  match "store/search/" => "store#search", as: :search, via: :get
  match "order/checkout" => "order#checkout", as: :checkout
  match "order/invoice" => "order#invoice", as: :invoice, via: :post
  match "about" => "store#about", as: :about
  match "contact" => "store#contact", as: :contact

  root to: "store#index"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config


end
