CsAnalytics::Application.routes.draw do

  root :to  => 'activities#index'

  resources :activities do
    collection do
      get  'index', :as => 'index'
      post 'index', :as => 'update'
    end
  end  
end
