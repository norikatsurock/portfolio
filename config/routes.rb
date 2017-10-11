Rails.application.routes.draw do

  root "blogs#index"

  devise_for :users
  
  resources :blogs do
    resource :favorites, only: [:create, :destroy]
    resources :blogcomments
  end

  resources :categories
  resources :topics
  resources :albums
  # resources :photos

  get "/admin" => "admin#index", as: "admin"
  get "/admin/blogs" => "admin#adminblogs", as: "admin_blogs"
  get "/admin/albums" => "admin#adminalbums", as: "admin_albums"
  get "/admin/albums/:id/photos" => "photos#new", as: "admin_photos"
  post "admin/albums/:id/photos" => "photos#create", as: "photos"
  get "admin/albums/:id/photos/edit" => "photos#edit", as: "edit_photos"

  get "/blogs/category/:name" => "blogs#category", as: "category_blog"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
