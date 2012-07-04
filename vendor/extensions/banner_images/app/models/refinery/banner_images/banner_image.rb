module Refinery
  module BannerImages
    class BannerImage < Refinery::Core::BaseModel
      self.table_name = 'refinery_banner_images'

      attr_accessible :name, :title, :content, :background_color, :link, :data_x, :data_y, :data_z, :data_rotate, :photo_id, :position

      acts_as_indexed :fields => [:name, :title, :content, :background_color, :link, :data_x, :data_y, :data_z, :data_rotate]

      validates :name, :presence => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
