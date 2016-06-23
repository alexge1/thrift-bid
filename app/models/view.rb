class View < ActiveRecord::Base

	belongs_to :user
	belongs_to :item

	validates :user, presence: true
	validates :item, presence: true


	def self.create_view(uid,iid)
  		if !User.check_user(uid)
  			return {"message":"invalid user"}
  		end
  		if !Item.check_item(iid)
	  		return {"message":"invalid item"}
	  	end
	  	user = User.find(uid)
		item = Item.find(iid)
		item.check_dead
		if View.exists?(user:user,item:item)
			return {"message":"view already exists"}
		else
			view = View.create(user:user,item:item)
			return view
		end
		
	end


end
