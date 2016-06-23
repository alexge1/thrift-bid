class Item < ActiveRecord::Base

	#validations
	validates :description, presence: true
	validates :description, length: { maximum: 50 }
	validates :price, presence: true
	validates :price, numericality: { only_integer: true }

	has_many :bids
	has_many :bidded_users, through: :bids, source: "user"
	has_many :likes
	has_many :liked_users, through: :likes, source: "user"
	has_many :views
	has_many :viewed_users, through: :views, source: "user"

	has_one :order
	has_one :ordered_user, through: :order, source: "user"


	def self.check_item(iid)
		if iid == nil || iid == "" || !Item.exists?(id:iid)
        	return false
      	else
      		Item.find(iid).check_dead
      		return true
      	end
    end


	#not random selection so people see the same objects 
	#and bid all together.
	def self.next_items(user)
		nextItem = []
		count = 0
		Item.all.each do |item| 
			if !View.exists?(user:user,item:item) && !item.check_dead
				nextItem << item
				View.create(user:user,item:item)
				count += 1
				if count == 6
					return nextItem
				end
			end
		end
		return nextItem
	end


	def check_user_preferences
		
	end


	def check_dead
		if self.dead
			return true
		end
		if self.deadline != nil
			if self.deadline.past?()
				self.update(dead:true)
				last_bid = self.bids.last 
				Order.create(item:self,user:last_bid.user)
				return true
			end
		end
		return false
	end


	# def self.create(params)
	# 	Item.create("description":"stupid brian")
	# 	#("description": params[:description],"price": params[:price],"deadline": params[:deadline],"dead": params[:dead],"bids": params[:bids],"XXS": params[:XXS], "XS": params[:XS], "S": params[:S], "M": params[:M], "L": params[:L], "XL": params[:XL],"XXL": params[:XXL], "male": params[:male], "female": params[:female], "unisex": params[:unisex],"surprise": params[:surprise], "dress": params[:dress], "pant": params[:pant],"shirt": params[:shirt],"jacket": params[:jacket],"sweater": params[:sweater],"top": params[:top])
	# end

end
