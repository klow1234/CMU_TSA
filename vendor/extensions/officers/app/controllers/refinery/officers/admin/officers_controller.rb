module Refinery
  module Officers
    module Admin
      class OfficersController < ::Refinery::AdminController

        crudify :'refinery/officers/officer',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
