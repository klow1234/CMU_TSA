require 'refinerycms-core'

module Refinery
  autoload :BannerImagesGenerator, 'generators/refinery/banner_images_generator'

  module BannerImages
    require 'refinery/banner_images/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
