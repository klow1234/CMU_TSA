module Refinery
  module SlidingImages
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::SlidingImages

      engine_name :refinery_sliding_images

      initializer "register refinerycms_sliding_images plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "sliding_images"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.sliding_images_admin_sliding_images_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/sliding_images/sliding_image',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::SlidingImages)
      end
    end
  end
end
