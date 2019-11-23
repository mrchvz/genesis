class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.references :organization, foreign_key: true
      t.references :person, foreign_key: true
      t.integer :status
      t.text :message
      t.date :desired_date
      t.integer :desired_time_range
      t.integer :preferred_conversation_channel
      t.integer :source

      t.timestamps
    end
  end
end
