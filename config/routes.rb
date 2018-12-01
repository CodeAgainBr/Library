Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  get "/update/livro", to: "pages#update_livro", as: "update_livro"
  get "/update/autor", to: "pages#update_autor", as: "update_autor"
end
