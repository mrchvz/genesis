class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :category, foreign_key: true
      t.references :primary_attachment, foreign_key: { to_table: :attachments }
      t.references :primary_image, foreign_key: { to_table: :images }
      t.references :organization, foreign_key: true

      t.integer :external_price_in_cents, default: 0
      t.integer :form
      t.integer :internal_price_in_cents, default: 0
      t.string :key, index: true
      t.string :name
      t.text :long_description
      t.integer :position
      t.integer :primary_kind
      t.string :short_description
      t.integer :status
      t.string :url

      t.timestamps
    end
  end
end
