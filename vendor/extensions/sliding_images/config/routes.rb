Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :sliding_images do
    resources :sliding_images, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :sliding_images, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :sliding_images, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
