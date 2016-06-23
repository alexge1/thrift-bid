class Payment < ActiveRecord::Base

	belongs_to :user

	validates :user, presence: true
	validates :cardholder, presence: true
    validates :card_number, presence: true
    validates :CVV, presence: true
    validates :provider, presence: true
    validates :expire_month, presence: true
    validates :expire_year, presence: true



end
