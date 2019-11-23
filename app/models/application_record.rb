class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_destroy :disconnect_belongs_to_relationships, prepend: true

  def disconnect_belongs_to_relationships
    belongs_to_reflections = self.class.reflections.select do |key, value|
      value.class == ActiveRecord::Reflection::BelongsToReflection
    end

    belongs_to_reflections.each do |key, value|
      self.send("#{key}=", nil)
    end

    self.save!(validate: false)
  end
end
