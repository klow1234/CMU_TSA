module Refinery
  module Members
    class Member < Refinery::Core::BaseModel
      self.table_name = 'refinery_members'      
    
      attr_accessible :name, :grad_year, :major, :photo_id, :position

      acts_as_indexed :fields => [:name, :major]

      validates :name, :presence => true
          
      belongs_to :photo, :class_name => '::Refinery::Image'
        
    end
  end
end
