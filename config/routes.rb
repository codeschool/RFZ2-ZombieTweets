ZombieTweets::Application.routes.draw do
  root :to => "zombies#index"
  resources :zombies do
    resources :tweets, :weapons 
  end

  resources :tweets
end
