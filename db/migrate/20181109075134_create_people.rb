class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.references :organization, foreign_key: true
      t.references :primary_address, foreign_key: { to_table: :addresses }
      t.references :primary_email, foreign_key: { to_table: :emails }
      t.references :primary_image, foreign_key: { to_table: :images }
      t.references :primary_phone, foreign_key: { to_table: :phones }

      t.text :biography
      t.date :date_of_birth
      t.string :name
      t.integer :primary_kind
      t.integer :status

      t.timestamps
    end
  end
end
