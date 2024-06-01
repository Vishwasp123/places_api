class Place < ApplicationRecord
	validates :name, :description, :latitude, :city, :state, :country, presence: true

	has_many :images, as: :imageable

	#this add nested attributes in present model
 accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['url'].blank? }
end
