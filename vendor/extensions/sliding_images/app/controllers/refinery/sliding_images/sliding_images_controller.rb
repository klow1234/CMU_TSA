module Refinery
  module SlidingImages
    class SlidingImagesController < ::ApplicationController

      before_filter :find_all_sliding_images
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @sliding_image in the line below:
        present(@page)
      end

      def show
        @sliding_image = SlidingImage.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @sliding_image in the line below:
        present(@page)
      end

    protected

      def find_all_sliding_images
        @sliding_images = SlidingImage.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/sliding_images").first
      end

    end
  end
end
