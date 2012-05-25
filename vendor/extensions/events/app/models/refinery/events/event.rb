module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'      
    
      acts_as_indexed :fields => [:name, :place, :description]

      validates :name, :presence => true, :uniqueness => true
          
      belongs_to :photo, :class_name => '::Refinery::Image'
        
    end
  end
end
