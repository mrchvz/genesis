class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.references :organization, foreign_key: true
      t.integer :position
      t.string :label
      t.string :line_1
      t.string :line_2
      t.string :line_3
      t.string :city
      t.string :zip_postal_code
      t.string :state_province_county
      t.integer :country_code
      t.boolean :confirmed, default: false

      t.timestamps
    end

    add_reference :organizations, :primary_address, foreign_key: { to_table: :addresses }
  end
end
