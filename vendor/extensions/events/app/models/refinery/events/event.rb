module Refinery
  module Events
    class Event < Refinery::Core::BaseModel

    	attr_accessible :name, :date, :start_time, :place, :photo_id, :description, :position
      self.table_name = 'refinery_events'      
    
      acts_as_indexed :fields => [:name, :place, :description]

      validates :name, :presence => true
      validates_date :date
      validates_time :validates_time
      validates_presence_of :place
          
      belongs_to :photo, :class_name => '::Refinery::Image'
        
    end
  end
end
