CsAnalytics::Application.routes.draw do

  root :to  => 'activities#dashboard'

  resources :activities do
    collection do
      get  'index', :as => 'index'
      post 'index', :as => 'update'
    end
  end

  match 'flow', :to => 'flow#index', :as => 'index_flow'
end
