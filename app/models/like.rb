class Like < ActiveRecord::Base

	  
	validates :user, presence: true
	validates :item, presence: true

	belongs_to :user
	belongs_to :item

	def self.create_like(uid,iid)

		#user and like are already checked in the controller
		user = User.find(uid)
		item = Item.find(iid)
		item.check_dead
		if Like.exists?(user:user,item:item)
			return {"message":"like already exists"}
		else
			like = Like.create(user:user,item:item)
			return like
		end

	end






end















