class ItemTestimonialMapping < ApplicationRecord
  belongs_to :item
  belongs_to :organization
  belongs_to :testimonial
end
