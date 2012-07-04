module Refinery
  module BannerImages
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::BannerImages

      engine_name :refinery_banner_images

      initializer "register refinerycms_banner_images plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "banner_images"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.banner_images_admin_banner_images_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/banner_images/banner_image',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::BannerImages)
      end
    end
  end
end
