class Property < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	#scope:  flate -> where{status: flat}
 #if flate 
#	Property.flate
 #elsif RentalProperty
	#protected
end
