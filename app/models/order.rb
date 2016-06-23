class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :item
	belongs_to :payment
	
	belongs_to :ship_address, class_name: "Address"
	belongs_to :bill_address, class_name: "Address"

	# validates :user, presence: true
	# validates :item, presence: true
	# validates :payment, presence: true
	# validates :ship_address, presence: true
	# validates :bill_address, presence: true


end













