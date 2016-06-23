class User < ActiveRecord::Base


	#validations
	validates :fname, presence: true
	validates :lname, presence: true
	validates :email, presence: true
	validates :password, presence: true
	validates :email, uniqueness: true

	has_many :bids
	has_many :bidded_items, through: :bids, source: "item"
	has_many :likes
	has_many :liked_items, through: :likes, source: "item"
	has_many :views
	has_many :viewed_items, through: :views, source: "item"
	has_many :orders
	has_many :ordered_items, through: :orders, source: "item"
	has_many :payments
	has_many :addresses


	def self.check_user(uid)

		if uid == nil || uid == "" || !User.exists?(id:uid)
        	return false
      	else
      		return true
      	end
    end


	
end
