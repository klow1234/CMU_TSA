# This migration comes from refinery_sliding_images (originally 1)
class CreateSlidingImagesSlidingImages < ActiveRecord::Migration

  def up
    create_table :refinery_sliding_images do |t|
      t.string :name
      t.text :caption
      t.boolean :active
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-sliding_images"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/sliding_images/sliding_images"})
    end

    drop_table :refinery_sliding_images

  end

end
