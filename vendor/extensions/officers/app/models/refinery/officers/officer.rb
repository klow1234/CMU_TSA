module Refinery
  module Officers
    class Officer < Refinery::Core::BaseModel
      self.table_name = 'refinery_officers'      
    
      acts_as_indexed :fields => [:name, :position, :major, :blurb]

      validates :name, :presence => true, :uniqueness => true
          
      belongs_to :photo, :class_name => '::Refinery::Image'
        
    end
  end
end
