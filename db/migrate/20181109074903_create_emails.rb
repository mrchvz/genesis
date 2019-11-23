class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.references :emailable, polymorphic: true
      t.references :organization, foreign_key: true
      t.integer :position
      t.string :address
      t.boolean :confirmed, default: false

      t.timestamps
    end

    add_reference :organizations, :primary_email, foreign_key: { to_table: :emails }
  end
end
