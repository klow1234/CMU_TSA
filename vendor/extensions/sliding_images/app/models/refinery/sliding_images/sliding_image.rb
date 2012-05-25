module Refinery
  module SlidingImages
    class SlidingImage < Refinery::Core::BaseModel
    	attr_accessible :name, :caption, :active, :photo_id, :position
      self.table_name = 'refinery_sliding_images'      
    
      acts_as_indexed :fields => [:name, :caption]

      validates :name, :presence => true, :uniqueness => true
          
      belongs_to :photo, :class_name => '::Refinery::Image'
        
    end
  end
end
