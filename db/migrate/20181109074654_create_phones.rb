class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.references :phoneable, polymorphic: true
      t.references :organization, foreign_key: true
      t.integer :position
      t.string :label
      t.integer :country_code
      t.string :number
      t.string :extension
      t.boolean :confirmed, default: false

      t.timestamps
    end

    add_reference :organizations, :primary_phone, foreign_key: { to_table: :phones }
  end
end
