Rails.application.routes.draw do
get '/' => 'home#index'
get '/answer' => 'home#answer'

end
