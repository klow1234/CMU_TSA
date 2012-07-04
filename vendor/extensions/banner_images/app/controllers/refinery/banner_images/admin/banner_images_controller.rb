module Refinery
  module BannerImages
    module Admin
      class BannerImagesController < ::Refinery::AdminController

        crudify :'refinery/banner_images/banner_image',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
