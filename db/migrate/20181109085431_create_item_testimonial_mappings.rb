class CreateItemTestimonialMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :item_testimonial_mappings do |t|
      t.references :organization, foreign_key: true
      t.references :item, foreign_key: true
      t.references :testimonial, foreign_key: true

      t.timestamps
    end
  end
end
