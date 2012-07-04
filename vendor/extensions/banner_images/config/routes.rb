Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :banner_images do
    resources :banner_images, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :banner_images, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :banner_images, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
