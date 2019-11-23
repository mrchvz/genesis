class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: :people }
      t.references :organization, foreign_key: true
      t.references :primary_image, foreign_key: { to_table: :images }
      t.integer :status
      t.string :title
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
  end
end
