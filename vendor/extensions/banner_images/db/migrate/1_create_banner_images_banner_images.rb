class CreateBannerImagesBannerImages < ActiveRecord::Migration

  def up
    create_table :refinery_banner_images do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :background_color
      t.string :link
      t.string :data_x
      t.string :data_y
      t.string :data_z
      t.string :data_rotate
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-banner_images"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/banner_images/banner_images"})
    end

    drop_table :refinery_banner_images

  end

end
