class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.references :attachable, polymorphic: true
      t.references :organization, foreign_key: true
      t.integer :position
      t.string :title
      t.text :description
      t.string :payload

      t.timestamps
    end
  end
end
