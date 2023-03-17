class Cart < ApplicationRecord
  belongs_to :property
  belongs_to :user
  scope :details, ->(id) { where(user_id: id) }
end
