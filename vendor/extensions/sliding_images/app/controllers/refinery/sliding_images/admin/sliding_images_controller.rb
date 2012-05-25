module Refinery
  module SlidingImages
    module Admin
      class SlidingImagesController < ::Refinery::AdminController

        crudify :'refinery/sliding_images/sliding_image',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
