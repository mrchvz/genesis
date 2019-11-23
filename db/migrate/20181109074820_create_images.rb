class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true
      t.references :organization, foreign_key: true
      t.integer :position
      t.string :title
      t.text :description
      t.string :payload

      t.timestamps
    end

    add_reference :organizations, :primary_image, foreign_key: { to_table: :images }
  end
end
