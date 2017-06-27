class Category < ApplicationRecord
  has_many :products
  scope :get_parents, -> {where(parent_id: nil)}
end
