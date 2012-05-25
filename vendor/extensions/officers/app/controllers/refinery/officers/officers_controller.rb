module Refinery
  module Officers
    class OfficersController < ::ApplicationController

      before_filter :find_all_officers
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @officer in the line below:
        present(@page)
      end

      def show
        @officer = Officer.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @officer in the line below:
        present(@page)
      end

    protected

      def find_all_officers
        @officers = Officer.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/officers").first
      end

    end
  end
end
