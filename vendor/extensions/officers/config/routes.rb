Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :officers do
    resources :officers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :officers, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :officers, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
