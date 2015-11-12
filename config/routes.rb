Rails.application.routes.draw do

  devise_scope :user do
    # make some pretty URLs

    get "users/sign_in" => "sessions#new"
    get "users/sign_out" => "sessions#destroy"
    get "users/current_user" => "sessions#get_current_user"
    get "users/dashboard_data" => "users#dashboard_data"

    # rewrite the registrations URLs so they don't collide with my custom Users Controller
    get "signup" => "devise/registrations#new", :as => :new_user_registration
    put "update-registration" => "devise/registrations#update", :as => :update_user_registration
    delete "delete-registration" => "devise/registrations#destroy", :as => :delete_user_registration
    get "edit-registration" => "devise/registrations#edit", :as => :edit_user_registration
    get "cancel-registration" => "devise/registrations#cancel", :as => :cancel_user_registration
    post "create-registration" => "devise/registrations#create", :as => :user_registration
  end

  devise_for :users, controllers: { sessions: "sessions",
                                    registrations: "registrations" }

  resources :users

  resources :organizations

  resources :event_statuses

  resources :universities

  resources :events

  resources :event_types

  get 'get_universities' => 'universities#get_universities'
  get 'get_organizations' => 'organizations#get_organizations'
  get 'get_organization' => 'organizations#get_organization'
  get 'join_organization' => 'organizations#join_organization'
  get 'get_active_organizations' => 'organizations#get_active_organizations'

  get 'get_event_statuses' => 'event_statuses#get_event_statuses'
  get 'get_event_types' => 'event_types#get_event_types'

  get 'get_events' => 'events#get_events'
  get 'get_event_dropdowns' => 'events#get_event_dropdowns'

  get 'create_event' => 'events#create_event'
  get 'create_event_comment' => 'events#create_event_comment'

  root :to => 'users#welcome'

end
