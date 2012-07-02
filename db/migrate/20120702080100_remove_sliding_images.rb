class RemoveSlidingImages < ActiveRecord::Migration
  def up
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-sliding_images"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/sliding_images/sliding_images"})
    end

    drop_table :refinery_sliding_images
  end

  def down
  end
end
