module Refinery
  module Officers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Officers

      engine_name :refinery_officers

      initializer "register refinerycms_officers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "officers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.officers_admin_officers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/officers/officer',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Officers)
      end
    end
  end
end
