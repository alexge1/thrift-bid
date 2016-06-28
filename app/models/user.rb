class User < ActiveRecord::Base


	#validations
	validates :fname, presence: true#, message: "Missing first name"
	validates :lname, presence: true#, message: "Missing last name"
	validates :email, presence: true#, message: "Missing email"
	validates :password, presence: true#, message: "Missing password"
	validates :email, uniqueness: true#, message: "Email already taken"

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
