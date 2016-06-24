class Bid < ActiveRecord::Base
  	belongs_to :user
	belongs_to :item

	validates :user, presence: true
	validates :item, presence: true
	validates :bid_amount, presence: true
	validates :bid_amount, numericality: true

	def self.create_super_bid(uid,iid,new_bid_price)
		like_or_error = Like.create_like(uid,iid)

		#like_or_error will be a like if there wasn't a Like previously.
		#For superbid, this should be the first time that you are viewing
		#the item and like_or_error should be a Like
		#Like.create_like() also does all the user/item error checking for you
		if !like_or_error.is_a? Like
			return {"message":"invalid user or item or like already exists"}
		else
			user = User.find(uid)
			item1 = Item.find(iid)
			#check if user has had ANY bids
			if Bid.exists?(user:user,item:item1)
				return {"message":"first bid by current user already exists"}
			else
				#check if previous bids on item
				if item1.bids.last != nil
					#check if bid is outdated
					if item1.bids.last.bid_amount >= new_bid_price
						return {"message":"outdated bid, please refresh"}
					end
					#if no problems set old bid to no longer highest
					item1.bids.last.highest_bid = false
					item1.bids.last.save()
				#if this will be first bid on item, then item price = bid price
				#check only if its outdate by being higher
				else
					if item1.price > new_bid_price
						return {"message":"outdated bid, please refresh"}
					end
					#first bid, start the countdown clock for the item
					item1.deadline = 1.day.from_now
					item1.save()
				end
				#create new bid as the highest
				bid = Bid.create(user:user,item:item1,bid_amount:new_bid_price,highest_bid:true)
				item1.price = bid.bid_amount
				item1.save()
				item = Item.find(iid)
				size_hash = {"xxs": item.xxs, "xs": item.xs, "s": item.s, "m": item.m, "l": item.l, "xl": item.xl,"xxl": item.xxl}
		        gender_hash = {"male": item.male, "female": item.female, "unisex": item.unisex}
		        tags_hash = {"dress": item.dress, "pant": item.pant,"shirt": item.shirt,"jacket": item.jacket,"sweater": item.sweater,"top": item.top}
		        preference_hash = {"tags": tags_hash,"sizes": size_hash, "gender": gender_hash, "surprise": item.surprise}
		        to_render = {"item_id": item.id, "description": item.description,"price": item.price,"deadline": item.deadline,"dead": item.dead,"bids": item.bids,"preferences": preference_hash}
  				return to_render
			end

		end
	end

	# return the item.
	def self.create_normal_bid(uid,iid,new_bid_price)
		like_or_error = Like.create_like(uid,iid)
		#converse. You want like_or_error to be an error. Means you have liked the
		#item before. Thus, a normal bid.
		if !like_or_error.is_a? Like
			user = User.find(uid)
			item = Item.find(iid)
			#check if previous bids on item
			if item.bids.last != nil
				#check if last bid was by user
				if item.bids.last.user == user
					return {"message":"you are already the highest bidder!"}
				end
				#check if bid is outdated
				if item.bids.last.bid_amount >= new_bid_price
					return {"message":"outdated bid, please refresh"}
				end
				#if no problems, set old bid to no longer highest
				item.bids.last.highest_bid = false
				item.bids.last.save()
			#if this will be first bid on item, then item price = bid price
			#check only if its outdate by being higher
			else
				if item.price > new_bid_price
					return {"message":"outdated bid, please refresh"}
				end
				#first bid, start the countdown clock for the item
				item.deadline = Time.current.tomorrow()
				item.save()
			end
			#create new bid as the highest
			bid = Bid.create(user:user,item:item,bid_amount:new_bid_price,highest_bid:true)
			item.price = bid.bid_amount
			item.save()
			size_hash = {"xxs": item.xxs, "xs": item.xs, "s": item.s, "m": item.m, "l": item.l, "xl": item.xl,"xxl": item.xxl}
	        gender_hash = {"male": item.male, "female": item.female, "unisex": item.unisex}
	        tags_hash = {"dress": item.dress, "pant": item.pant,"shirt": item.shirt,"jacket": item.jacket,"sweater": item.sweater,"top": item.top}
	        preference_hash = {"tags": tags_hash,"sizes": size_hash, "gender": gender_hash, "surprise": item.surprise}
	        to_render = {"item_id": item.id, "description": item.description,"price": item.price,"deadline": item.deadline,"dead": item.dead,"bids": item.bids,"preferences": preference_hash}
  			return to_render
		else
			return {"message":"invalid user or item or like doesn't exist"}
		end
	end




end
