class CreateGalleryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :gallery_items do |t|
      t.string :name
      t.text :description
      t.string :image_filename
      t.string :category

      t.timestamps
    end
  end
end
