class Payment < ActiveRecord::Base

	belongs_to :user

	# validates :user, presence: true
	# validates :cardholder, presence: true
 #    validates :cardnumber, presence: true
 	# validates :cardnumber, uniqueness: true
 #    validates :cvv, presence: true
 #    validates :provider, presence: true
 #    validates :month, presence: true
 #    validates :year, presence: true



end
