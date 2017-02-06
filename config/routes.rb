Rails.application.routes.draw do
  root "post#main"
  get 'post/main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
