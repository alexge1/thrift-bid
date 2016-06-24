class Address < ActiveRecord::Base
	belongs_to :user
	has_many :orders

	# validates :user, presence: true
	# validates :recipient, presence: true
	# validates :line1, presence: true
	# validates :city, presence: true
	# validates :state, presence: true
	# validates :state, length: {is:2}
	# validates :zip_code, presence: true
	# validates :zip_code, length: {is:5}

end
