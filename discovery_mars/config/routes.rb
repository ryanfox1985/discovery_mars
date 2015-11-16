Rails.application.routes.draw do

  root 'pages#index'

  post :track, to: 'pages#track', as: :track_pages

end
