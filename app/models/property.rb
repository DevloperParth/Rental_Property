class Property < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
  has_many :carts
  has_many :properties, through: :carts
	validates :price, presence: true
	validates :property_type ,presence: true
	validates :city ,presence: true
	validates :address ,presence: true  


end
