Rails.application.routes.draw do
  resources :autor_livros
  resources :livros
  resources :autors
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"

  get "/update/livro", to: "pages#update_livro", as: "update_livro"
  get "/update/autor/:nome", to: "pages#update_autor", as: "update_autor"
  get "/update/autor_livro", to: "pages#update_autor_livro", as: "update_autor_livro"

  get "/get/livro", to: "pages#get_livro", as: "get_livros"
  get "/get/livro/:titulo", to: "pages#get_livro", as: "get_livro"
  get "/get/autor", to: "pages#get_autor", as: "get_autors"
  get "/get/autor/:nome", to: "pages#get_autor", as: "get_autor"
  get "/get/autor_livro", to: "pages#get_autor_livro", as: "get_autor_livros"
  get "/get/autor_livro/:titulo", to: "pages#get_autor_livro", as: "get_autor_livro"
end
