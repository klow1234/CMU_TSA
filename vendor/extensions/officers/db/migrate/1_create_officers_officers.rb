class CreateOfficersOfficers < ActiveRecord::Migration

  def up
    create_table :refinery_officers do |t|
      t.string :name
      t.string :position_name
      t.string :major
      t.text :blurb
      t.integer :graduating_year
      t.boolean :active
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-officers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/officers/officers"})
    end

    drop_table :refinery_officers

  end

end
