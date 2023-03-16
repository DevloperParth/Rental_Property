class Property < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
  has_many :carts
  has_many :properties, through: :carts
	#scope:  flat -> where{ property_type: "Plot"}
 #if flate 
#	Property.flate
 #elsif RentalProperty
	#protected
	# byebug
	# before_initialize :find_flat 

	# def find_flat 
	# 	@properties = Property.where(property_type: "Plot")
	# end
end
